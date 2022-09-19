class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.string :email
      t.string :token
      t.integer :status
      t.references :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
