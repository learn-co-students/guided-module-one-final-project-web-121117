class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :line 
    end
  end
end
