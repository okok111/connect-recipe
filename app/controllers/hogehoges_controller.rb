class HogehogesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment
  before_action :set_hoge
  before_action :set_hogehoge, only: [:show, :edit, :update, :destroy]

  def show
    @hogehoge = Hogehoge.find(params[:id])
  end

  def new
    @hogehoge = @hoge.hogehoges.new
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:comment_id])
    hoge = comment.hoges.find(params[:hoge_id])
    hogehoge = hoge.hogehoges.build(hogehoge_params)
    hogehoge.user_id = current_user.id
    if hogehoge.save
      flash[:success] = "ホゲホゲを作成しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "ホゲホゲを作成できませんでした"
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
    @hoge = @comment.hoges.find(params[:hoge_id])
  end

  def set_hogehoge
    @hogehoge = @hoge.hogehoges.find(params[:id])
  end

  def hogehoge_params
    params.require(:hogehoge).permit(:content)
  end
end
