class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
      if params[:city_id]
        @city = City.find_by(id: params[:city_id])
        if @city.nil?
          redirect_to cities_path, alert: "City not found"
        else
          @categories = @city.categories
        end
      else
        @categories = Category.all
      end
    end

    def show
      if params[:city_id]
        @city = City.find_by(id: params[:city_id])
        @category = Category.find_by(id: params[:id])
        @branches = Branch.where(:city_id => @city.id, :category_id => @category.id).all
        if @category.nil?
          redirect_to city_categories_path(@city), alert: "Category not found"
        end
      else
        @category = Category.find(params[:id])
      end
    end

    def new
      @category = Category.new
      @city =  City.find_by(id: params[:city_id])
    end

    def create
      @category = Category.new(category_params)
      @city =  City.find_by(id: params[:city_id])
      if @category.save
        @city.categories << @category
        redirect_to city_category_path(@city, @category)
        flash[:success] = "Category successfully created!"
      else
        flash[:alert] = "Error. Fields cannot be left blank"
        render :new
      end
    end

    def edit
      if params[:city_id]
        city = City.find_by(id: params[:city_id])
        if city.nil?
          redirect_to cities_path, alert: "City not found"
        else
          @category = city.categories.find_by(id: params[:id])
          redirect_to city_categories_path(city), alert: "Category not found" if @category.nil?
        end
      else
        @category = Category.find(params[:id])
      end
    end

    def update
      @category = Category.find(params[:id])
      @category.update(category_params)
      if @category.save
        redirect_to @category
      else
        render :edit
      end
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      flash[:notice] = "Category deleted."
      redirect_to city_categories_path
      #because category is delete it loses it's association w/ city.
      #Resulting in "City not Found Error"
    end

    private

    def category_params
      params.require(:category).permit(:name, :city)
    end
  end
