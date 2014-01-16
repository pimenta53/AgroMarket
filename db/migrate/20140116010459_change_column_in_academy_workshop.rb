class ChangeColumnInAcademyWorkshop < ActiveRecord::Migration
  def change
    change_column :academy_workshops, :description, :text
  end
end
