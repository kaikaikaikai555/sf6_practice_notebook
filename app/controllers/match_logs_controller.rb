class MatchLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_match_log, only: [:show, :edit, :update, :destroy]

  def index
    @match_logs = current_user.match_logs.order(created_at: :desc)
  end

  def show
  end

  def new
    @match_log = current_user.match_logs.build
  end

  def create
    @match_log = current_user.match_logs.build(match_log_params)

    if @match_log.save
      # 💡 入力された新規タグがあれば作成して紐付ける
      save_new_tag_if_present

      redirect_to character_notes_path, notice: "対戦ログを記録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @match_log.update(match_log_params)
      # 💡 入力された新規タグがあれば作成して紐付ける
      save_new_tag_if_present

      redirect_to @match_log, notice: "対戦ログを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @match_log.destroy
    redirect_to character_notes_path, notice: "対戦ログを削除しました"
  end

  private

  def set_match_log
    @match_log = current_user.match_logs.find(params[:id])
  end

  def match_log_params
    params.require(:match_log).permit(:my_character, :opponent_character, :result, :win_reason, :defeat_reason, :memo, defeat_tag_ids: [])
  end

  # 新規タグを保存・自動紐付けする共通メソッド
  def save_new_tag_if_present
    return if params[:new_tag_name].blank?

    tag_name = params[:new_tag_name].strip
    return if tag_name.blank?

    # 💡 フォームから送られてきたカテゴリーを取得（デフォルトは「立ち回り」など）
    tag_category = params[:new_tag_category].presence || "立ち回り"

    # ユーザー固有のタグとして取得または新規作成（カテゴリーも保存）
    tag = DefeatTag.find_or_create_by(name: tag_name, user_id: current_user.id) do |t|
      t.category = tag_category
    end
    # 既存ですでに存在していた場合はカテゴリーを更新しておく
    tag.update(category: tag_category) if tag.category.blank?
    
    # 対戦ログに紐付け（重複がない場合のみ追加）
    unless @match_log.defeat_tags.include?(tag)
      @match_log.defeat_tags << tag
    end
  end
end