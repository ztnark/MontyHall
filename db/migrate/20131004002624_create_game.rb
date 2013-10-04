class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :switch
      t.boolean :win
    end
  end
end
