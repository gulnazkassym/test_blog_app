class FavoritePostsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def index
    @favorites = current_user.favorite_posts
  end

  def create
    if Favorite.create(favorited: @post, user: current_user)
      redirect_to @post, notice: 'Новость добавлена в избранные'
    else
      redirect_to @post, alert: 'Что-то пошло не так...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @post.id, user_id: current_user.id).first.destroy
    redirect_to @post, notice: 'Новость удалена из избранных'
  end

  private

  def set_post
    @post = Post.find(params[:post_id] || params[:id])
  end
end