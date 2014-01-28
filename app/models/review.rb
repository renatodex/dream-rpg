class Review < ActiveRecord::Base
	has_many :review_tag
	
	def is_playing?
		if is_playing
			'sim'
		else
			'nao'
		end
	end
end
