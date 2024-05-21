def count_bytes(text)
  text.bytesize
end

def count_lines(text)
  text.lines.size
end

def count_words(text)
  text.split.size
end

def count_chars(text)
  text.size
end

methods = {
  '-c' => method(:count_bytes),
  '-l' => method(:count_lines),
  '-w' => method(:count_words),
  '-m' => method(:count_chars),
}

VALID_OPTIONS = methods.keys

if __FILE__ == $0
  options = ARGV.grep(/^-[a-zA-Z]/).select { |opt| VALID_OPTIONS.include?(opt) }
  filepath = ARGV.grep(/^[^-]/).first

  text =
    if !filepath.nil? and File.exist?(filepath)
      file = File.open(filepath)
      file.read
    else
      STDIN.read
    end

  retval =
    if options.empty?
      lines = count_lines(text)
      words = count_words(text)
      bytes = count_bytes(text)
      "#{lines} #{words} #{bytes}"
    else
      values = options.map { |opt| methods[opt].(text) }
      values.join(" ")
    end

  puts retval + (filepath.nil? ? '' : " #{filepath}")

end
