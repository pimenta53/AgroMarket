class Admin::Publicity < ActiveRecord::Base
	has_attached_file :image,:styles => {
		:avatar => "50x50!",
		:thumb => "100x100!",
		:small  => "300x300!",
		:ad_size => "1200x800!",
		:large => "600x600!"
	}

end
