class Bottles
  CAP = 99

  def verse(bottles)
    first_two_sentences(bottles) +
      third_sentence(bottles) +
      final_sentence(bottles - 1)
  end

  def verses(start, finish)
    output = ''
    i = start

    while i >= finish
      output += verse(i)

      output += "\n" if i > finish

      i -= 1
    end
    output
  end

  def song
    verses(99, 0)
  end

  private

  def num_bottles(count)
    return 'no more' if count.zero?

    count
  end

  def plural(count)
    return 'bottles' if count != 1

    'bottle'
  end

  def take_down(count)
    return 'one' if count != 1

    'it'
  end

  def first_two_sentences(count)
    word = num_bottles(count)

    first_word = if word.is_a?(String)
                   word.capitalize
                 else
                   word
                 end

    "#{first_word} #{plural(count)} of beer on the wall, #{word} #{plural(count)} of beer.\n"
  end

  def third_sentence(count)
    if count.positive?
      "Take #{take_down(count)} down and pass it around, "
    else
      'Go to the store and buy some more, '
    end
  end

  def final_sentence(count)
    word = if count.zero?
             'no more'
           elsif count.negative?
             CAP
           else
             count
           end
    "#{word} #{plural(count)} of beer on the wall.\n"
  end
end
