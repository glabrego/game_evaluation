# frozen_string_literal: true
class Game < ApplicationRecord
  has_many :evaluations
  validates :name, :description, :link, :how_to_play, presence: true
end
