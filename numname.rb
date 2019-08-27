def english_number(number)
  units = ['','one','two','three','four','five','six','seven','eight','nine']
  prefix = ['','','twen','thir','four','fif','six','seven','eigh','nine']
  giganums = ['','thousand','million','billion','trillion','quatrillion','fiftillion','sixtillion','seventillion','eigtillion','ninetillion','tentillion']
  number = number.to_i

  numToWord = lambda do |n|
    n = n.to_i
    result = ''
    while true
      case n
      when 0..9
        result += units[n]
        break
      when 10
        result += 'ten'
        break
      when 11
        result += 'eleven'
        break
      when 12
        result += 'twelve'
        break
      when 13..19
        result += prefix[n-10] + 'teen'
        break
      when 20..99
        result += prefix[n/10] + "ty"
        n -= (n/10)*10
        if n <= 0
          break
        else
          result += ' '
        end
      when 100..999
        result += units[n/100] + '-hundred'
          n -= (n/100)*100
        if n <= 0
          break
        else
          result += ' '
        end
      end
    end
    return result
  end

  parseBignum = lambda do
    giganum = ''
    index = 1
    number.to_s.split('').reverse.each do |n|
      giganum = n + giganum
      giganum = ' ' + giganum if index % 3 == 0
      index += 1
    end
    giganum = giganum.split(' ')
    p giganum
    return giganum
  end

  result = ''

  parseBignum.call.reverse.each_with_index do |n, i|
    if n.to_i != 0
      result = numToWord.call(n) + " #{giganums[i]} " + result 
    end
  end

  result = 'zero' if number == 0

  return result.chomp

end

puts english_number 10012312342342422347123692
