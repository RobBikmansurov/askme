require 'sklonator'

module QuestionsHelper
  def questions_count(questions, empty_text, prefix_text)
    return empty_text if questions.count.zero?

    text = Sklonator.num_to_str(questions.count, 'вопрос', 'вопроса', 'вопросов', true)
    "#{prefix_text} #{text}"
  end

  def question_author(author)
    return 'Автор вопроса: аноним' if author.blank?

    "Автор вопроса: <a href = '#{user_path(author)}' > #{author.name}</a>".html_safe
  end
end
