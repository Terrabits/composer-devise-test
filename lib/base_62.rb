class Base62
  attr_reader :value

  def initialize(x)
    if x.class == 'Base62'
      @value = x.to_s
    elsif x.kind_of?(Numeric)
      @value = Base62.f_to_base_62(x)
    end
  end

  def to_f
    Base62.base_62_to_f(@value)
  end

  def to_s
    @value
  end

  def Base62.f_to_base_62(x)
    if x == 0
      return '0'
    end

    base = 62
    number_of_digits = Math.log(x, base).floor + 1
    result = '0' * number_of_digits
    remainder = x

    while remainder > 0 do
      i = Math.log(remainder, base).floor
      value = (remainder/(base**i)).floor
      result[i] = digit_to_base_62(value)
      remainder -= value * (base**i)
    end
    result.reverse
  end

  def Base62.base_62_to_f(x)
    x = x.reverse
    result = 0
    for i in 0..(x.length-1)
      result += base_62_digit_to_f(x[i]) * 62**i
    end
    result
  end

  private

  def Base62.digit_to_base_62(d)
    digits = ('0'..'9').to_a.join + ('a'..'z').to_a.join + ('A'..'Z').to_a.join
    digits[d]
  end

  def Base62.base_62_digit_to_f(d)
    digits = ('0'..'9').to_a.join + ('a'..'z').to_a.join + ('A'..'Z').to_a.join
    digits.index(d)
  end
end
