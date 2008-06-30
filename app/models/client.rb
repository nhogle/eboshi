class Client < ActiveRecord::Base
	has_many :line_items
	has_many :invoices
	
	def balance
		credits - debits
	end
	
	def credits
		line_items.to_a.sum(&:total)
	end
	
	def debits
		invoices.to_a.sum(&:total)
	end
	
	def todo
		line_items.find :all, :conditions => 'start IS NULL', :order => 'created_at DESC'
	end
end
