class CreateAcademyVotes < ActiveRecord::Migration
  def change
    create_table :academy_votes do |t|
      t.integer :vote
      t.integer :user_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
