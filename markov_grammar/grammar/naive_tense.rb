module Grammar
  module NaiveTense

    def past
      "#{self.base_form}ed".gsub(/eed$/, 'ed')
    end

  end
end