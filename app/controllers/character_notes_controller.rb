class CharacterNotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character_note, only: [:show, :edit, :update, :destroy]

  def index
    # 💡 フォームから「search_opponent」または「opponent_character」で検索された場合の処理
    search_opponent = params[:search_opponent].presence || params[:opponent_character].presence

    if search_opponent.present?
      opponent_name = search_opponent.to_s.strip

      # 既存ノートを検索
      note = current_user.character_notes.to_a.find do |n|
        (n.respond_to?(:opponent_character) && n.opponent_character == opponent_name) ||
        (n.respond_to?(:character_name) && n.character_name == opponent_name) ||
        (n.respond_to?(:name) && n.name == opponent_name)
      end

      # 存在しない場合は自動作成
      unless note
        note = current_user.character_notes.create(opponent_character: opponent_name)
      end

      # 詳細（show）画面へリダイレクト
      redirect_to character_note_path(note) and return
    end

    @character_notes = current_user.character_notes
    @match_logs = current_user.match_logs.order(created_at: :desc)
  end

  def show
    opponent = @character_note.try(:opponent_character) || @character_note.try(:character_name) || @character_note.try(:name)

    if opponent.present?
      @match_logs = current_user.match_logs.includes(:defeat_tags).where(opponent_character: opponent).order(created_at: :desc)
    else
      @match_logs = []
    end
  end

  def new
    @character_note = current_user.character_notes.build(opponent_character: params[:opponent_character])
  end

  def create
    @character_note = current_user.character_notes.build(character_note_params)

    if @character_note.save
      redirect_to character_note_path(@character_note), notice: "キャラクターノートを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @character_note.update(character_note_params)
      redirect_to character_note_path(@character_note), notice: "キャラクターノートを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @character_note.destroy
    redirect_to character_notes_path, notice: "キャラクターノートを削除しました"
  end

  def redirect_by_opponent
    opponent_name = params[:opponent_character].to_s.strip

    if opponent_name.blank?
      redirect_to character_notes_path, alert: "検索するキャラクター名を入力してください"
      return
    end

    note = current_user.character_notes.to_a.find do |n|
      (n.respond_to?(:opponent_character) && n.opponent_character == opponent_name) ||
      (n.respond_to?(:character_name) && n.character_name == opponent_name) ||
      (n.respond_to?(:name) && n.name == opponent_name)
    end

    unless note
      note = current_user.character_notes.create(opponent_character: opponent_name)
    end

    redirect_to character_note_path(note)
  end

  private

  def set_character_note
    @character_note = current_user.character_notes.find(params[:id])
  end

  def character_note_params
    params.require(:character_note).permit!
  end
end