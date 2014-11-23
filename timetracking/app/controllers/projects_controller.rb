class ProjectsController < ApplicationController
	
	def index
		#@projects = Project.order(created_at: :desc).limit(10)
		if ( @projects = Project.last_created_projects(10) ).empty?
			render 'no_projects_found', layout: 'no_projects'
		end
	end

	def show_hours

		p = Project.find(params[:id])

		@month_entries = p.entries.of_month(params[:year], params[:month])
		@minutes = p.display_minutes_of_a_month(@month_entries)

	end

	def show

		#binding.pry
		name_sanitized = params[:id].gsub(/[-]/, ' ').titleize

		if !( @project = Project.find_by(name: name_sanitized) ) then (render 'no_projects_found') end

		########################################################################
		#CODE OF SHOW WHEN LOOKING BY ID
		#firs way
		#begin
		#	@project = Project.find params[:id]
		#rescue ActiveRecord::RecordNotFound
		#	render 'no_projects_found'
		#end

		#second way
		#if ( @project = Project.find_by(id: params[:id]) ) == nil
		#	render 'no_projects_found'
		#end

		#third way
		#if !( @project = Project.find_by(id: params[:id]) ) then (render 'no_projects_found') end

		#we could do it using unless, or the conditional if at the end of the expression
		########################################################################

	end

end