class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    if @tweet.save
      flash[:notice] = 'つぶやきが投稿されました'
      redirect_to '/'
    else
      render 'new'
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    flash[:notice] = 'つぶやきが削除されました'
    redirect_to '/'
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(message: params[:tweet][:message])
      flash[:notice] = '内容が編集されました'
      redirect_to '/'
    else
      render 'edit'
    end
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end

end
