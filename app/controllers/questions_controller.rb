class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    # FIND A SORT BY REPUTATION
    @answers = @question.answers.find_with_reputation(:votes, :all, {:order => "votes DESC"})
    @answer = Answer.new
  end

  private

  def question_params
    params.require(:question).permit(:statement)
  end
end
