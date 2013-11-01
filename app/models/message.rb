class Message < ActiveRecord::Base
	# associations
	belongs_to :ad

	#validates
  	validate :sender_receiver_must_be_diferent

  	validates :text,presence: true,length: { in: 1..144 }
  	validates :sender_id,:receiver_id,:ad_id, presence: true,numericality: { only_integer: true }


  private
  	#verifica se sender é diferente de sender
  	def sender_receiver_must_be_diferent
  		errors[:base] << "Error message" unless sender_id != receiver_id
  	end
	
end
