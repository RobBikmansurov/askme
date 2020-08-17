class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    @user = User.find(@question.user_id)
    if @question.save
      redirect_to @user, notice: 'Задан новый вопрос'
    else
      render action: 'new'
    end

  end

  private

  def question_params
    params.require(:question).permit(:text, :user_id)
  end
end
