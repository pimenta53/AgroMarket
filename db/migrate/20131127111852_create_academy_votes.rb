class CreateAcademyVotes < ActiveRecord::Migration
  def change
    create_table :academy_votes do |t|
      t.integer :vote
      t.integer :user_id,   :null => false
      t.integer :answer_id, :null => false

      t.timestamps
    end
  end
end
