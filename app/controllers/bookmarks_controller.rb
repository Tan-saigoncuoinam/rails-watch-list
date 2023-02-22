class BookmarksController < ApplicationController
  # add a new bookmark (movie/list pair) to an existing list
  def new
    # get details of movie/list pair from users
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new
  end

  def create
  # POST movie/list pair to exist list
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    @bookmark.save
    redirect_to list_path(@bookmark.list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id)
  end

end
