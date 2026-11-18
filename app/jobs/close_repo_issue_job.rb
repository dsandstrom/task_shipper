class CloseRepoIssueJob < RepoIssueJob
  def perform(*)
    super
    return unless issue && octokit

    octokit.close_issue github_repo_id.to_i, github_number
    octokit.add_comment github_repo_id.to_i, github_number,
                        issue.github_close_message(url)
  end
end
