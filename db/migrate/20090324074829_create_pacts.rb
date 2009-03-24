class CreatePacts < ActiveRecord::Migration
  def self.up
    create_table :pacts do |t|
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pacts
  end
end
