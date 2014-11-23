module ApplicationHelper

	def flash_message
		if flash[:error]
			content_tag :div, class: 'message alert' do
				content_tag :p do flash[:error] end
			end
		elsif flash[:notice]
			content_tag :div, class: 'message notice' do
				content_tag :p do flash[:notice] end
			end
		end
	end

end