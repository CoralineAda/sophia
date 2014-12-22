module MarkovGrammar
  module Grammar
    module NaiveTense

      def present
        case plurality
        when :singular
          return self.base_form if self.person == :first    # I love
          return self.base_form if self.person == :second   # You love
          return self.in_s_form    if self.person == :third    # She loves
        when :plural
          return self.base_form if self.person == :first    # We love
          return self.base_form if self.person == :second   # You love
          return self.base_form if self.person == :third    # They love
        end
      end

      def present_participle
        case plurality
        when :singular
          return "am #{in_ing_form}"  if self.person == :first    # I am loving
          return "are #{in_ing_form}" if self.person == :second   # You are loving
          return "is #{in_ing_form}"  if self.person == :third    # He is loving
        when :plural
          return "are #{in_ing_form}" if self.person == :first    # We are loving
          return "are #{in_ing_form}" if self.person == :second   # You are loving
          return "are #{in_ing_form}" if self.person == :third    # They are loving
        end
      end

      def past
        in_ed_form
      end

      def past_participle
        in_ed_form
      end

      # Forms ====================================================================

      def in_s_form
        self.s_form || "#{self.base_form}s".gsub(/ss$/, 's')
      end

      def in_ed_form
        self.ed_form || "#{self.base_form}ed".gsub(/eed$/, 'ed')
      end

      def in_ing_form
        self.ing_form || "#{self.base_form}ing".gsub(/eing$/, 'ing')
      end

    end
  end
end