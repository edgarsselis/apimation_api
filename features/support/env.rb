Before() do
  puts "Before hook, this will work before every test case!"
  @test_user = User.new('qaedgars@gmail.com', 'qaParole123')
end