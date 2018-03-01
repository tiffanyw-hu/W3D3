class ShortenedUrl < ApplicationRecord
  validates :short_url, uniqueness: true
  validates :long_url, uniqueness: true

  belongs_to :submitter,
             primary_key: :id,
             foreign_key: :user_id,
             class_name: :User

  def self.random_code
    shortened = SecureRandom.urlsafe_base64(16)
    until !ShortenedUrl.exists?(short_url: shortened)
      shortened = SecureRandom.urlsafe_base64(16)
    end
    shortened
  end

  def self.generate(user, lg_url)
    ShortenedUrl.create!(user_id: user.id,
                         long_url: lg_url,
                         short_url: ShortenedUrl.random_code)

  end
end
