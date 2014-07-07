class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.belongs_to  :user
      t.string :content
      t.timestamps
    end
  end
end
