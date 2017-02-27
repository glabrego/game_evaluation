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
      result = (((evaluations.map { |v| percentage(v.r1) }.compact.sum.to_f / evaluations.count) * 100) + ((evaluations.map { |v| percentage(v.r2) }.compact.sum.to_f / evaluations.count) * 100)) * 10
      result = (1.0 / 20) * result
    end

    def content_quality_factor
      result = (((evaluations.map { |v| percentage(v.r8) }.compact.sum.to_f / evaluations.count) * 100) + ((evaluations.map { |v| percentage(v.r9) }.compact.sum.to_f / evaluations.count) * 100) + ((evaluations.map { |v| percentage(v.r10) }.compact.sum.to_f / evaluations.count) * 100) + ((evaluations.map { |v| percentage(v.r11) }.compact.sum.to_f / evaluations.count) * 100) + ((evaluations.map { |v| percentage(v.r12) }.compact.sum.to_f / evaluations.count) * 100)) * 10
      result = (1.0 / 50) * result
    end

    def versatility_factor
      result = (((evaluations.map { |v| percentage(v.r3) }.compact.sum.to_f / evaluations.count) * 100) + ((evaluations.map { |v| percentage(v.r4) }.compact.sum.to_f / evaluations.count) * 100) + ((evaluations.map { |v| percentage(v.r5) }.compact.sum.to_f / evaluations.count) * 100) + ((evaluations.map { |v| percentage(v.r18) }.compact.sum.to_f / evaluations.count) * 100)) * 10
      result = (1.0 / 40) * result
    end

    def pedagogical_aspects_factor
      result = ((evaluations.map { |v| percentage(v.r19) }.compact.sum.to_f / evaluations.count) * 100) * 10
      result = (1.0 / 10) * result
    end

    def didactical_resources_factor
      result = (((evaluations.map { |v| percentage(v.r20) }.compact.sum.to_f / evaluations.count) * 100) + ((evaluations.map { |v| percentage(v.r21) }.compact.sum.to_f / evaluations.count) * 100)) * 10
      result = (1.0 / 20) * result
    end

    def stimulates_the_initiative_and_self_learning_factor
      result = ((evaluations.map { |v| percentage(v.r22) }.compact.sum.to_f / evaluations.count) * 100) * 10
      result = (1.0 / 10) * result
    end

    def audiovisual_quality_factor
      result = ((evaluations.map { |v| percentage(v.r6) }.compact.sum.to_f / evaluations.count) * 100) * 10
      result = (1.0 / 10) * result
    end

    def technical_and_static_elements_factor
      result = ((evaluations.map { |v| percentage(v.r7) }.compact.sum.to_f / evaluations.count) * 100) * 10
      result = (1.0 / 10) * result
    end

    def navigation_and_interaction_factor
      result = (((evaluations.map { |v| percentage(v.r13) }.compact.sum.to_f / evaluations.count) * 100) + ((evaluations.map { |v| percentage(v.r14) }.compact.sum.to_f / evaluations.count) * 100) + ((evaluations.map { |v| percentage(v.r15) }.compact.sum.to_f / evaluations.count) * 100) + ((evaluations.map { |v| percentage(v.r16) }.compact.sum.to_f / evaluations.count) * 100)) * 10
      result = (1.0 / 40) * result
    end

  def percentage(point)
    case point
    when 1
      0
    when 2
      0.25
    when 3
      0.5
    when 4
      0.75
    when 5
      1
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

  private

  def calculate_median_of_question(question)
    (evaluations.map { |v| percentage(v.question) }.compact.sum.to_f / evaluations.count)
  end
end
