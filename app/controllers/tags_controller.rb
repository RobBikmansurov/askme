class TagsController < ApplicationController
  before_action :load_tag, only: :show

  def show
    @questions = @tag.questions
    redirect_to root_path, alert: "Нет вопросов с тегом #{params[:name]}!" if @questions.blank?
  end

  private

  def load_tag
    @tag = Tag.find_by!(name: params[:name])
  end
end
