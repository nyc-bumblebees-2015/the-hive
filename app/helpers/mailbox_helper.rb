module MailboxHelper

  def unread_message_count
    mailbox.inbox(:unread => true).count(:id, distinct => true)
  end

end
