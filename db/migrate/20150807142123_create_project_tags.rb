class CreateProjectTags < ActiveRecord::Migration
  def change
    create_table :project_tags do |t|
      t.integer :project_id, null: false, index: true
      t.integer :tag_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
