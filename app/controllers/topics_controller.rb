class TopicsController < ApplicationController



  def topics_params
    params.require(:topic).permit(:name, :program_id, :teacher_id)
  end
end
