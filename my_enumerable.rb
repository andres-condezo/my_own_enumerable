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

  def any?
    if block_given?
      each { |n| return true if yield(n) }
    elsif param.nil?
      each { |n| return true if n }
    elsif !param.nil? && (param.is_a? Class)
      each { |n| return true if [n.class, n.class.superclass, n.class.superclass].include?(param) }
    elsif !param.nil? && (param.is_a? Regexp)
      each { |n| return true if n.match(param) }
    else
      each { |n| return true if n == param }
    end
    false
  end

  def filter
    list = []
    each { |item| list.push(item) if yield(item) }
    list
  end
end
