class ChangeColumnNameToSectionType < ActiveRecord::Migration[7.0]
  def change
    rename_column :sections, :type, :section_type
  end
end
