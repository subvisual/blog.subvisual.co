class Github::Adapter
  def initialize(post)
    @post = post
  end

  def create_pr
    new_branch_sha = create_branch(master_sha)
    new_tree_sha = create_tree(new_branch_sha)
    create_commit(new_tree_sha, new_branch_sha)
    create_pull_request
  end

  def update_pr
    if branch_sha
      new_tree_sha = create_tree(branch_sha)
      create_commit(new_tree_sha, branch_sha)
    else
      create_pr
    end
  end

  def close_pr
    client.delete_branch(repo, branch_name)
  end

  private

  attr_reader :post

  def master_sha
    @_master_sha ||= client.ref(repo, "heads/master").object.sha
  end

  def branch_sha
    updated_branch_sha || deprecated_branch_sha
  end

  def updated_branch_sha
    @_branch_sha ||= client.ref(repo, "heads/#{branch_name}").object.sha
  rescue Octokit::NotFound
    false
  end

  def deprecated_branch_sha
    @_branch_sha ||= client.ref(repo, "heads/#{deprecated_branch_name}").object.sha
  rescue Octokit::NotFound
    false
  end

  def create_branch(sha)
    client.create_ref(repo, "heads/#{branch_name}", sha).object.sha
  end

  def create_tree(base_sha)
    client.create_tree(
      repo,
      [{ path: "post-#{post.id}.markdown", mode: "100644", type: "blob", content: post.body }],
      base_tree: base_sha,
    ).sha
  end

  def create_commit(tree_sha, branch_sha)
    new_commit_sha = client.create_commit(repo, post.title, tree_sha, branch_sha).sha
    client.update_ref(repo, "heads/#{branch_name}", new_commit_sha)
  end

  def create_pull_request
    client.create_pull_request(repo, "refs/heads/master", "refs/heads/#{branch_name}", post.title, "")
  end

  def branch_name
    @_branch_name ||= "#{post.author.name.parameterize}-#{post.id}"
  end

  def deprecated_branch_name
    @_branch_name ||= post.title.parameterize
  end

  def client
    @_client ||= Octokit.client
  end

  def repo
    @_repo ||= ENV.fetch("GH_CONTENT_REPO")
  end
end
