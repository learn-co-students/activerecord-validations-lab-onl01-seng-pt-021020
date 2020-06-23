class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    bait = ["Won't Believe", "Secret", "Top", "Guess"]
    unless !title.nil? && bait.find{|w| title.include?(w)}
      errors.add(:title, "need more clickbait-y title")
    end
  end
end
