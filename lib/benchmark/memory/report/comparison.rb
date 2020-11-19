# frozen_string_literal: true

module Benchmark
  module Memory
    class Report
      # Compare entries against each other.
      class Comparison
        # Instantiate a new comparison.
        #
        # @param entries [Array<Entry>] The entries to compare.
        def initialize(entries)
          @entries = entries.sort_by(&:measurement)
        end

        # @return [Array<Entry>] The entries to compare.
        attr_reader :entries

        # Check if the comparison is possible
        #
        # @return [Boolean]
        def possible?
          entries.size > 1
        end
      end
    end
  end
end
