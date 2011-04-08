module Calc
  
  def self.evaluate( unsafe_expression )
    return nil if unsafe_expression.nil?

    safe_expression = sanitize( unsafe_expression )
    
    return unsafe_expression if blank?( safe_expression )
    
    begin
      return eval( safe_expression )
    rescue SyntaxError, NoMethodError
      # return expression verbatim so ActiveModel::Validations could take care of this
      return unsafe_expression
    end
  end

  def self.evaluate_to_int( unsafe_expression )
    return nil if unsafe_expression.nil?
    return unsafe_expression if unsafe_expression.blank?
    return evaluate( unsafe_expression ).to_i
  end

  private

    def self.sanitize( unsafe_expression )
      allowed_characters = Regexp.escape( '+-*/.()' )
      return unsafe_expression.gsub( /[^\d#{allowed_characters}]/, '' )
    end

    def self.blank?( s )
      s =~ /^\s*$/
    end

end
