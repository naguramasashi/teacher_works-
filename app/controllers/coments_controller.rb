class ComentsController < ApplicationController
    def create
        @topic = Topic.find(params[:topic_id])
        @coment = @topic.coments.create(coment_params)
       redirect_to topic_path(@topic)
    end
    def destroy
        coment=Coment.find_by(id: params[:id],topic_id: params[:topic_id],)
        coment.destroy
        redirect_to topics_path, success: "コメント削除しました"
    end
    def coment_params
        params.require(:coment).permit(:content,:topic_id,).merge(user_id: current_user.id)
    end
    
end
