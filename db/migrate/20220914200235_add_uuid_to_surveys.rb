class AddUuidToSurveys < ActiveRecord::Migration[7.0]
  def change
    add_column :surveys, :uuid, :string
  end
end
