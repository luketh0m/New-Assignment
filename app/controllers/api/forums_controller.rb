class API::ForumsController < API::ApplicationController


  # GET /forums.json


  def index
    @forums = Forum.all
  end
end


# GET /forums/new
def new
  @forum = Forum.new

end

# GET /forums/1/edit
def edit
  @forum = Forum.find(params[:id])
end

# PATCH/PUT /forums/1
# PATCH/PUT /forums/1.json

def update
  @forum = Forum.find(params[:id])
  respond_to do |format|
    if @forum.update(forum_params)

      format.json {render :show, status: :ok, location: @forum}
    else

      format.json {render json: @forum.errors, status: :unprocessable_entity}
    end
  end
end

# POST /forums
# POST /forums.json
def create
  @forum = Forum.new(forum_params)
  respond_to do |f|

    if @forum.save


      f.json {render :show, status: :created, location: @forum}
    else

      f.json {render json: @forum.errors, status: :unprocessable_entity}

    end
  end

end

# GET /forums/1
# GET /forums/1.json
def show

  @forum = Forum.find(params[:id])
end

# DELETE /forums/1
# DELETE /forums/1.json
def destroy
  @forum = Forum.find(params[:id])
  @forum.destroy
  flash[:notice] = "Forum was successfuly deleted"
  redirect_to forums_path
end

def forum_params
  params.require(:forum).permit(:title, :author, :subject, :user_id, :comment, :comment_id)


end


