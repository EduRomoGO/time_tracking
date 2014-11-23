class Project < ActiveRecord::Base
	has_many :entries

	validates :name, {presence: true,
				      uniqueness: true,
				      length: {maximum: 30},
				      format: {with: /\A[a-zA-Z0-9\s]*\z/}
					 }


	def self.iron_find number
		self.where('id = ?', number).first
	end

	def self.batch_delete names


		# if project = find_by(name: name)
		# 	project.destroy
		# 	removed += 2
		# end


		# where (name: names).each do |project|
		#	project.destroy
		# 	removed += 1
		# end

		projects_to_delete = []
		names.each do |name|
			projects_to_delete += where('name = ?', name)
		end

		projects_deleted = projects_to_delete.length

		projects_to_delete.each do |project|
			project.destroy
		end

		puts "Deleted #{projects_deleted} projects"

	end

	def upcase_name!
		name_upcased = self.name.upcase
		self.name = name_upcased
		save
	end

	def self.last_created_projects(n)
		#Project es opcional
		Project.order("created_at DESC").limit(n)
	end

	def display_hours_and_entries_of_a_month year, month

		tot_min = 0

		# opcion ineficiente
		#entries.each do |entry|
		#	if ( (entry.date.year == year.to_i) and (entry.date.month == month.to_i) )
		#		tot_min += entry.hours*60 + entry.minutes
		#	end
		#end

		#opcion eficiente
		beginning_of_month = Date.new(year.to_i, month.to_i, 1)
		month_end = beginning_of_month.end_of_month

		month_entries = []
		entries.where("date > ? AND date < ?" , beginning_of_month, month_end).each do |entry|
			tot_min += entry.hours*60 + entry.minutes
			month_entries.push(entry)
		end

		return tot_min, month_entries

	end

	def display_minutes_of_a_month month_entries

		tot_min = 0

		month_entries.each do |entry|
			tot_min += entry.hours*60 + entry.minutes
		end

		return tot_min

	end

end