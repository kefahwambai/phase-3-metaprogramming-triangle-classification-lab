class Triangle
  
  attr_accessor :type

  def initialize(s1, s2, s3)
    sides = [s1,s2,s3]
    sides.each.with_index do |s, i|
      if((sides[(i+1)%3] + sides[(i+2)%3]) <= s)
        raise TriangleError
      end
    end

    if(!!sides.find { |s| s <=0 })
      raise TriangleError
    end

    if(sides.uniq.length == 1)
      @type = "equilateral"
    elsif(sides.uniq.length == 2)
      @type = "isosceles"
    else
      @type = "scalene"
    end
  end

  def kind
    type.to_sym
  end

  class TriangleError < StandardError
    def message
    end
  end

end