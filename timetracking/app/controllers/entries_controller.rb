class EntriesController < ApplicationController
	def index
		@project = Project.find params[:project_id]
		#@entries = @projects.entries
	end

	def new
		@project = Project.find params[:project_id]

		#creamos (por obligación de rails) el objeto vacio para que los campos
		#ya tengan el nombre de los atributos
		@entry = @project.entries.new
	end

	def create
		#binding.pry

		@project = Project.find params[:project_id]
		@entry = @project.entries.new entry_params

		if @entry.save
			flash[:notice] = "entry created succesfully"
			EntryMailer.new_entry(@project, @entry).deliver
			redirect_to project_entries_path(@project)  #action: 'index', controller:'entries', project_id: @project.id
		else
			flash.now[:error] = "error creating entry"
			render 'new'
		end

	end

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date)
	end

	def edit
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
	end


	def update

		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]

		if @entry.update_attributes entry_params
			flash[:notice] = "entry updated succesfully"
			redirect_to project_entries_path(@project)  #action: 'index', controller:'entries', project_id: @project.id
		else
			flash.now[:error] = "error updating entry"
			render 'edit'
		end

	end

	def destroy
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
		@entry.destroy
		redirect_to project_entries_path(@project)
	end

end