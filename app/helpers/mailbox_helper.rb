module MailboxHelper

  def unread_messages_count
    mailbox.inbox(:unread => true).count(:id, :distinct => true)
  end

  def pending_count
    pending_requests = current_user.pending_requests_for_projects
    count = 0
    pending_requests.each {|request| count += 1}
    return count
  end

  def all_message_count
    unread_messages_count + pending_count
  end

end
