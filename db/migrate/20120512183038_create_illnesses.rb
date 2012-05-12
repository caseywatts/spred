class CreateIllnesses < ActiveRecord::Migration
  def change
    create_table :illnesses do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
