def describe_chord(assertion_key, expectations)
  describe expectations[assertion_key] do
    subject { described_class.new( assertion_key => expectations[assertion_key] ) }
    it { should be_chord(expectations) }
  end
end
