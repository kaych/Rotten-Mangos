class Movie < ActiveRecord::Base

  has_many :reviews

  mount_uploader :image, PosterImageUploader

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  # validates :poster_image_url, presence: true
  validates :release_date, presence: true
  validate :release_date_is_in_the_past 

  def review_average
    if reviews.size > 0
      reviews.sum(:rating_out_of_ten)/reviews.size
    else
      "(There are no reviews for this movie yet!)"
    end
  end

  def self.search(title, director, runtime_in_minutes)
    search_result = self.all 
    search_result = search_result.where('title LIKE ?', "%#{title}%") if title.present?
    search_result = search_result.where('director LIKE ?', "%#{director}%") if director.present?

    if runtime_in_minutes.present?
      if runtime_in_minutes == '1'
        search_result = search_result.where('runtime_in_minutes < ?', 90)
      elsif runtime_in_minutes == '2'
        search_result = search_result.where('runtime_in_minutes > ?', 90).where('runtime_in_minutes < ?', 120)
      else
        search_result = search_result.where('runtime_in_minutes > ?', 120)
      end
    end 
    search_result
  end

  protected 

  def release_date_is_in_the_past
    if release_date.present? 
      errors.add(:release_date, "This needs to be in the past! Silly goose!") if release_date > Date.today
    end
  end

end
