module KnapsackPro
  module Runners
    class RSpecRunner < BaseRunner
      def self.run(args)
        ENV['KNAPSACK_PRO_TEST_SUITE_TOKEN'] = KnapsackPro::Config::Env.test_suite_token_rspec
        ENV['KNAPSACK_PRO_RECORDING_ENABLED'] = 'true'

        runner = new(KnapsackPro::Adapters::RSpecAdapter)

        require 'rspec/core/rake_task'
        RSpec::Core::RakeTask.new(:spec) do |t|
          t.rspec_opts = "#{args} --default-path #{runner.test_dir}"
          t.pattern = runner.test_file_paths
        end
        Rake::Task[:spec].invoke
      end
    end
  end
end
