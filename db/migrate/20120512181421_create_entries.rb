class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.datetime :entrytime
      t.integer :sickstatus
      t.boolean :fever
      t.boolean :sorethroat
      t.boolean :runnynose
      t.boolean :stomachache
      t.boolean :other
      t.boolean :medication
      t.integer :user_id

      t.timestamps
    end
  end
end
