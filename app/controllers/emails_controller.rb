class EmailsController < ApplicationController
  def index
    @emails = Email.all
    @emails = @emails.sort_by {|email| email.id}
  end 

  def create
    @email = Email.create(objet: Faker::Music.album, body: Faker::Book.title, read: false )

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end 
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end   
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true)


    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end   
  end

  def update
    @email = Email.find(params[:id])

    if @email.read == true
      @email.update(read: false)
    else
      @email.update(read: true)
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end   
  end

end
