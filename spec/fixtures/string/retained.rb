$LOAD_PATH.unshift(File.expand_path(File.join(__FILE__, "../../../../lib")))

require 'living_dead'

def run
  @string = ""
  LivingDead.trace(@string)

  return nil
end

run

alive_count = LivingDead.traced_objects.select { |tracer| tracer.retained? }.length

expected = Integer(ENV["EXPECTED_OUT"] || 1)
actual = alive_count
result = expected == actual ? "PASS" : "FAIL"
puts "#{result}: expected: #{expected}, actual: #{actual}"
