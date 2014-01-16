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
		if user_signed_in? && user_id == current_user.id
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

	def total_result( total_result )
		if total_result > 0
			return '<label class="label label-success" syle="font-size:10px">'.html_safe + total_result.to_s + '</label>'.html_safe
		elsif total_result == 0
			return '<label class="label label-default" syle="font-size:10px">'.html_safe + total_result.to_s + '</label>'.html_safe
		else
			return '<label class="label label-danger" syle="font-size:10px">'.html_safe + total_result.to_s + '</label>'.html_safe
		end
	end
end
