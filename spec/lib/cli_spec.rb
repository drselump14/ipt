# typed: false
require 'spec_helper'

RSpec.shared_context "cli filter" do
  let(:filter) { 'mywork' }
  before :each do
    VCR.use_cassette(filter, record: :new_episodes) do
      run "bin/ipt #{filter}"
      stop_all_commands
    end
  end
end

describe PT::CLI, type: :aruba do
  let(:title) { 'random' }
  describe 'pt mywork' do
    before :each do
      VCR.use_cassette('my work', record: :new_episodes) do
        run 'bin/ipt'
        stop_all_commands
      end
    end
    it { expect(last_command_started.output).to include 'My Work' }
    it { expect(last_command_started.output).to include 'Kris' }
  end

  %w[ current backlog ].each do |scope|
    describe "pt #{scope}" do
      before :each do
        VCR.use_cassette("#{scope} iteration", record: :new_episodes) do
          run "bin/ipt #{scope}"
          stop_all_commands
        end
      end
      it { expect(last_command_started.output).to include "#{scope} iteration" }
    end
  end

  describe 'pt bug' do
    include_context 'cli filter' do
      let(:filter) { 'bug' }
    end
    it {expect(last_command_started.output).not_to include "⭐"}
    it { expect(last_command_started.output).to include "🐞" }
  end

  describe 'shows feature' do
    include_context 'cli filter' do
      let(:filter) { 'feature' }
    end
    it {expect(last_command_started.output).to include "⭐"}
    it { expect(last_command_started.output).not_to include "🐞" }
  end

  filters = %w[unscheduled started finished delivered rejected]
  filters.each_with_index do |state, index|
    describe "pt #{state}" do
      include_context 'cli filter' do
        let(:filter) { state }
      end
      it {expect(last_command_started.output).to include state}
    end
  end

  describe "pt create" do
    context 'with title' do
      before do
        VCR.use_cassette('create with title parameter', record: :new_episodes) do
          run "bin/ipt create #{title}"
        end
        stop_all_commands
      end

      it {expect(last_command_started.output).to include title}
    end

    context 'without title' do
      before do
        VCR.use_cassette('create without title parameter', record: :new_episodes) do
          run "bin/ipt create"
        end
        stop_all_commands
      end

      it { expect(last_command_started.output).to include 'new task'}
    end
  end

  PT::CLI::ACTION.each do |action|
    describe "pt #{action}" do
      include_context 'cli filter' do
        let(:filter) { action }
      end
      it {expect(last_command_started.output).to include action}
    end
  end

  describe 'pt find <query>' do
    before :each do
      VCR.use_cassette('find', record: :new_episodes) do
        run "bin/ipt find #{title}"
      end
      stop_all_commands
    end
    it {expect(last_command_started.output).to include title}
  end
end
