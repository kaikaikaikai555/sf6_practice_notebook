class CharacterNotesController < ApplicationController
  before_action :set_character_note, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search_opponent].present?
      @character_notes = CharacterNote.where("opponent_character LIKE ?", "%#{params[:search_opponent]}%")
      @match_logs = MatchLog.where("opponent_character LIKE ?", "%#{params[:search_opponent]}%").order(created_at: :desc)
    else
      @character_notes = CharacterNote.all
      @match_logs = MatchLog.order(created_at: :desc)
    end
  end

  # 追加：相手キャラ名から対策メモへ飛ばす（無ければ新規作成画面へ）
  def redirect_by_opponent
    opponent = params[:opponent_character]
    note = CharacterNote.find_by(opponent_character: opponent)

    if note
      redirect_to character_note_path(note)
    else
      redirect_to new_character_note_path(opponent_character: opponent)
    end
  end

  def show
    @match_logs = MatchLog.where(opponent_character: @character_note.opponent_character).order(created_at: :desc)
  end

  def new
    @character_note = CharacterNote.new(opponent_character: params[:opponent_character])
  end

  def create
    @character_note = CharacterNote.new(character_note_params)
    if @character_note.save
      redirect_to @character_note, notice: '対策メモを保存しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @character_note.update(character_note_params)
      redirect_to @character_note, notice: '対策メモを更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @character_note.destroy
    redirect_to character_notes_path, notice: '対策メモを削除しました'
  end

  private

  def set_character_note
    @character_note = CharacterNote.find(params[:id])
  end

  def character_note_params
    params.require(:character_note).permit(:my_character, :opponent_character, :key_point, :my_awareness, :bad_habit, :detail_memo)
  end
end