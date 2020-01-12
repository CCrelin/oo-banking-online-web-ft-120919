class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
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
    if self.status == "pending" && @sender.balance > @amount 
      @receiver.balance = self.amount + @receiver.balance
      @sender.balance = @sender.balance - self.amount
      self.status = "complete"
    else
      return "Transaction rejected. Please check your account balance."
      self.status = "rejected"
    end
  end 

end

