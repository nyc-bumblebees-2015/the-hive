class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :creator_id, null: false, index: true
      t.string :title, null: false
      t.text :description, null: false
      t.date :start_date, default: nil
      t.date :end_date, default: nil
      t.string :status, null: false
      t.text :skills_desired, null: false
      t.string :repo_link, default: nil

      t.timestamps null: false
    end
  end
end
