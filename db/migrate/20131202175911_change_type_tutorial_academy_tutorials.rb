class ChangeTypeTutorialAcademyTutorials < ActiveRecord::Migration
  def change
  	change_column :academy_tutorials, :text, :text
  end
end
