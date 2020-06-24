class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait
  
  @@clickbait_words = [/Won't Believe/, /Secret/, /Top [number]/, /Guess/]
  
  def click_bait
    if @@clickbait_words.none? {|i| i.match title}
      errors.add(:title, "not clickbait")
    end
  end
end
