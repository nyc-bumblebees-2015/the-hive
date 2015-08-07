class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.integer :collaborator_id, null: false, index: true
      t.integer :project_id, null: false, index: true
      t.string :status, null: false, default: 'pending'

      t.timestamps null: false
    end
  end
end
