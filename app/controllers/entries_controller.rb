class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]  
  helper_method :sort_column, :sort_direction

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all.includes(:author).order(sort_column + " " + sort_direction)
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
