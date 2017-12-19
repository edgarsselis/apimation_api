require 'rest-client'
require 'test-unit'
def create_project
  project_payload = { name: @test_project.name,
                      type: @test_project.type }.to_json

  response = post('https://www.apimation.com/projects',
                  headers: { 'Content-Type' => 'application/json' },
                  cookies: @test_user.session_cookie,
                  payload: project_payload)

  # Check if 200 OK is received
  assert_equal(200, response.code, "Project creation failed: Response: #{response}")

  p response

  response_hash = JSON.parse(response)

  assert_equal(@test_project.name, response_hash['name'], 'Name in the response is not correct')
  assert_not_equal(nil, response_hash['id'], 'Project ID is empty!')
  assert_equal(@test_project.type, response_hash['type'], 'Type in the response is not correct')

  @test_project.set_project_id(response_hash['id'])
end

def delete_active
  response = delete('https://www.apimation.com/environments/active',
                    headers: { 'Content-Type' => 'application/json' },
                    cookies: @test_user.session_cookie)

  # Check if 204 No Content is received
  assert_equal(204, response.code, "Project failed: Response: #{response}")
end

def select_project
  response = get('https://www.apimation.com/projects',
                 headers: { 'Content-Type' => 'application/json' },
                 cookies: @test_user.session_cookie)

  # Check if 200 OK is received
  assert_equal(200, response.code, "Project creation failed: Response: #{response}")

  response_hash = JSON.parse(response)

  @test_project.set_project_id(response_hash[20]['id'])
  p @test_project.project_id
  end

def open_project
  select_project
  response = put('https://www.apimation.com/projects/active/' + @test_project.project_id,
                 headers: { 'Content-Type' => 'text/html' },
                 cookies: @test_user.session_cookie)

  # Check if 204 No Content is received
  assert_equal(204, response.code, "Project failed: Response: #{response}")
end

def create_dev_environment
  project_payload = { name: @dev_environment.name }.to_json

  response = post('https://www.apimation.com/environments',
                  headers: { 'Content-Type' => 'application/json' },
                  cookies: @test_user.session_cookie,
                  payload: project_payload)

  # Check if 200 OK is received
  assert_equal(200, response.code, "DEV environment creation failed: Response: #{response}")

  p response

  response_hash = JSON.parse(response)

  assert_equal(@dev_environment.name, response_hash['name'], 'Name in the response is not correct')
  assert_not_equal(nil, response_hash['id'], 'Environment ID is empty!')

  @dev_environment.set_environment_id(response_hash['id'])
end

def create_prod_environment
  project_payload = { name: @prod_environment.name }.to_json

  response = post('https://www.apimation.com/environments',
                  headers: { 'Content-Type' => 'application/json' },
                  cookies: @test_user.session_cookie,
                  payload: project_payload)

  # Check if 200 OK is received
  assert_equal(200, response.code, "PROD environment creation failed: Response: #{response}")

  p response

  response_hash = JSON.parse(response)

  assert_equal(@prod_environment.name, response_hash['name'], 'Name in the response is not correct')
  assert_not_equal(nil, response_hash['id'], 'Environment ID is empty!')

  @prod_environment.set_environment_id(response_hash['id'])
end

def delete_dev_env
  response = delete('https://www.apimation.com/environments/' + @dev_environment.environment_id,
                    headers: { 'Content-Type' => 'text/html' },
                    cookies: @test_user.session_cookie)

  # Check if 204 No Content is received
  assert_equal(204, response.code, "Environment failed: Response: #{response}")
end

def delete_prod_env
  response = delete('https://www.apimation.com/environments/' + @prod_environment.environment_id,
                    headers: { 'Content-Type' => 'text/html' },
                    cookies: @test_user.session_cookie)

  # Check if 204 No Content is received
  assert_equal(204, response.code, "Environment failed: Response: #{response}")
end

def add_dev_env_variables
  variable_payload = { global_vars: [{ key: '$key1', value: 'value1' },
                                     { key: '$key2', value: 'value2' }] }.to_json

  response = put('https://www.apimation.com/environments/' + @dev_environment.environment_id,
                 headers: { 'Content-Type' => 'text/html' },
                 cookies: @test_user.session_cookie,
                 payload: variable_payload)

  # Check if 204 No Content is received
  assert_equal(204, response.code, "Environment failed: Response: #{response}")
end

def add_prod_env_variables
  variable_payload = { global_vars: [{ key: '$key1', value: 'value1' },
                                     { key: '$key2', value: 'value2' }] }.to_json

  response = put('https://www.apimation.com/environments/' + @prod_environment.environment_id,
                 headers: { 'Content-Type' => 'text/html' },
                 cookies: @test_user.session_cookie,
                 payload: variable_payload)

  # Check if 204 No Content is received
  assert_equal(204, response.code, "Environment failed: Response: #{response}")
end

def create_collection
  collection_payload = { name: @test_collection.name,
                         description: @test_collection.description }.to_json

  response = post('https://www.apimation.com/collections',
                  headers: { 'Content-Type' => 'application/json' },
                  cookies: @test_user.session_cookie,
                  payload: collection_payload)

  # Check if 200 OK is received
  assert_equal(200, response.code, "Test case creation failed: Response: #{response}")

  p response

  response_hash = JSON.parse(response)

  @test_collection.set_collection_id(response_hash['id'])
  p @test_collection.id
end

def create_request
  step_payload = { collection_id: @test_collection.id,
                   description: @test_request.description,
                   name: @test_request.name,
                   paste: false,
                   request: { method: 'POST',
                              url: 'https://apimation.com/login',
                              type: 'raw',
                              body: '{"login":"qaedgars@gmail.com","password":"qaParole123"}',
                              binaryContent: { value: '',
                                               filename: '' },
                              urlEncParams: [{ name: '',
                                               value: '' }],
                              formData: [{ type: 'text',
                                           value: '',
                                           name: '',
                                           filename: '' }],
                              headers: [{ name: '',
                                          value: '' }],
                              greps: [],
                              auth: { type: 'noAuth',
                                      data: {} } } }.to_json

  response = post('https://www.apimation.com/steps/',
                  headers: { 'Content-Type' => 'application/json' },
                  cookies: @test_user.session_cookie,
                  payload: step_payload)

  # Check if 200 OK is received
  assert_equal(200, response.code, "Test case creation failed: Response: #{response}")
end
