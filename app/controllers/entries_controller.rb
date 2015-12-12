class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]  
  helper_method :sort_column, :sort_direction

  # GET /entries
  # GET /entries.json
  def index
    #search query, check params for search then search by appropriate fields
    @q = Entry.all
    @author_id = params[:search][:author_id] if params[:search]
    @text = params[:search][:text] if params[:search]
    @q = Entry.search(@q, @text) if !@text.blank?
    @q = Entry.where(author_id: params[:search][:author_id]) if !@author_id.blank?

    #final result and column toggle sort
    @entries = @q.paginate(:page => params[:page], :per_page => 30).includes(:author).order(sort_column + " " + sort_direction)
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  private
  
    def sort_column
      (Entry.column_names.include?(params[:sort]) || %w[authors.name].include?(params[:sort])) ? params[:sort] : "title"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:posting_id, :published, :link, :title, :content, :author_id)
    end
end
