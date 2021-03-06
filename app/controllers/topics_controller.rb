class TopicsController < ApplicationController 
  def search
    redirect_to root_path if params[:search] == ""
    split_search = params[:search].split(/[[:blank:]]+/)
    @topics = [] 
    split_search.each do |search|
      next if search == "" 
      @topics += Topic.where(['subject LIKe ? or unit LIKE ? or summary LIKE ? or grade LIKE ? or reference LIKE ?',"%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
    end 
    @topics.uniq! 
  end
  def index
    @topics = Topic.all
  end
  def new
    @topic = current_user.topics.new
  end
  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  def show 
    @topic = Topic.find(params[:id])
    @coments = @topic.coments.includes(:user)
    if @topic.lesson.attached?
      fullfilename = rails_blob_path(@topic.lesson)
      @ext = File.extname(fullfilename).downcase
      if @ext== ".jpg" ||  @ext== ".jpeg" ||  @ext== ".png" ||  @ext== ".gif" 
        @Attachment_image = true
      else
        @Attachment_image = false
      end
    end
  end
  def edit
    @topic= Topic.find(params[:id])
  end
  def update
        @topic = Topic.find(params[:id])
        if @topic.update(topic_params)
          redirect_to topic_path, success: "編集に成功しました"
        else
          flash.now[:danger] = "編集に失敗しました"
          render :edit
        end
  end
  def destroy
    @topic = Topic.find(params[:id])
    if @topic.user_id == current_user.id
      @topic.delete
      @topic.lesson.purge
      redirect_to topics_path, success: "削除に成功しました"
    end
  end
  private
  def topic_params
    params.require(:topic).permit(:grade,:subject,:unit,:goal,:summary, :lesson ,:reference)
  end
end
