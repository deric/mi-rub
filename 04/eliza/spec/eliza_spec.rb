require 'rspec'
require 'rspec'
require_relative 'spec_helper'
require_relative '../eliza_server'
require_relative '../eliza_client'

describe 'Elisa server' do

  subject { ElizaClient.new('localhost', port) }
  let(:port) { 112233 }

  describe 'client connection' do
    it 'should accept client connections' do
      expect(subject.say 'Hello').to eq 'Hello. My name is Eliza.  How may I help you?'
    end

    it 'should ignore font CaSE' do
      expect(subject.say 'hello').to eq 'Hello. My name is Eliza.  How may I help you?'
      expect(subject.say 'HELLO').to eq 'Hello. My name is Eliza.  How may I help you?'
    end
  end

  describe 'simple conversation' do
    it 'should provide reasonable anwsers' do
      expect(subject.say 'Hello').to eq 'Hello. My name is Eliza.  How may I help you?'
      expect(subject.say 'I have a terrible headache').to eq 'Maybe you should consult a doctor of medicine.'
      expect(subject.say 'I have a terrible stomachache').to eq 'Maybe you should consult a doctor of medicine.'
    end
  end

  describe 'ask for details' do
    it 'should provide reasonable anwsers' do
      expect(subject.say 'I have a problem').to eq 'Say, do you have any psychological problems?'
      expect(subject.say 'No, not really').to eq 'Are you sure?'
    end

    it 'should look for keywords' do
      expect(subject.say 'My mother always said...').to eq 'You mentioned your mother, how\'s your relationship?'
      expect(subject.say 'No, not really').to eq 'Are you sure?'
    end
  end

  describe 'questions concerting psychologist' do
    it 'should focus on client' do
      expect(subject.say 'Do you have time tomorrow').to eq 'We were discussing you, not me.'
    end

  end

end