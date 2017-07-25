class SongValidator < ActiveModel::Validator

	def validate(song)
		if song.released == true
			current_year = DateTime.now.year
			unless song.release_year.present? && song.release_year < current_year
				song.errors[:release_year] << "Release year is invalid"
			end
		end
	end
end