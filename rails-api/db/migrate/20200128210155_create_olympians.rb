class CreateOlympians < ActiveRecord::Migration[5.2]
  def change
    create_table :olympians do |t|
      t.string  :name,   :null => false
      t.string  :sex,    :null => true
      t.integer :age,    :null => true
      t.integer :height, :null => true
      t.integer :weight, :null => true
    end
  end
end
