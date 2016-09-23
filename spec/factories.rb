FactoryGirl.define do
  factory(:user) do
    username('admin')
    password('password')
  end
  factory(:post) do
    title('test')
    content('test content')
  end
end
