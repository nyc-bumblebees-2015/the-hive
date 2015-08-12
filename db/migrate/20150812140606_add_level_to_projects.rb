class AddLevelToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :level, :string, default: nil
  end
end
