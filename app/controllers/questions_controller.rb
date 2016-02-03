class QuestionsController < ApplicationController
  def show
    @question = Topic.find(params[:topic_id]).questions.find(params[:id])
    @answer = Answer.new
  end
end
