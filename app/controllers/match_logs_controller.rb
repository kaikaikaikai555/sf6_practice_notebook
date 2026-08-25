class MatchLogsController < ApplicationController
  def create
    @character_note = CharacterNote.find(params[:character_note_id])
    @match_log = @character_note.match_logs.build(match_log_params)
    
    # user_id を直接セット（User.first がいなければ自動生成）
    user = (defined?(current_user) && current_user) || User.first || User.create!(name: "TestUser")
    @match_log.user_id = user.id

    if @match_log.save
      redirect_to character_note_path(@character_note), notice: '対戦ログを記録しました！'
    else
      redirect_to character_note_path(@character_note), alert: '記録に失敗しました。'
    end
  end

  private

  def match_log_params
    params.require(:match_log).permit(:result, :memo, defeat_tag_ids: [])
  end
end