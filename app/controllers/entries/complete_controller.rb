class Entries::CompleteController < ApplicationController
  def create
    @entry = Entry.find(params[:entry_id])
    
    if @entry.update(completed_at: params[:completed_at])
      redirect_to @entry.plan, notice: "Entry was successfully completed."
    else
      redirect_to @entry.plan, alert: "Failed to complete entry."
    end
  end
end

