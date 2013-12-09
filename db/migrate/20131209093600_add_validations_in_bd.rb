class AddValidationsInBd < ActiveRecord::Migration
  def change
    # academy_answers
    change_column :academy_answers, :question_id, :integer, :null => false
    change_column :academy_answers, :user_id,     :integer, :null => false
    change_column :academy_answers, :up,          :integer, :default => 0
    change_column :academy_answers, :down,        :integer, :default => 0
    change_column :academy_answers, :is_deleted,  :boolean,  :default => false
    change_column :academy_answers, :text,        :text

    # academy_questions
    change_column :academy_questions, :user_id,     :integer, :null => false
    change_column :academy_questions, :category_id, :integer, :null => false
    change_column :academy_questions, :is_deleted,  :boolean, :default => false
    change_column :academy_questions, :title,       :string,  :null => false
    change_column :academy_questions, :text,        :text

    change_column :academy_tutorial_images, :tutorial_id, :integer, :null => false
    change_column :academy_tutorial_images, :is_deleted,  :boolean, :default => false

    # academy_tutorials
    change_column :academy_tutorials, :category_id, :integer, :null => false
    change_column :academy_tutorials, :user_id,     :integer, :null => false
    change_column :academy_tutorials, :aproved,     :boolean, :default => false
    rename_column :academy_tutorials, :is_delected, :is_deleted
    change_column :academy_tutorials, :is_deleted, :boolean, :default => false

    # academy_votes
    change_column :academy_votes, :user_id,   :integer, :null => false
    change_column :academy_votes, :answer_id, :integer, :null => false

    # academy_workshop_registrations
    change_column :academy_workshop_registrations, :workshop_id,  :integer, :null => false
    change_column :academy_workshop_registrations, :user_id,      :integer, :null => false
    change_column :academy_workshop_registrations, :is_deleted,   :boolean, :default => false

    # academy_workshops
    change_column :academy_workshops, :user_id,     :integer, :null => false
    rename_column :academy_workshops, :is_delected, :is_deleted
    change_column :academy_workshops, :is_deleted,  :boolean, :default => false

    # ad_images
    change_column :ad_images, :ad_id, :integer, :null => false

    # ads
    change_column :ads, :type_price_id, :integer, :null => false
    change_column :ads, :city_id,       :integer, :null => false
    change_column :ads, :user_id,       :integer, :null => false
    change_column :ads, :category_id,   :integer, :null => false
    change_column :ads, :page_views,    :integer, :default => 0
    change_column :ads, :is_deleted,    :boolean, :default => false
    change_column :ads, :is_active,     :boolean, :default => false

    # drop unused tables
    #drop_table :answers
    #drop_table :questions
    #drop_table :tutorial_images
    #drop_table :tutorials
    #drop_table :votes
    #drop_table :workshops

  end
end
