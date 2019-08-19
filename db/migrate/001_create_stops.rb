class CreateStops < ActiveRecord::Migration[4.2]
  def change
    create_table :stops do |t|
      t.string :name
    end
  end
end
