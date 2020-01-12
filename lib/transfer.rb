require "pry"
class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @status = "pending"
    @amount = amount 
  end
  
  def valid?
   if @sender.valid? && @receiver.valid?
     return true 
   else 
     return false
   end
  end
  
  def execute_transaction
    #binding.pry
    if self.status == "pending" && @sender.balance > @amount && valid?
      @receiver.balance = self.amount + @receiver.balance
      @sender.balance = @sender.balance - self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if execute_transaction
      @sender.balance = self.amount + @sender.balance
      @receiver.balance = @receiver.balance - self.amount
      self.status = "reversed"
    end
  end

end

