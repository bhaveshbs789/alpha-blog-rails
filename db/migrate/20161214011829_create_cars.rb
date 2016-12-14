class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :title
      #t.text :description#------------------forgot to add description---- will add later on-------
    end
  end
end
