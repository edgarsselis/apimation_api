class Project
  attr_accessor :name
  attr_accessor :type
  attr_accessor :project_id
  attr_accessor :session_cookie

  def initialize(name, type)
    @name = name
    @type = type
    @session_cookie = {}
  end

  def set_project_id(project_id)
    @project_id = project_id
  end
end

class Environment
  attr_accessor :name
  attr_accessor :environment_id
  attr_accessor :session_cookie

  def initialize(name)
    @name = name
    @session_cookie = {}
  end

  def set_environment_id(environment_id)
    @environment_id = environment_id
  end
end

