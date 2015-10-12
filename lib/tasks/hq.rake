namespace :hq do
  desc 'Fills out User#hq_id field'
  task update_ids: :environment do
    client = Headquarters::Client::Members.new(client_id: ENV['HQ_APP_ID'], client_secret: ENV['HQ_APP_SECRET'])

    hq_members = client.all.map do |member|
      User.where(email: member['email']).update_all(hq_id: member['id'])
    end
  end
end
