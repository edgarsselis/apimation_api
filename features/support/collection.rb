class Collection
  attr_accessor :description
  attr_accessor :name
  attr_accessor :id
  attr_accessor :step_id
  attr_accessor :step_name

  def initialize(description, name)
    @description = description
    @name = name
    @session_cookie = {}
  end

  def set_collection_id(id)
    @id = id
  end
end

class Request
  attr_accessor :description
  attr_accessor :name
  attr_accessor :step_id

  def initialize(description, name)
    @description = description
    @name = name
    @session_cookie = {}
  end

  def set_step_id(step_id)
    @step_id = step_id
  end
end
