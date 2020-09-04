class QuestionsController < ApplicationController
  before_action :load_question, except: :create
  before_action :authorize_user, except: :create

  def create
    @question = Question.new(question_params)
    @user = User.find(@question.user_id)
    @question.author = current_user
    if @question.save
      redirect_to @user, notice: 'Задан новый вопрос'
    else
      render :edit
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @user, notice: 'Вопрос сохранен'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @user, notice: 'Вопрос удален :('
  end

  private

  def question_params
    # Защита от уязвимости: если текущий пользователь — адресат вопроса,
    # он может менять ответы на вопрос, ему доступно и поле :answer.
    if current_user.present? &&
       params[:question][:user_id].to_i == current_user.id
      params.require(:question).permit(:user_id, :text, :answer)
    else
      params.require(:question).permit(:user_id, :text)
    end
  end

  def load_question
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
  end

  def authorize_user
    reject_user unless @question.user == current_user
  end
end
