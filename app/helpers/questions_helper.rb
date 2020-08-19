require 'sklonator'

module QuestionsHelper
  def questions_count(questions)
    return 'Нет вопросов' if questions.count.zero?

    Sklonator.num_to_str(questions.count, 'вопрос', 'вопроса', 'вопросов', true)
  end
end
