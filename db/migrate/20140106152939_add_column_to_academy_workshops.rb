class AddColumnToAcademyWorkshops < ActiveRecord::Migration
  def change
    add_column :academy_workshops, :title, :string
  end
end
