class ChangeCitiesDistricts < ActiveRecord::Migration
  def change
    rename_column(:cities, :country_id, :district_id)
    rename_table(:countries, :districts)
  end
end
