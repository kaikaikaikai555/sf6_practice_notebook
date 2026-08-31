class DefeatTagsController < ApplicationController
  before_action :authenticate_user!

  # タグの一括削除アクション
  def destroy_multiple
    tag_ids = params[:tag_ids]
    if tag_ids.present?
      DefeatTag.where(id: tag_ids, user_id: current_user.id).destroy_all
      render json: { status: 'success' }
    else
      render json: { status: 'error' }, status: :bad_request
    end
  end

  # その場でのタグ追加用アクション（非同期）
  def create_tag
    tag_name = params[:new_tag_name]&.strip
    category = params[:new_tag_category]

    if tag_name.blank?
      return render json: { status: 'error', message: 'タグ名が空です' }, status: :unprocessable_entity
    end

    # ユーザーごとに同じ名前のタグがなければ新規作成し、あれば既存のものを取得する
    tag = current_user.defeat_tags.find_or_initialize_by(name: tag_name)
    tag.category = category if category.present?
    tag.save!

    render json: { 
      status: 'success', 
      tag: { id: tag.id, name: tag.name, category: tag.category } 
    }
  rescue => e
    render json: { status: 'error', message: e.message }, status: :internal_server_error
  end
end