class ComentsController < ApplicationController
    def create
        @topic = Topic.find(params[:topic_id])
        @coment = @topic.coments.create(coment_params)
       redirect_to topic_path(@topic)
    end
    def coment_params
        params.require(:coment).permit(:content,:topic_id,).merge(user_id: current_user.id)
    end
end
