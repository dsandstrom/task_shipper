class ReopenRepoIssueJob < RepoIssueJob
  def perform(*)
    super
    return unless issue && octokit

    octokit.reopen_issue github_repo_id.to_i, github_number
    octokit.add_comment github_repo_id.to_i, github_number,
                        issue.github_reopen_message(url)
  end
end
