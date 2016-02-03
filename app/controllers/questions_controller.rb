class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.find_with_reputation(:votes, :all, {:order => "votes DESC"})
    @answer = Answer.new
  end
end
