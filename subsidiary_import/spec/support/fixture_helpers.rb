module FixtureHelpers

  def fixture_file name
    File.new File.join(fixture_path, name)
  end

end

RSpec.configure do |c|
  c.include FixtureHelpers
end
