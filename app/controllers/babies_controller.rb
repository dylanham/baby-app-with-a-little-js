class BabiesController < ApplicationController
  before_action :set_baby, only: [:show, :edit, :update]

  def index
    @babies = Baby.all
  end

  def show
  end

  def new
    @baby = Baby.new
  end

  def create
    baby = Baby.new(baby_params)
    if baby.save
      flash[:notice] = 'Congratulations'
      redirect_to babies_path
    else
      @baby = baby
      render :new
    end
  end

  def edit
  end

  def update
    if @baby.update(baby_params)
      flash[:notice] = 'You changed your baby\'s name'
      redirect_to babies_path
    else
      render :edit
    end
  end

  def destroy
    baby = Baby.find(params[:id])
    baby.destroy
    flash[:notice] = 'Your baby is annonymous'
    redirect_to babies_path
  end

  private

  def baby_params
    params.require(:baby).permit(:name, :length, :weight)
  end

  def set_baby
    @baby = Baby.find(params[:id])
  end

end
