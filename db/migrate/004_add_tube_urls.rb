class AddTubeUrls < ActiveRecord::Migration[4.2]
  def change
    add_column :tubes, :url, :string
  end
end
