# frozen_string_literal: true

class AddColumnsToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :link, :string
    add_column :games, :how_to_play, :string
  end
end
