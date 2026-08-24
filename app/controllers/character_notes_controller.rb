class CharacterNotesController < ApplicationController
  def index
    # 検索フォームから相手キャラ名（params[:opponent_character]）が送られてきた場合、そのキャラで絞り込む
    if params[:opponent_character].present?
      @character_notes = CharacterNote.where("opponent_character LIKE ?", "%#{params[:opponent_character]}%")
    else
      # 検索していない時は、全件表示
      @character_notes = CharacterNote.all
  end
end

  def new
    @character_note = CharacterNote.new
  end

  def create
    @character_note = CharacterNote.new(character_note_params)
    if @character_note.save
      redirect_to character_notes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @character_note = CharacterNote.find(params[:id])
    @character_note.destroy
    redirect_to character_notes_path
  end

  def show
    @character_note = CharacterNote.find(params[:id])
  end

  def edit
    @character_note = CharacterNote.find(params[:id])
  end

  def update
    @character_note = CharacterNote.find(params[:id])
    if @character_note.update(character_note_params)
      redirect_to character_note_path(@character_note)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def character_note_params
    params.require(:character_note)
        .permit(:opponent_character, :my_character, :quick_summary, :content, :key_point, :my_focus, :bad_habit)
        .merge(user_id: 1)
  end
end
