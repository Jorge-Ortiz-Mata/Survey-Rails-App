class ChangeDatatypeToSectionType < ActiveRecord::Migration[7.0]
  def change
    change_column :sections, :section_type, :integer, using: 'section_type::integer', default: 0
  end
end
