# == Schema Information
#
# Table name: publicities
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :string(255)
#  expire_date        :datetime
#  owner              :string(255)
#  link               :string(255)
#  is_deleted         :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Publicity < ActiveRecord::Base
	has_attached_file :image,:styles => {
		:avatar => "50x50!",
		:thumb => "100x100!",
		:small  => "300x300!",
		:ad_size => "1200x800!",
		:large => "600x600!"
	}

   validates :image, presence: true
   validates :title, presence: true
   validates :owner, presence: true

   def self.get_publicity(index, count)
     self.get_publicity_with_offset(index, count)["list"]
   end

   def self.get_publicity_with_offset(index, count)
   
     list = Publicity.where("is_deleted = false and (expire_date is null or expire_date >= ?)", Date.today).limit(count).offset(index)
     if !list
      list = []
     end  
     if index.nil?
      index = 0
     end
    new_offset = index + list.length
     
     if !(count == 0 || (list.length == 0 && index == 0))
       # se nao buscou publicidade suficiente
       if (list.length < count)
       
         #Verificar se iniciou no inicio da lista
         if (index == 0)
           #Este caso só acontece se o numero de publicidade existente é menor que a pedida, usamos lista com repetições
           newlist = list 
           while (newlist.length < count) do
             #adicionar o numero de elementos que falta
             new_offset = count - newlist.length
             if list.length < new_offset
               #não será necessário usa o offset porque é maior que a lista
               newlist = newlist + list
             else
               newlist = newlist + list.take(new_offset)
             end
           end
           
           list = newlist
         else
           #Este caso acontecerá se atingiu o fundo da lista de publicidades, voltamos ao inicio
           newlist = Publicity.get_publicity_with_offset(0, count - list.length)
           
           list = list + newlist["list"]
           new_offset = newlist["offset"]
         end
       end
     end
     Hash["list", list, "offset", new_offset]
   end
end
