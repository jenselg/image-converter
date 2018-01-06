class CreateConvertImages < ActiveRecord::Migration[5.1]
  def change
    create_table :convert_images do |t|
      t.text :data
      t.string :access_key

      t.timestamps
    end
  end
end
