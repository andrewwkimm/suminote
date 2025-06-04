class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: %i[ show edit update destroy ]

  def index
    @notes = current_user.notes.all
  end

  def show
  end

  def new
    @note = current_user.notes.build
  end

  def edit
  end

  def create
    @note = current_user.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy!

    respond_to do |format|
      format.html { redirect_to notes_path, status: :see_other, notice: "Note was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
