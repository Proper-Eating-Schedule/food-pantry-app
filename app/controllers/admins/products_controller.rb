# frozen_string_literal: true

module Admins
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[edit update destroy]
    before_action :set_category, only: %i[edit new update create]

    def new
      @product = Product.new
    end

    def edit; end

    def create
      @product = Product.new(product_params.merge(category_id: params[:category_id]))
      if @product.save
        redirect_to admins_category_path(category_id), notice: 'Product successfully added!'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @product.update(product_params)
        redirect_to admins_category_path(category_id), notice: 'Product successfully edited!'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      redirect_to admins_category_path(category_id), notice: 'Product successfully deleted!'
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name)
    end

    def category_id
      @category_id ||= params[:category_id].to_i
    end

    def set_category
      @category = Category.find(category_id)
    end
  end
end
