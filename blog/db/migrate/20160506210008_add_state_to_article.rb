class AddStateToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :state, :string, default: "in_draft"
  end
end