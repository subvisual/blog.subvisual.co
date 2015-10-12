class OauthUser
  def find_or_create_from_oauth_hash(auth_hash)
    return unless %w(headquarters).include?(auth_hash.provider.to_s)

    public_send(auth_hash.provider, auth_hash)
  end

  def headquarters(auth_hash)
    data = hq_user_data(auth_hash.info.email)

    User.where(hq_id: data['id']).first_or_initialize.tap do |user|
      user.hq_id = data['id']
      user.email = data['email']
      user.name = data['name']
      user.save!
    end
  end

  private

  def hq_user_data(email)
    Headquarters::Client::Members.new(
      client_id: ENV['HQ_APP_ID'],
      client_secret: ENV['HQ_APP_SECRET']
    ).search(email).first
  end
end
