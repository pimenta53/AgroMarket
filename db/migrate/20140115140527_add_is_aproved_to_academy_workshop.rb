class AddIsAprovedToAcademyWorkshop < ActiveRecord::Migration
  def change
    add_column :academy_workshops, :is_aproved, :boolean, :default => false
  end
end
