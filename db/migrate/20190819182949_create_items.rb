class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.date :availability_date_start
      t.date :availability_date_end

      t.timestamps
    end
  end
end
