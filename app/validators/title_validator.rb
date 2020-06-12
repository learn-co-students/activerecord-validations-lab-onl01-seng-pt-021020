class TitleValidator < ActiveModel::Validator 
    def validate(record)
        if record.title != nil
            unless record.title.include?("Won't Believe"||"Secret"||"Top"||"Guess")
                record.errors[:title] << "Only Clickbait-y Titles!"
            end
        end
    end
end