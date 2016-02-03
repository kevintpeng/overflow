class AnswersController < ApplicationController

  def create
    @question = Question.find params[:answer][:question_id]
    @answer = @question.answers.new answers_params
    @answer.user = current_user
    if @answer.save
      flash[:success] = "Your answer was added."
      redirect_to topic_question_path(:topic_id => @question.topic_id, :id => @answer.question_id)
    else
      redirect_to :back
    end

  end

  private
  def answers_params
    params.permit(:response,:question_id, :user_id, :explanation)
  end
end
