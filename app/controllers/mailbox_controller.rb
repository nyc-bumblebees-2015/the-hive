class MailboxController < ApplicationController
  before_action :require_login

  def inbox
    @pending_requests = current_user.pending_requests_for_projects
    @inbox = mailbox.inbox
    @active = :inbox
  end

  def sent
    @sent = mailbox.sentbox
    @active = :sent
  end

  def trash
    @trash = mailbox.trash
    @active = :trash
  end

end
