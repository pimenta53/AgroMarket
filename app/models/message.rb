class Message < ActiveRecord::Base
	# associations
	belongs_to :ad

  belongs_to :sender,:class_name  => 'User',
                     :primary_key => 'id',
                     :foreign_key => 'sender_id'

  belongs_to :receiver,:class_name => 'User',
                       :primary_key  => 'id',
                       :foreign_key  => 'receiver_id'

	#validates
  	validate :sender_receiver_must_be_diferent

  	validates :text,presence: true,length: { in: 1..144 }
  	validates :sender_id,:receiver_id,:ad_id, presence: true,numericality: { only_integer: true }
  
  #vai buscar as mensagens trocadas entre utilizadores
  # referente ao anuncio(ad)
  def self.get_messages( messages, user_id)

    hashMessage = {}
    messages.each do |m|
      if m.sender_id != user_id
        if !hashMessage.has_key?(m.sender_id)
          hashMessage[m.sender_id] = []
        end
        hashMessage[m.sender_id].push(m)
      else
        # Esta clausula esta aqui pork é uma resposta tenho que a colocar no sítio certo
        hashMessage[m.receiver_id].push(m)
      end
    end
    hashMessage

  end


  def self.conversations(user_id)
    where("(sender_id = ? OR receiver_id = ?)",user_id,user_id)
  end

  # vai buscar todas as mensagens entre utilizadores 
  # para criar a conversa
  def self.conversation( user_one, user_two)
    where("(sender_id = ? AND receiver_id = ?) OR (receiver_id= ? AND  sender_id = ?)", user_one,user_two,user_one,user_two)
  end


  private
  	#verifica se sender é diferente de receiver
  	def sender_receiver_must_be_diferent
  		errors[:base] << "Error message" unless sender_id != receiver_id
  	end
	
end
