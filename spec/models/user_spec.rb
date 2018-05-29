describe User do

  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to define_enum_for(:role).with([:user, :teacher, :admin]) }
  end

  context '.set_default_role' do
    subject { create(:user) }

    it 'sets the default role for a user' do
      expect(subject.role).to eq('user')
    end
  end
end
