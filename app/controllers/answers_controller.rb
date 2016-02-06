class AnswersController < ApplicationController

  def create
    @question = Question.find params[:answer][:question_id]

    # TODO should refactor into standard strong params
    @answer = @question.answers.new answer_params
    @answer.user = current_user
    if @answer.save
      flash[:success] = "Your answer was added."
      # redirect back to the question
      redirect_to question_path(:id => @answer.question_id)
    else
      redirect_to :back
    end
  end

  # adjusts answer's score
  def vote
    value = params[:type] == "up" ? 1 : -1
    @answer = Answer.find(params[:id])
    @answer.add_or_update_evaluation :votes, value, current_user
    redirect_to :back, notice: "Thank you for voting"
  end

  private

  def answer_params
    params.require(:answer).permit(:response, :explanation)
  end

end
