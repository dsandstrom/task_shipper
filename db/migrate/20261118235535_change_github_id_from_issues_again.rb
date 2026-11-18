class ChangeGithubIdFromIssuesAgain < ActiveRecord::Migration[8.1]
  def up
    remove_index :issues, :github_id

    change_column :issues, :github_id, :bigint
    change_column :issues, :github_repo_id, :bigint

    add_index :issues, :github_id, unique: true
  end

  def down
    remove_index :issues, :github_id

    change_column :issues, :github_id, :float, limit: 24
    change_column :issues, :github_repo_id, :float, limit: 24

    add_index :issues, :github_id, unique: true
  end
end
