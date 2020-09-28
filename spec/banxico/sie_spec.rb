RSpec.describe Banxico::SIE do
  it "has a version number" do
    expect(Banxico::SIE::VERSION).not_to be nil
  end

  it 'configures gem' do
    # Given
    base_uri = 'http://google.com'
    key = 'random_key1'

    # When
    Banxico::SIE.config do |c|
      c.base_uri = base_uri
      c.key = key
    end

    # Then
    expect(Banxico::SIE.base_uri).to eq base_uri
    expect(Banxico::SIE.key).to eq key
  end
end
