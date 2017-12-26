class AddAccessKeyToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :access_key, :string
  end
end
