class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :type, array: true, default: []

      t.timestamps
    end
  end
end
