class AnswersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_answer, only: [:show,:update,:edit,:destroy]

    def new
      @question = Question.find(params[:question_id])
      @answer = @question.answers.new
    end

    def create
      @question = Question.find(params[:question_id])
      @answer = @question.answers.new(answer_params)
      if @answer.save
        redirect_to @question
      else
        render 'new'
      end
    end

    def edit
    end


    def update
      if @answer.update(answer_params)
        redirect_to @question
      else
        render 'edit'
      end
    end

    def destroy
      @answer.destroy
      redirect_to @question
    end

    private
    #strong parameters リクエストパラメターの検証（これがないとうまくいかないので注意）
    def answer_params
      params.require(:answer).permit(:content,:question_id)
    end

    #共通処理なので、before_actionで呼び出している
    def set_answer
      @question = Question.find(params[:question_id])
      @answer = @question.answers.find(params[:id])
    end
end
