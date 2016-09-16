FactoryGirl.define do
  factory(:user) do
    username('admin')
    password('password')
  end
end
