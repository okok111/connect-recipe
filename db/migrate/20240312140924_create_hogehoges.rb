class CreateHogehoges < ActiveRecord::Migration[6.1]
  def change
    create_table :hogehoges do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :hoge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
