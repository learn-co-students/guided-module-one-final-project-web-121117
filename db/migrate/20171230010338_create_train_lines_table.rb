class CreateTrainLinesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :train_lines do |table|
      table.string :train_line
    end
  end
end
