#encoding: utf-8
class Academy::VotesController < ApplicationController


  #only logged user can vote (carefull with url chenges)

  def up_vote
    answer = Academy::Answer.find(params[:answer])
    vote = Academy::Vote.where(:user_id => current_user.id, :answer_id => answer.id)
    
    if vote.empty?
      answer.vote_up
      vote = Academy::Vote.new(:vote => 1, :user_id => current_user.id, :answer_id => answer.id)
      vote.save
    elsif vote.first.vote == -1
      answer.vote_up_from_down
      Academy::Vote.update_votes( current_user.id, answer.id, 1)
    end
    redirect_to answer.question
  end

  def down_vote
    answer = Academy::Answer.find(params[:answer])
    
    vote = Academy::Vote.where(:user_id => current_user.id, :answer_id => answer.id)

    if vote.empty?
      answer.vote_down
      vote = Academy::Vote.new(:vote => -1, :user_id => current_user.id, :answer_id => answer.id)
      vote.save
    elsif vote.first.vote == 1
      answer.vote_down_from_up
      Academy::Vote.update_votes( current_user.id, answer.id, -1)
    end
    redirect_to answer.question
  end

end
