class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :title, uniqueness: { scope: [:artist_name, :released] }
	validates :artist_name, presence: true
	validate :release_year_validator
	
	def release_year_validator
		if self.released == true
			current_year = DateTime.now.year
			unless self.release_year.present? && self.release_year < current_year
				self.errors[:release_year] << "Release year is invalid"
			end
		end
	end
	
end
