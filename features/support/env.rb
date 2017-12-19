Before() do
  puts "Before hook, this will work before every test case!"
  @test_user = User.new('qaedgars@gmail.com', 'qaParole123')
  @test_project = Project.new('TestProject' + DateTime.now.strftime('%Q'), 'basic')
  @dev_environment = Environment.new('DEV')
  @prod_environment = Environment.new('PROD')
  @test_collection = Collection.new('', 'TESTAPI' + DateTime.now.strftime('%Q'))
  @test_request = Request.new('', 'Step name')

end

After() do
  puts "This happens after test!"
end