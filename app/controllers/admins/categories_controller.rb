# frozen_string_literal: true

module Admins
  class CategoriesController < BaseController
    include Pagy::Backend
    before_action :set_category, only: %i[show edit update destroy]
    def show
      @pagy, @products = pagy(Product.where(category_id: params[:id]))
    end

    def index
      @pagy, @categories = pagy(Category.all, items: 10)
    end

    def new
      @category = Category.new
    end

    def edit; end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admins_categories_path, notice: 'Category successfully created!'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @category.update(category_params)
        redirect_to admins_categories_path, notice: 'Category successfully edited!'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @category.destroy
      redirect_to admins_categories_path, notice: 'Category successfully deleted!'
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
