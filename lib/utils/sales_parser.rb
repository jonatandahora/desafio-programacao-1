
class Utils::SalesParser
  def self.parse(file, with_header = false, separator = "\t")
    lines_to_drop = with_header ? 0 : 1
    parsed = Array.new

    file.readlines.drop(lines_to_drop).each do |line|
      parsed << line.sub("\n", "").split(separator)
    end
    parsed
  end
end
