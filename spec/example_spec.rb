require 'spec_helper'
require_relative '../bin/example'

describe '#hm2s' do
  it 'should convert 3h 30m to 12600' do
    expect(hm2s('3h 30m')).to eq 12600
  end

  it 'should convert 1h to 1800' do
    expect(hm2s('1h')).to eq 3600
  end

  it 'should convert 30m to 1800' do
    expect(hm2s('30m')).to eq 1800
  end

  it 'should raise an error given badly formatted input' do
    expect { hm2s('I_am_badly_formatted') }.
      to raise_error(RuntimeError, /illegal input/)
  end
end
