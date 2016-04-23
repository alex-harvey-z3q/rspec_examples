require 'spec_helper'
require_relative '../bin/example'

describe '#get_data' do
  it 'should read YAML-formatted data from a file' do
    expected = {'times' => ['10h 3m', '2h 5m', '40m']}
    expect(get_data('spec/fixtures/good.yml')).to eq expected
  end

  it 'should error out if YAML is badly formatted' do
    expect { get_data('spec/fixtures/bad.yml') }.to
      raise_error(RuntimeError, /Error reading spec\/fixtures\/bad.yml/)
  end
end

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
