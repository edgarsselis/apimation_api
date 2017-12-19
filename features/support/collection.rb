class Collection
  attr_accessor :description
  attr_accessor :name
  attr_accessor :id

  def initialize(description, name)
    @description = description
    @name = name
    @session_cookie = {}
  end

  def set_collection_id(id)
    @collection_id = id
  end

end