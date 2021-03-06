module TagsHelper
  def tag_cloud_font_size(tags, tag)
    min, max = tags.map{|a| a[1]}.minmax
    font_scale = (Tag::FONT_SIZE_MAX - Tag::FONT_SIZE_MIN) / (max - min + 1)
    (tag[1] * font_scale + Tag::FONT_SIZE_MIN).to_i
  end
end
