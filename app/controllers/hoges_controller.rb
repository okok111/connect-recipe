class HogesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment
  before_action :set_hoge, only: [:show, :edit, :update, :destroy]

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @hoge = Hoge.find(params[:id])
    @hogehoges = @hoge.hogehoges
    @hogehoge = Hogehoge.new
  end

  def new
    @hoge = @comment.hoges.new
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:comment_id])
    hoge = comment.hoges.build(hoge_params)
    hoge.user_id = current_user.id
    if hoge.save
      flash[:success] = "ホゲを作成しました"
      redirect_to post_path(post)
    else
      flash[:error] = "ホゲを作成できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:comment_id])
  end

  def set_hoge
    @hoge = @comment.hoges.find(params[:id])
  end

  def hoge_params
    params.require(:hoge).permit(:content)
  end
end
