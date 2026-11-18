class OpenRepoIssueJob < RepoIssueJob
  def perform(*)
    super
    return unless issue && octokit

    octokit.add_comment github_repo_id.to_i, github_number,
                        issue.github_open_message(url)
  end
end
