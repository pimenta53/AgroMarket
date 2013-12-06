class AddDescriptionToAcademyTutorial < ActiveRecord::Migration
  def change
    add_column :academy_tutorials, :rapid_description, :string
  end
end
