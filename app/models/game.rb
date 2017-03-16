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
    result = (calculate_question(evaluations.pluck(:r1)) + calculate_question(evaluations.pluck(:r2))) * 10
    result = (1.0 / 20) * result
  end

  def content_quality_factor
    result = (calculate_question(evaluations.pluck(:r8)) + calculate_question(evaluations.pluck(:r9)) + calculate_question(evaluations.pluck(:r10)) + calculate_question(evaluations.pluck(:r11)) + calculate_question(evaluations.pluck(:r12))) * 10
    result = (1.0 / 50) * result
  end

  def versatility_factor
    result = (calculate_question(evaluations.pluck(:r3)) + calculate_question(evaluations.pluck(:r4)) + calculate_question(evaluations.pluck(:r5)) + calculate_question(evaluations.pluck(:r18))) * 10
    result = (1.0 / 40) * result
  end

  def pedagogical_aspects_factor
    result = calculate_question(evaluations.pluck(:r19)) * 10
    result = (1.0 / 10) * result
  end

  def didactical_resources_factor
    result = (calculate_question(evaluations.pluck(:r20)) + calculate_question(evaluations.pluck(:r21))) * 10
    result = (1.0 / 20) * result
  end

  def stimulates_the_initiative_and_self_learning_factor
    result = calculate_question(evaluations.pluck(:r22)) * 10
    result = (1.0 / 10) * result
  end

  def audiovisual_quality_factor
    result = calculate_question(evaluations.pluck(:r6)) * 10
    result = (1.0 / 10) * result
  end

  def technical_and_static_elements_factor
    result = calculate_question(evaluations.pluck(:r7)) * 10
    result = (1.0 / 10) * result
  end

  def navigation_and_interaction_factor
    result = (calculate_question(evaluations.pluck(:r13)) + calculate_question(evaluations.pluck(:r14)) + calculate_question(evaluations.pluck(:r15)) + calculate_question(evaluations.pluck(:r16))) * 10
    result = (1.0 / 40) * result
  end

  private

  def percentage
    Hash.new.tap do |p|
      p["1"] = 0
      p["2"] = 0.25
      p["3"] = 0.5
      p["4"] = 0.75
      p["5"] = 1
    end
  end

  def factors_weight
    Hash.new.tap do |factor|
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

  def calculate_question(question)
    (question.map{ |q| percentage["#{q}"]}.compact.sum.to_f / evaluations.count) * 100
  end
end
