class CharacterNotesController < ApplicationController
  def index
    @character_notes = CharacterNote.all
  end

  def new
    @character_note = CharacterNote.new
  end

  def create
    @character_note = CharacterNote.new(character_note_params)
    @character_note.user = User.first_or_create(name: "テストユーザー", email: "test@example.com")

    if @character_note.save
      redirect_to character_notes_path, notice: "対策メモを保存しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @character_note = CharacterNote.find(params[:id])
  end

  def destroy
    @character_note = CharacterNote.find(params[:id])
    @character_note.destroy
    redirect_to character_notes_path, notice: "対策メモを削除しました！"
  end

  private

  def character_note_params
    params.require(:character_note).permit(:opponent_character, :my_character, :quick_summary, :content)
  end
end