module StringCalculator
  def add
    return 0 if empty?
    raise_if_negatives
    return digits.inject {|sum, x| sum + x }
  end

  def raise_if_negatives
    raise "Negatives not allowed: #{negatives.join(", ")}" unless negatives.empty?
  end

  def negatives
    @negatives ||= digits.select {|x| x<0}
  end

  def digits
    gsub("\n",delimiter).split(delimiter).map{|x| x.to_i}
  end

  def delimiter
    @delimiter ||= self[0,2] == '//' ? self[2,1] : ','
  end
end
