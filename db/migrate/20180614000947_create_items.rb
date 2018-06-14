class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.belongs_to :user_id, foreign_key: true
      t.belongs_to :purchase_id, foreign_key: true
    end
  end
end
