module Academy::AnswersHelper


	def down_vote?( vote )
		r = ""
		if vote == -1
			r = "vote_done down_vote disabled"	
		end

		return r
	end

	def up_vote?( vote )
		r = ""
		if vote == 1
			r = "vote_done up_vote disabled"	
		end

		return r
	end
end
