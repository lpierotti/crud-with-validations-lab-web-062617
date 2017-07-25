class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: { scope: [:artist_name, :released] }
	validates :artist_name, presence: true
	validates_with SongValidator
	
end
