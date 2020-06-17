class TitleValidator < ActiveModel::Validator
  def validate(record)
    if record.title.nil?
      record.errors[:title] << 'Title is required.'
    else
      unless record.title.match?(/Won't Believe|Secret|Top \d+|Guess/)
        record.errors[:title] << "Title isn't clickbaity enough!"
      end
    end
  end
end