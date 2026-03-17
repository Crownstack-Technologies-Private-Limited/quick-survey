class SearchController < BaseController
  def surveys
    authorize :search
    like_keyword = "%#{params[:q].to_s.downcase}%"
    if params[:folder_id].present?
      @surveys = Survey::Survey.active.where("LOWER(name) LIKE ? AND folder_id = ?", like_keyword, params[:folder_id]).limit(10).order(:name)
    else
      @surveys = Survey::Survey.all.active.where(folder_id: nil).where("LOWER(name) LIKE ?", like_keyword).limit(10).order(:name)
    end
    render layout: false
  end

  def spaces_surveys_and_folders
    authorize :search
    like_keyword = "%#{params[:q].to_s.downcase}%"
    @surveys = Survey::Survey.all.active.where("LOWER(name) LIKE ?", like_keyword)
      .limit(10).order(:name).limit(4)
    @spaces = Space.where("LOWER(title) LIKE ?", like_keyword).limit(4)
    @folders = Folder.where("LOWER(title) LIKE ?", like_keyword).limit(4)
    render layout: false
  end

  def archived_surveys
    authorize :search
    like_keyword = "%#{params[:q].to_s.downcase}%"
    @surveys = Survey::Survey.inactive.where("LOWER(name) LIKE ?", like_keyword).limit(10).order(:name)
    render layout: false
  end

  def archived_users
    authorize :search
    like_keyword = "%#{params[:q].to_s.downcase}%"
    @users = User.inactive.where(
      "LOWER(first_name) LIKE :keyword OR LOWER(last_name) LIKE :keyword OR LOWER(email) LIKE :keyword",
      keyword: like_keyword
    )
      .order(:first_name)
    render layout: false
  end
end
