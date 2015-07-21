require 'singleton'
require 'rake/testtask'
require_relative 'knapsack_pro/version'
require_relative 'knapsack_pro/credentials'
require_relative 'knapsack_pro/logger'
require_relative 'knapsack_pro/config/env'
require_relative 'knapsack_pro/allocator'
require_relative 'knapsack_pro/allocator_builder'
#require_relative 'knapsack_pro/task_loader'
#require_relative 'knapsack_pro/adapters/base_adapter'
#require_relative 'knapsack_pro/adapters/rspec_adapter'
#require_relative 'knapsack_pro/adapters/cucumber_adapter'
#require_relative 'knapsack_pro/adapters/minitest_adapter'
require_relative 'knapsack_pro/runners/rspec_runner'
#require_relative 'knapsack_pro/runners/cucumber_runner'
#require_relative 'knapsack_pro/runners/minitest_runner'

module KnapsackPro
  class << self
    def root
      File.expand_path('../..', __FILE__)
    end

    def logger
      return @logger if @logger
      log = KnapsackPro::Logger.new
      log.level = KnapsackPro::Logger::INFO
      @logger = log
    end

    def logger=(value)
      @logger = value
    end
  end
end
