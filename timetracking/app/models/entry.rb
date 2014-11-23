class Entry < ActiveRecord::Base
	belongs_to :project

	validates :date, presence: true
	validates :hours, presence: true
	validates :minutes, presence: true
	validates :hours, numericality: true
	validates :minutes, numericality: true


	def self.of_month year, month

		beginning_of_month = Date.new(year.to_i, month.to_i, 1)
		month_end = beginning_of_month.end_of_month

		month_entries = []
		where("date > ? AND date < ?" , beginning_of_month, month_end).each do |entry|
			month_entries.push(entry)
		end

		return month_entries
	end

end