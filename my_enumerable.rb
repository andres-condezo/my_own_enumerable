module MyEnumerable
  def all?
    if block_given?
      each { |n| return false unless yield(n) }
    elsif param.nil?
      each { |n| return false if !n || n.nil? }
    elsif !param.nil? && (param.is_a? Class)
      each { |n| return false unless [n.class, n.class.superclass, n.class.superclass].include?(param) }
    elsif !param.nil? && (param.is_a? Regexp)
      each { |n| return false unless n.match(param) }
    else
      each { |n| return false unless n == param }
    end
    true
  end
end
