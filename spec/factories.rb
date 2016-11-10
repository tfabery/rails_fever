FactoryGirl.define do
  factory(:user) do
    username('admin')
    email('admin@admin.com')
    password('password')
  end
  factory(:post) do
    title('test')
    content('test content')
  end
end
