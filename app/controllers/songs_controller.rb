class SongsController < ApplicationController

	def new
		@song = Song.new
	end

	def create
		@song = Song.new(song_params(:title, :released, :genre, :release_year, :artist_name))
		
		if @song.valid?
			@song.save
			redirect_to song_path(@song)
		else
			render :new
		end
	end

	def show
		@song = Song.find(params[:id])
	end

	def edit
		@song = Song.find(params[:id])
	end

	def update
		@song = Song.find(params[:id])
		song = @song.update(song_params(:title, :released, :genre, :release_year, :artist_name))
		if song
			@song.update(song_params(:title, :released, :genre, :release_year, :artist_name))
			redirect_to song_path(@song)
		else
			render :edit
		end
	end

	def destroy
		@song = Song.find(params[:id])
		@song.destroy
		redirect_to songs_path
	end

	def index
		@songs = Song.all
	end

	private
	def song_params(*args)
		params.require(:song).permit(*args)
	end
end
