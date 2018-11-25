class QuestionsController < ApplicationController
    #before_actionで各メソッドを呼び出す前にメソッドを呼び出す
      #onlyでどのメソッドで呼び出すか制限をかける
      before_action :set_question, only: [:show,:update,:edit,:destroy]

      def index
        @questions = Question.all
      end

      def show
      end

      def new
        @question = Question.new
      end

      def create
        @question =Question.create(question_params)
        if @question.save
          redirect_to @question
        else
          render 'new'
        end
      end

      def edit
      end

      def update
        if @question.update(question_params)
          redirect_to @question
        else
          render 'edit'
        end
      end

      def destroy
        @question.destroy
        redirect_to questions_path
      end

      private
      #strong parameters リクエストパラメターの検証（これがないとうまくいかないので注意）
      def question_params
        params.require(:question).permit(:title,:content)
      end

      #共通処理なので、before_actionで呼び出している
      def set_question
       #特定データの取得
        @question = Question.find(params[:id])
      end
end
