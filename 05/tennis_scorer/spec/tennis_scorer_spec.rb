# -*- encoding : utf-8 -*-
require_relative 'spec_helper'
require_relative '../tennis_scorer'

describe TennisScorer do

  subject(:scorer) { TennisScorer.new }

  describe '#score'

    context 'at the beginning' do
      its(:score) { should == '0-0' }
    end

    context 'server wins a point' do
      before do
        # ...
      end
      its(:score) { should == '15-0' }
    end

    context 'receiver wins a point' do
      its(:score) { should == '0-15' }
    end

    context 'both win a point' do
      its(:score) { should == '15-15' }
    end

    # ...
end
