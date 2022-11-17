# frozen_string_literal: true

module Admins
  class CategoriesController < ApplicationController
    before_action :set_category, only: %i[show edit update destroy]

    def show; end

    def index
      @categories = Category.all
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
        render :new
      end
    end

    def update
      if @category.update(category_params)
        redirect_to admins_categories_path, notice: 'Category successfully edited!'
      else
        render :edit
      end
    end

    def destroy
      @category.destroy
      redirect_to admins_categories_path
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
