class CreateLongUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :long_urls do |t|
      t.string :url

      t.timestamps
    end
  end
end
