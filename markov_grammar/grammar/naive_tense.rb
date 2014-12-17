module Grammar
  module NaiveTense

    def present
      case plurality
      when :singular
        return self.base_form if self.person == :first    # I love
        return self.base_form if self.person == :second   # You love
        return self.s_form    if self.person == :third    # She loves
      when :plural
        return self.base_form if self.person == :first    # We love
        return self.base_form if self.person == :second   # You love
        return self.base_form if self.person == :third    # They love
      end
    end

    def present_participle
      case plurality
      when :singular
        return "am #{self.ing_form}"  if self.person == :first    # I am loving
        return "are #{self.ing_form}" if self.person == :second   # You are loving
        return "is #{self.ing_form}"  if self.person == :third    # He is loving
      when :plural
        return "are #{self.ing_form}" if self.person == :first    # We are loving
        return "are #{self.ing_form}" if self.person == :second   # You are loving
        return "are #{self.ing_form}" if self.person == :third    # They are loving
      end
    end

    def past
      ed_form
    end

    def past_participle
      ed_form
    end

    # Forms ====================================================================

    def s_form
      "#{self.base_form}s".gsub(/ss$/, 's')
    end

    def ed_form
      "#{self.base_form}ed".gsub(/eed$/, 'ed')
    end

    def ing_form
      "#{self.base_form}ing".gsub(/eing$/, 'ing')
    end

  end
end