class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true, title: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "Please choose 'Fiction' or 'Non-Fiction'."}
    #validates_with TitleValidator
end