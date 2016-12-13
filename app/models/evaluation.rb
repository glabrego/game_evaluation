class Evaluation < ApplicationRecord
  class << self
    def easy_of_use_factor
      result = (((index.map{ |v| percentage(v.r1) }.compact.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r2) }.compact.reduce(&:+) / index.count) * 100)) * 10
      result = (1.0 / 20) * result
    end

    def content_quality_factor
      result = (((index.map{ |v| percentage(v.r8) }.compact.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r9) }.compact.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r10) }.compact.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r11) }.compact.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r12) }.compact.reduce(&:+) / index.count) * 100)) * 10
      result = (1.0 / 50) * result
    end

    def versatility_factor
      result = (((index.map{ |v| percentage(v.r3) }.compact.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r4) }.compact.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r5) }.compact.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r18) }.compact.reduce(&:+) / index.count) * 100)) * 10
      result = (1.0 / 40) * result
    end

    def pedagogical_aspects_factor
      result = ((index.map{ |v| percentage(v.r19) }.compact.reduce(&:+) / index.count) * 100) * 10
      result = (1.0 / 10) * result
    end

    def didactical_resources_factor
      result = (((index.map{ |v| percentage(v.r20) }.compact.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r21) }.compact.reduce(&:+) / index.count) * 100)) * 10
      result = (1.0 / 20) * result
    end

    def stimulates_the_initiative_and_self_learning_factor
      result = ((index.map{ |v| percentage(v.r22) }.compact.reduce(&:+) / index.count) * 100) * 10
      result = (1.0 / 10) * result
    end

    def audiovisual_quality_factor
      result = ((index.map{ |v| percentage(v.r6) }.compact.reduce(&:+) / index.count) * 100) * 10
      result = (1.0 / 10) * result
    end

    def technical_and_static_elements_factor
      result = ((index.map{ |v| percentage(v.r7) }.compact.reduce(&:+) / index.count) * 100) * 10
      result = (1.0 / 10) * result
    end

    def navigation_and_interaction_factor
      result = (((index.map{ |v| percentage(v.r13) }.compact.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r14) }.compact.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r15) }.compact.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r16) }.compact.reduce(&:+) / index.count) * 100)) * 10
      result = (1.0 / 40) * result
    end

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
      (1-(funcionality_dimension / 100)) + (1-(efficiency_dimension / 100)) + (1-(adaptability_dimension / 100))
    end

    def system_quality
      ((1 - (euclidean_distance / Math::sqrt(10))) * 100)
    end

    def percentage(q)
      case q
      when 1
        return 0
      when 2
        return 0.25
      when 3
        return 0.5
      when 4
        return 0.75
      when 5
        return 1
      end
    end

    def index
      evaluation ||= Evaluation.all
    end

    def factors_weight
      {
        easy_of_use: 0.5,
        content_quality: 0.5,
        versatility: 0.44,
        pedagogical_aspects: 0.11,
        didactical_resources: 0.22,
        stimulates_the_initiative_and_self_learning: 0.11,
        audiovisual_quality: 0.25,
        technical_and_static_elements: 0.25,
        navigation_and_interaction: 0.25,
        originality_and_use_of_advanced_tecnology: 0.25
      }
    end
  end
end
