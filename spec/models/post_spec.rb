require 'spec_helper'

describe Post do
  should_validate_presence_of :body
end
