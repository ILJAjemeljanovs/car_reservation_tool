class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.text :number

      t.timestamps
    end
  end
end
