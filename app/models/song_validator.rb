class SongValidator < ActiveModel::Validator

	def validate(song)
		if song.released == true
			year = DateTime.now.year
			unless song.release_year != nil && song.release_year < year
				song.errors[:release_year] << "Release year is invalid"
			end
		end
	end
end