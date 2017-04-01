# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.float :easy_of_use
      t.float :content_quality
      t.float :versatility
      t.float :pedagogical_aspects
      t.float :didactical_resources
      t.float :stimulates_the_initiative_and_self_learning
      t.float :audiovisual_quality
      t.float :technical_and_static_elements
      t.float :navigation_and_interaction
      t.float :originality_and_use_of_advanced_tecnology

      t.timestamps
    end
  end
end
