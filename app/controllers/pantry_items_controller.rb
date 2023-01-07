# frozen_string_literal: true

class PantryItemsController < ApplicationController
  before_action :set_pantry_item, only: %i[show edit update destroy]

  def show; end

  def index
    @pantry_items = PantryItem.all
  end

  def new
    @pantry_item = PantryItem.new
  end

  def edit; end

  def create
    @pantry_item = PantryItem.new(pantry_item_params)
    if @pantry_item.save
      redirect_to pantry_items_path, notice: 'Pantry Item successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pantry_item.update(pantry_item_params)
      redirect_to pantry_items_path, notice: 'Pantry Item successfully edited!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pantry_item.destroy
    redirect_to pantry_items_path, notice: 'Pantry Item successfully deleted!'
  end

  private

  def set_pantry_item
    @pantry_item = PantryItem.find(params[:id])
  end

  def pantry_item_params
    params.require(:pantry_item).permit(:name, :quantity, :measurement, :expire_date)
  end
end
