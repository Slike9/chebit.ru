class DiscoursesController < ApplicationController

  # load_resource

  respond_to :html, :json

  before_filter :authenticate_user!, :only=>[:update]

  def index
    @discourse = Discourse.new
    respond_with @discourses = Discourse.all #  @websites = current_user.websites
  end


  # # GET /discourses
  # # GET /discourses.xml
  # def index
  #   @discourses = Discourse.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.xml  { render :xml => @discourses }
  #   end
  # end

  # # GET /discourses/1
  # # GET /discourses/1.xml
   def show
     @discourse = Discourse.find(params[:id])
     respond_with @discourse
   end

  # # GET /discourses/new
  # # GET /discourses/new.xml
   def new
     authenticate_user! if params[:me]=='assigner'
     @discourse = Discourse.new
   end
   def edit
     @discourse = Discourse.find(params[:id])
   end

   def create
     @discourse = Discourse.create(params[:discourse])
     respond_with @discourse
   end
  #   respond_to do |format|
  #     if @discourse.save
  #       format.html { redirect_to(@discourse, :notice => 'Discourse was successfully created.') }
  #       format.xml  { render :xml => @discourse, :status => :created, :location => @discourse }
  #     else
  #       format.html { render :action => "new" }
  #       format.xml  { render :xml => @discourse.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # # PUT /discourses/1
  # # PUT /discourses/1.xml
   def update
     @discourse = Discourse.find(params[:id])
     params[:discourse] = { :assigner => current_user }  if params[:assigner]
     @discourse.update_attributes(params[:discourse])
     respond_with  @discourse
   end
  #   respond_to do |format|
  #     if @discourse.update_attributes(params[:discourse])
  #       format.html { redirect_to(@discourse, :notice => 'Discourse was successfully updated.') }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @discourse.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /discourses/1
  # # DELETE /discourses/1.xml
  # def destroy
  #   @discourse = Discourse.find(params[:id])
  #   @discourse.destroy

  #   respond_to do |format|
  #     format.html { redirect_to(discourses_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
