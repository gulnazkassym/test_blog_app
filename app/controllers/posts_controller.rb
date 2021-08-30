# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.where(is_published: true)
  end

  def show
    @post.read_by << current_user.id if current_user.present?
    @post.save
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params.merge(user: current_user))

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice:'Новость успешно создана.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params.merge(user: current_user))
        format.html { redirect_to @post, notice: 'Новость обновлена.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Новость успешно удалена' }
      format.json { head :no_content }
    end
  end

  def unreaded_posts
    @unreaded_posts = Post.where.not("cast(#{current_user.id} as text) = ANY (read_by)")
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :subtitle, :text, :is_published)
  end
end
