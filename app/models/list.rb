class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :cover

  validates :name, uniqueness: true, presence: true

  def cover_path
    cover.attached? ? cover.url : ActionController::Base.helpers.asset_path('list_background.jpg')
  end
end
