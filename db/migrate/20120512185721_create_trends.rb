class CreateTrends < ActiveRecord::Migration
  def change
    create_table :trends do |t|

      t.timestamps
    end
  end
end
