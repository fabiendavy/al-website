class RemoveTypeColumnToTags < ActiveRecord::Migration[6.0]
  def change
    remove_column :tags, :type
  end
end
