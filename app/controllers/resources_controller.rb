# change - tidy uo, chnage var names, refactor
class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  #env vars istead of this
  Stripe.api_key = 'sk_test_DBbfhkIFmcyICu08qPMnsWlS'

  def index
    @resources = Resource.all
  end

  def show
    #gets the id of the org this is attatched to (named badly change later)
    @cur_resource_id = Resource.find(params[:id]).book_id
    #gets the user(organizer) id of the user that owns the org 
    @user_id_of_org = Book.find(@cur_resource_id).user_id
    #@book_id_test_here = Book.where(["id = ?", 110])
    @owner = User.find(@user_id_of_org)
    #gets the organization that the current resource is attatched to
    @book = Book.find(@cur_resource_id)
    # gets ALL the resources assigned to the current resources org
    @all_resources_with_same_book_id = Resource.where(["book_id = ?", @cur_resource_id])
    #below 3 variables used for the topbar links to to other resources
    @other_res_1 = @all_resources_with_same_book_id.first
    @other_res_2 = @all_resources_with_same_book_id.second
    @other_res_3 = @all_resources_with_same_book_id.last

    #resources for other orgs (gets 5 random)
    @other_resources_owned_by_dif_org = Resource.where(["book_id != ?", @cur_resource_id]).limit(4).order("RANDOM()")
  end

  def new
    @resource = Resource.new(:temp_field => params[:tittleP])
    @categories = Category.all.map { |c| [c.name, c.id] }
    @books = Book.all.map { |c| [c.title, c.id] }
  end

  def edit
    @books = Book.all.map { |c| [c.title, c.id] }

  end

  def create
    @resource = Resource.new(resource_params)
    @resource.book_id = params[:book_id]
    @resource.image_file = params[:file2]

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:tittle, :reason, :price, :image_file)
    end
end
