class RemoveCoverFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :cover_file_name, :string
    remove_column :articles, :cover_content_type, :string
    remove_column :articles, :cover_file_size, :integer
    remove_column :articles, :cover_updated_at, :datetime
  end
end
