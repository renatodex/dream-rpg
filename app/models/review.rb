class Review < ActiveRecord::Base
	has_many :review_tag
	
	def is_playing?
		if is_playing
			'sim'
		else
			'nao'
		end
	end
	
	def build_review_tags
		self.review_tag.collect { |t| [t.name, t.value] }
	end
end
