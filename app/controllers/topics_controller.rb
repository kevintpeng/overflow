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
     flash[:success] = 'Your topic has been added!'
     redirect_to @topic
    else
      flash[:notice] = "The topic was not added :("
     redirect_to root_path
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @questions = @topic.questions
  end
end
