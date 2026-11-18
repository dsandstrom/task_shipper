class ChangeGithubIdFromIssues < ActiveRecord::Migration[8.1]
  def up
    remove_index :issues, :github_id

    change_column :issues, :github_id, :float, limit: 24
    change_column :issues, :github_repo_id, :float, limit: 24

    add_index :issues, :github_id, unique: true
  end

  def down
    remove_index :issues, :github_id

    change_column :issues, :github_id,
                           'integer USING CAST(github_id AS integer)'
    change_column :issues, :github_repo_id,
                           'integer USING CAST(github_repo_id AS integer)'

    add_index :issues, :github_id, unique: true
  end
end
