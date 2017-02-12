require 'spec_helper'

describe PT::CLI, type: :aruba do
  describe 'pt mywork' do
    before :each do
      VCR.use_cassette('my work') do
        run 'bin/pt'
        stop_all_commands
      end
    end
    it { expect(last_command_started.output).to include 'My Work' }
    it { expect(last_command_started.output).to include 'Kris' }
  end

  describe 'pt bug' do
    before do
      VCR.use_cassette('bug filter') do
        run 'bin/pt bug'
      end
      stop_all_commands
    end
    it {expect(last_command_started.output).not_to include "⭐"}
    it { expect(last_command_started.output).to include "🐞" }
  end

  describe 'shows feature' do
    before do
      VCR.use_cassette('feature filter') do
        run 'bin/pt feature'
      end
      stop_all_commands
    end
    it {expect(last_command_started.output).to include "⭐"}
    it { expect(last_command_started.output).not_to include "🐞" }
  end

  filters = %w[unscheduled started finished delivered rejected]
  filters.each_with_index do |state, index|
    describe "pt #{state}" do
      before do
        VCR.use_cassette("filter #{state}") do
          run "bin/pt #{state}"
        end
        stop_all_commands
      end
      it {expect(last_command_started.output).to include state}
    end
  end
end
