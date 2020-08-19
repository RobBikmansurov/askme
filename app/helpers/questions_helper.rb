require 'sklonator'

module QuestionsHelper
  def questions_count(questions)
    Sklonator.num_to_str(questions.count, 'вопрос', 'вопроса', 'вопросов', with_num = true )
  end
end
