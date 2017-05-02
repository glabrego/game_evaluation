# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :evaluations
  validates :name, :description, :link, :how_to_play, presence: true

  def funcionality_dimension
    (easy_of_use_factor * factors_weight[:easy_of_use]) + (content_quality_factor * factors_weight[:content_quality])
  end

  def efficiency_dimension
    (versatility_factor * factors_weight[:versatility]) + (pedagogical_aspects_factor * factors_weight[:pedagogical_aspects]) + (didactical_resources_factor * factors_weight[:didactical_resources]) + (stimulates_the_initiative_and_self_learning_factor * factors_weight[:stimulates_the_initiative_and_self_learning])
  end

  def adaptability_dimension
    (audiovisual_quality_factor * factors_weight[:audiovisual_quality]) + (technical_and_static_elements_factor * factors_weight[:technical_and_static_elements]) + (navigation_and_interaction_factor * factors_weight[:navigation_and_interaction])
  end

  def euclidean_distance
    (1 - (funcionality_dimension / 100)) + (1 - (efficiency_dimension / 100)) + (1 - (adaptability_dimension / 100))
  end

  def system_quality
    ((1 - (euclidean_distance / Math.sqrt(10))) * 100)
  end

  def easy_of_use_factor
    calculate_questions(evaluations.pluck(:r1, :r2)) * (1.0 / 20)
  end

  def content_quality_factor
    calculate_questions(evaluations.pluck(:r8, :r9, :r10, :r11, :r12)) * (1.0 / 50)
  end

  def versatility_factor
    calculate_questions(evaluations.pluck(:r3, :r4, :r5, :r18)) * (1.0 / 40)
  end

  def pedagogical_aspects_factor
    calculate_questions([evaluations.pluck(:r19)]) * (1.0 / 10)
  end

  def didactical_resources_factor
    calculate_questions(evaluations.pluck(:r20, :r21)) * (1.0 / 20)
  end

  def stimulates_the_initiative_and_self_learning_factor
    calculate_questions([evaluations.pluck(:r22)]) * (1.0 / 10)
  end

  def audiovisual_quality_factor
    calculate_questions([evaluations.pluck(:r6)]) * (1.0 / 10)
  end

  def technical_and_static_elements_factor
    calculate_questions([evaluations.pluck(:r7)]) * (1.0 / 10)
  end

  def navigation_and_interaction_factor
    calculate_questions(evaluations.pluck(:r13, :r14, :r15, :r16)) * (1.0 / 40)
  end

  private

  def percentage
    {}.tap do |p|
      p['1'] = 0
      p['2'] = 25
      p['3'] = 50
      p['4'] = 75
      p['5'] = 100
    end
  end

  def factors_weight
    {}.tap do |factor|
      factor[:easy_of_use] = 0.5
      factor[:content_quality] = 0.5
      factor[:versatility] = 0.47
      factor[:pedagogical_aspects] = 0.14
      factor[:didactical_resources] = 0.25
      factor[:stimulates_the_initiative_and_self_learning] = 0.14
      factor[:audiovisual_quality] = 0.33
      factor[:technical_and_static_elements] = 0.33
      factor[:navigation_and_interaction] = 0.34
    end
  end

  def calculate_questions(questions)
    questions.map { |question| (question.map { |q| percentage[q.to_s] }.compact.sum.to_f / evaluations.count) }.reduce(&:+) * 10
  end
end
