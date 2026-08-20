class CharacterNotesController < ApplicationController
  def index
    @character_notes = CharacterNote.all
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

  private

  def character_note_params
    params.require(:character_note).permit(:opponent_character, :my_character, :quick_summary, :content).merge(user_id: 1)
  end
end
