RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      # Test factories in spec/factories are working.

      # TODO: Enable this when loaded core factories on ms_mortgage
      # FactoryBot.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
