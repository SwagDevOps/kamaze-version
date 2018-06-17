# frozen_string_literal: true

require 'kamaze/version'

describe Kamaze::Version, :version do
  # class methods
  it do
    expect(described_class).to respond_to(:new).with(0).arguments
    expect(described_class).to respond_to(:new).with(1).arguments
  end

  # instance methods
  it do
    expect(subject).to respond_to(:file).with(0).arguments
    expect(subject).to respond_to(:valid?).with(0).arguments
    expect(subject).to respond_to(:to_h).with(0).arguments
    expect(subject).to respond_to(:to_path).with(0).arguments
  end
end

# testing using current context
describe Kamaze::Version, :version do
  let(:subject) { Kamaze::Version::VERSION }

  it { expect(subject).to be_a(described_class) }

  context '#to_path' do
    it { expect(subject.to_path).to be_a(String) }
  end

  context '#to_h' do
    it { expect(subject.to_h).to be_a(Hash) }
  end

  context '#to_s' do
    it { expect(subject.to_s).to match(/^([0-9]+\.){2}[0-9]+$/) }
  end

  context '#valid?' do
    it { expect(subject.valid?).to be(true) }
  end

  context '#file' do
    it { expect(subject.file).to be_a(Pathname) }
  end

  context '#file.file?' do
    it { expect(subject.file.file?).to be(true) }
  end
end

# testing using current version file (symlink)
describe Kamaze::Version, :version do
  let(:file) { sham!(:version).samples.fetch('current') }
  let(:subject) { described_class.new(file) }

  context '#parse' do
    it { expect(subject.__send__(:parse, file)).to be_a(Hash) }
  end

  context '#to_path' do
    it { expect(subject.to_path).to be_a(String) }
  end

  context '#to_h' do
    it { expect(subject.to_h).to be_a(Hash) }
  end

  context '#to_s' do
    it { expect(subject.to_s).to match(/^([0-9]+\.){2}[0-9]+$/) }
  end

  context '#valid?' do
    it { expect(subject.valid?).to be(true) }
  end

  context '#file' do
    it { expect(subject.file).to be_a(Pathname) }
  end

  context '#file.file?' do
    it { expect(subject.file.file?).to be(true) }
  end
end

# testing using valid version file
describe Kamaze::Version, :version do
  let(:file) { sham!(:version).samples.fetch('valid') }
  let(:subject) { described_class.new(file) }

  context '#parse' do
    it { expect(subject.__send__(:parse, file)).to be_a(Hash) }
  end

  context '#to_path' do
    it { expect(subject.to_path).to be_a(String) }
    it { expect(subject.to_path).to match(/\/valid\.yml$/) }
  end

  context '#to_h' do
    it { expect(subject.to_h).to be_a(Hash) }
  end

  context '#to_h.keys' do
    it do
      keys = [:major, :minor, :patch,
              :authors, :email, :homepage,
              :date, :patent, :summary, :description].map(&:to_s)

      expect(subject.to_h.keys).to eq(keys)
    end
  end

  context '#authors' do
    it { expect(subject.authors).to eq(['Nikola Tesla']) }
  end

  context '#email' do
    it { expect(subject.email).to eq('nikola.tesla.@example.org') }
  end

  context '#patent' do
    it { expect(subject.patent).to eq('1,061,206') }
  end

  context '#date' do
    it { expect(subject.date).to eq('1913-05-06') }
  end

  context '#summary' do
    summary = 'The Tesla turbine is a bladeless centripetal flow.'

    it { expect(subject.summary).to eq(summary) }
  end

  context '#to_s' do
    it { expect(subject.to_s).to eq('3.1.4') }
  end

  context '#valid?' do
    it { expect(subject.valid?).to be(true) }
  end

  context '#file' do
    it { expect(subject.file).to be_a(Pathname) }
  end

  context '#file.file?' do
    it { expect(subject.file.file?).to be(true) }
  end
end

# testing on empty file
describe Kamaze::Version, :version do
  let(:file) { sham!(:version).samples.fetch('empty') }
  let(:subject) { described_class.new(file) }

  context '#valid?' do
    it { expect(subject.valid?).to be(false) }
  end

  context '#to_h' do
    it do
      expect(subject.to_h).to be_a(Hash)
      expect(subject.to_h).to be_empty
    end
  end

  context '#to_s' do
    it do
      regexp = /undefined local variable or method `major'/

      expect { subject.to_s }.to raise_error(NameError, regexp)
    end
  end
end

# testing on invalid (incomplete description), missing major
describe Kamaze::Version, :version do
  let(:file) { sham!(:version).samples.fetch('invalid_major') }
  let(:subject) { described_class.new(file) }

  context '#valid?' do
    it { expect(subject.valid?).to be(false) }
  end

  context '#to_s' do
    it do
      regexp = /undefined local variable or method `major'/

      expect { subject.to_s }.to raise_error(NameError, regexp)
    end
  end
end

# testing on invalid (incomplete description), missing minor
describe Kamaze::Version, :version do
  let(:file) { sham!(:version).samples.fetch('invalid_minor') }
  let(:subject) { described_class.new(file) }

  context '#valid?' do
    it { expect(subject.valid?).to be(false) }
  end

  context '#to_s' do
    it do
      regexp = /undefined local variable or method `minor'/

      expect { subject.to_s }.to raise_error(NameError, regexp)
    end
  end
end

# testing on invalid (incomplete description), missing patch
describe Kamaze::Version, :version do
  let(:file) { sham!(:version).samples.fetch('invalid_patch') }
  let(:subject) { described_class.new(file) }

  context '#valid?' do
    it { expect(subject.valid?).to be(false) }
  end

  context '#to_s' do
    it do
      regexp = /undefined local variable or method `patch'/

      expect { subject.to_s }.to raise_error(NameError, regexp)
    end
  end
end

# testing on inexisting file
describe Kamaze::Version, :version do
  let(:file) { sham!(:version).samples.fetch('random') }
  let(:subject) { described_class.new(file) }

  context '#valid?' do
    it { expect(subject.valid?).to be(false) }
  end

  context '#to_h' do
    it do
      expect(subject.to_h).to be_a(Hash)
      expect(subject.to_h).to be_empty
    end
  end

  context '#to_s' do
    it do
      regexp = /undefined local variable or method `major'/

      expect { subject.to_s }.to raise_error(NameError, regexp)
    end
  end
end
