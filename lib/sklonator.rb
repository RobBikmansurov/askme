# нужный падеж исчислимого
module Sklonator
  def self.num_to_str(num, word1, word4, words, with_num = false)
    prefix = "#{num} " if with_num
    return "#{prefix}#{words}" if (num / 10 % 10) == 1 # (10-19)

    case num % 10
    when 1
      "#{prefix}#{word1}"
    when 2..4
      "#{prefix}#{word4}"
    else
      "#{prefix}#{words}"
    end
  end
end
