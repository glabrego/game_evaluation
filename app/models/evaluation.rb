class Evaluation < ApplicationRecord
  class << self
    def easy_of_use_factor
      result = (((index.map{ |v| percentage(v.r1) }.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r2) }.reduce(&:+) / index.count) * 100)) * 10
      result = (1.0 / 20) * result
    end

    def content_quality_factor
      # r8, r9, r10, r11, r12
      result = (((index.map{ |v| percentage(v.r8) }.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r9) }.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r10) }.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r11) }.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r12) }.reduce(&:+) / index.count) * 100)) * 10
      result = (1.0 / 50) * result
    end

    def versatility_factor
      # r3, r4, r5, r18
      result = (((index.map{ |v| percentage(v.r3) }.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r4) }.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r5) }.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r18) }.reduce(&:+) / index.count) * 100)) * 10
      result = (1.0 / 40) * result
    end

    def pedagogical_aspects_factor
      # r19
      result = ((index.map{ |v| percentage(v.r19) }.reduce(&:+) / index.count) * 100) * 10
      result = (1.0 / 10) * result
    end

    def didactical_resources_factor
      # r20, r21
      result = (((index.map{ |v| percentage(v.r20) }.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r21) }.reduce(&:+) / index.count) * 100)) * 10
      result = (1.0 / 20) * result
    end

    def stimulates_the_initiative_and_self_learning_factor
      # r22
      result = ((index.map{ |v| percentage(v.r22) }.reduce(&:+) / index.count) * 100) * 10
      result = (1.0 / 10) * result
    end

    def audiovisual_quality_factor
      # r6
      result = ((index.map{ |v| percentage(v.r6) }.reduce(&:+) / index.count) * 100) * 10
      result = (1.0 / 10) * result
    end

    def technical_and_static_elements_factor
      # r7
      result = ((index.map{ |v| percentage(v.r7) }.reduce(&:+) / index.count) * 100) * 10
      result = (1.0 / 10) * result
    end

    def navigation_and_interaction_factor
      # r13, r14, r15, r16
      result = (((index.map{ |v| percentage(v.r13) }.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r14) }.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r15) }.reduce(&:+) / index.count) * 100) + ((index.map{ |v| percentage(v.r16) }.reduce(&:+) / index.count) * 100)) * 10
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
