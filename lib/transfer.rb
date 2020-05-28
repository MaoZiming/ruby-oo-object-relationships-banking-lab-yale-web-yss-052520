class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount
  def initialize(from, to, money)
    @sender = from
    @receiver = to
    @status = "pending"
    @amount = money

  end

  def valid? 
    if @sender.valid? && @receiver.valid?
      return true

    else
      return false
    end
  
  end

  def execute_transaction
    if @status == "pending"

      if self.valid? && @sender.balance > @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      tmp = @sender
      @sender = @receiver
      @receiver = tmp
      
      @status = "pending"
      if execute_transaction == "complete"
        @status = "reversed"
      end
    end
  end
end
