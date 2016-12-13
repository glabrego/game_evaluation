class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  def index
    @evaluations = Evaluation.all
  end

  def show
  end

  def new
    @evaluation = Evaluation.new
    @game = Game.find params[:game_id]
  end

  def edit
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.game_id = params[:game_id]
    @evaluation.save
    redirect_to game_evaluation_path(@evaluation.game_id, @evaluation)
  end

  def update
    @evaluation.update(evaluation_params)
    redirect_to evaluation_path(@evaluation)
  end

  def destroy
    @evaluation.destroy
    redirect_to root_path, alert: 'Evaluation Destroyed.'
  end

  private
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    def evaluation_params
      params.require(:evaluation)
            .permit(:r1, :r2, :r3, :r4, :r5, :r6, :r7, :r8, :r9, :r10, :r11, :r12,
                    :r13, :r14, :r15, :r16, :r17, :r18, :r19, :r20, :r21, :r22, :game_id)
    end
end
