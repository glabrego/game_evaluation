class AddGameToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_reference :evaluations, :game, foreign_key: true
  end
end
