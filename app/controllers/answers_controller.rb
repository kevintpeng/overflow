class AnswersController < ApplicationController

  def create
    answer_params = params[:answer]
    @question = Question.find answer_params[:question_id]

    # TODO should refactor into standard strong params
    @answer = @question.answers.new
    @answer.response = answer_params[:response]
    @answer.explanation = answer_params[:explanation]
    @answer.user = current_user
    if @answer.save
      flash[:success] = "Your answer was added."
      # redirect back to the question
      redirect_to question_path(:id => @answer.question_id)
    else
      redirect_to :back
    end
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @answer = Answer.find(params[:id])
    @answer.add_or_update_evaluation :votes, value, current_user
    redirect_to :back, notice: "Thank you for voting"
  end
end
