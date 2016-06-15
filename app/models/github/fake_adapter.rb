class Github::FakeAdapter
  def initialize(_post); end

  def create_pr
    Rails.logger.debug('Create a PR')
  end

  def update_pr
    Rails.logger.debug('Update the PR')
  end

  def close_pr
    Rails.logger.debug('Close the PR')
  end
end
