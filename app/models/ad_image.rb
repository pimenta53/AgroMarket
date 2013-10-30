class AdImage < ActiveRecord::Base
	belongs_to :ad

	has_attached_file :image,:styles => {:thumb=> "100x100#",:small  => "300x300>",:large => "600x600>"}
	
end
