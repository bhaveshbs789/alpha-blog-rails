class AddDescriptionToCars < ActiveRecord::Migration
  def change
    add_column :cars, :description, :text
    add_column :cars, :created_at, :datetime
    add_column :cars, :updated_at, :datetime
  end
end
