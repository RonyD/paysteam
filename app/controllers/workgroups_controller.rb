class WorkgroupsController < ApplicationController
  # GET /workgroups
  # GET /workgroups.json
  def index
    @workgroups = Workgroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workgroups }
    end
  end

  # GET /workgroups/1
  # GET /workgroups/1.json
  def show
    @workgroup = Workgroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workgroup }
    end
  end

  # GET /workgroups/new
  # GET /workgroups/new.json
  def new
    @workgroup = Workgroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workgroup }
    end
  end

  # GET /workgroups/1/edit
  def edit
    @workgroup = Workgroup.find(params[:id])
  end

  # POST /workgroups
  # POST /workgroups.json
  def create
    @workgroup = Workgroup.new(params[:workgroup])

    respond_to do |format|
      if @workgroup.save
        format.html { redirect_to @workgroup, notice: 'Workgroup was successfully created.' }
        format.json { render json: @workgroup, status: :created, location: @workgroup }
      else
        format.html { render action: "new" }
        format.json { render json: @workgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workgroups/1
  # PUT /workgroups/1.json
  def update
    @workgroup = Workgroup.find(params[:id])

    respond_to do |format|
      if @workgroup.update_attributes(params[:workgroup])
        format.html { redirect_to @workgroup, notice: 'Workgroup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workgroups/1
  # DELETE /workgroups/1.json
  def destroy
    @workgroup = Workgroup.find(params[:id])
    @workgroup.destroy

    respond_to do |format|
      format.html { redirect_to workgroups_url }
      format.json { head :no_content }
    end
  end
end
