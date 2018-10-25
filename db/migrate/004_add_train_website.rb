class AddTrainWebsite < ActiveRecord::Migration
  def change
    add_column :trains, :website, :string
  end
end
