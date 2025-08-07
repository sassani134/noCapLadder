class CreateParticipations < ActiveRecord::Migration[8.0]
  def change
    create_table :participations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true
      t.boolean :winner
      t.boolean :loser
      t.boolean :ventre

      t.timestamps
    end
  end
end
