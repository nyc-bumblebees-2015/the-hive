class ConversationLink < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :linkingObject, polymorphic: true
end