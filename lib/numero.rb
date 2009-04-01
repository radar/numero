require 'optparse'

module Numero
  def filename(file)
    file.split(".")[0] + ".numero"
  end

  def compile(file)
    raise "File does not exist!" if !File.exist?(file)
    File.open(filename(file), "w+") do |f|
      f.write File.readlines(file).map { |l| l.split("").map { |c| c.unpack("C").first }.join(".")}.join(".")
    end
  end

  def parse(code)
    eval(code.join("").split(".").map { |c| c.to_i.chr }.join(""))
  end

  def to_be_compiled?(file)
    (File.readlines(file).first.split("").first =~ /\d/).nil?
  end
end
# For converting the file back from Numero
if __FILE__ == "/usr/bin/numero"
  include Numero
  if to_be_compiled?(ARGV[0])
    compile(ARGV[0])
    parse(File.readlines(filename(ARGV[0])))
  else
    parse(File.readlines(ARGV[0]))
  end
end