require 'optparse'

def filename(file)
  file.split(".")[0] + ".numero"
end

def compile(file)
  @parsed = true
  File.open(filename(file), "w+") do |file|
    file.write File.readlines(ARGV[0]).map { |l| l.split("").map { |c| c.unpack("C").first}.join(".")}.join(".")
  end
end

def parse(code)
  eval(code.join("").split(".").map { |c| c.to_i.chr }.join(""))
end

def to_be_compiled?(file)
  (File.readlines(file).first.split("").first =~ /\d/).nil?
end

# For converting the file back from Numero
if @parsed.nil?
  if to_be_compiled?(ARGV[0])
    compile(ARGV[0])
    parse(File.readlines(filename(ARGV[0])))
  else
    parse(File.readlines(ARGV[0]))
  end
end