class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params)
    if @topic.save
     flash[:success] = 'Your definition has been added!'
     redirect_to @topic
    else
     render 'new'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @questions = @topic.questions
  end
end
