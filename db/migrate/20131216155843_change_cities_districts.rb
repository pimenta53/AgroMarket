class ChangeCitiesDistricts < ActiveRecord::Migration
  def change
    rename_table(:countries, :districts)
  end
end
