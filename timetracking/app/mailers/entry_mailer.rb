class EntryMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_entry(project, entry)
	@project = project
	@entry = entry

	mail(to: 'e@b.com',
		subject: "New entry for #{project.name}")
  end

end
