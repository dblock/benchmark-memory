require "benchmark/memory/job/task"
require "benchmark/memory/report"

module Benchmark
  module Memory
    # Encapsulate the memory measurements of reports.
    class Job
      # Instantiate a job for containing memory performance reports.
      # @return [Job]
      def initialize
        @full_report = Report.new
        @tasks = []
      end

      # @return [Report] the full report of all measurements in the job.
      attr_reader :full_report

      # @return [Array<Task>] the measurement tasks to run.
      attr_reader :tasks

      # Add a measurement entry to the job to measure the specified block.
      #
      # @param label [String] The label for the measured code.
      # @param block [Proc] Code the measure.
      #
      # @raise [ArgumentError] if no code block is specified.
      def report(label = "", &block)
        fail ArgumentError, "You did not specify a block for the item" unless block_given?

        tasks.push Task.new(label, block)
      end

      # Run the job and outputs its full report.
      #
      # @return [Report]
      def run
        full_report
      end
    end
  end
end
