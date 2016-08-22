class OauthUser
  def find_or_create_from_oauth_hash(provider, info)
    return unless %i(headquarters).include?(provider)

    public_send(provider, info.email)
  end

  def headquarters(email)
    data = hq_user_data(email)
    User.where(hq_id: data["id"]).first_or_initialize.tap do |user|
      user.update_attributes(data.slice("email", "name"))
    end
  end

  private

  def hq_user_data(email)
    Headquarters::Client::Members.new(
      client_id: ENV["HQ_APP_ID"],
      client_secret: ENV["HQ_APP_SECRET"],
    ).search(email).first
  end
end
