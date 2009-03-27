require 'optparse'
OptionParser.new do |opts|
  # Converts to numero
  opts.on("-c", "--compile", "Compile numero code") do
    print "Compiling..."
    @parsed = true
    filename = ARGV[0].split(".")[0]
    File.open(filename + ".numero", "w+") do |file|
      file.write File.readlines(ARGV[0]).map { |l| l.split("").map { |c| c.unpack("C").first}.join(".")}.join(".")
    end
    puts " Done!"
  end.parse!
end


def parse(code)
  code.join("").split(".").map { |c| c.to_i.chr }.join("")
end


# For converting the file back from Numero
if @parsed.nil?
  parse(File.readlines(ARGV[0]))
end