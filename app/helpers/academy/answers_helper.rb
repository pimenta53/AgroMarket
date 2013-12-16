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

	#verifica se resposta pertence ao current_user
	def is_mine?( user_id )
		if user_id == current_user.id
			return "panel-info"
		end
	end

	def was_edited?( answer )
		if answer.created_at == answer.updated_at
			return  '<abbr class="timeago" title="'.html_safe + answer.created_at.getutc.iso8601 + '">'.html_safe+
			            answer.created_at.to_s +
			         '</abbr>'.html_safe
		else
			return 'Editada <abbr class="timeago" title="'.html_safe + answer.updated_at.getutc.iso8601 + '">'.html_safe+
			             answer.updated_at.to_s
			        '</abbr>'.html_safe
		end
	end
end
