class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_fix, only: [:show, :create, :edit, :update, :destroy, :index]

  # GET  appointments
  # GET  appointments.json
  def index
    @appointments = @fix.appointments
  end

  # GET  appointments/1
  # GET  appointments/1.json
  def show
  end

  # GET  appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET  appointments/1/edit
  def edit
  end

  # POST  appointments
  # POST  appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.fix = @fix
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT  appointments/1
  # PATCH/PUT  appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE  appointments/1
  # DELETE  appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_fix
      @fix = Fix.find(params[:fix_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      # params.require(:appointment).permit!
      params.fetch(:appointment, {}).permit!
    end
end
