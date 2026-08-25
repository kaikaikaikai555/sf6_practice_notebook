class MatchLogsController < ApplicationController
  def show
    @match_log = MatchLog.find(params[:id])
  end

  def new
    @match_log = MatchLog.new
  end

  def create
    if params[:character_note_id].present?
      @character_note = CharacterNote.find(params[:character_note_id])
      @match_log = @character_note.match_logs.build(match_log_params)
    else
      @match_log = MatchLog.new(match_log_params)
    end

    user = (defined?(current_user) && current_user) || User.first || User.create!(name: "TestUser")
    @match_log.user_id = user.id

    if @match_log.save
      redirect_back fallback_location: character_notes_path, notice: '対戦ログを記録しました！'
    else
      redirect_back fallback_location: character_notes_path, alert: '記録に失敗しました。'
    end
  end

  def destroy
    @match_log = MatchLog.find(params[:id])
    @match_log.destroy

    if request.referer&.include?("/match_logs/")
      redirect_to character_notes_path, notice: '対戦ログを削除しました。', status: :see_other
    else
      redirect_back fallback_location: character_notes_path, notice: '対戦ログを削除しました。', status: :see_other
    end
  end

  private

  def match_log_params
    params.require(:match_log).permit(:result, :memo, :win_reason, :defeat_reason, :my_character, :opponent_character, defeat_tag_ids: [])
  end
end