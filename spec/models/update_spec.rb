require 'spec_helper'

describe Update do
  should_validate_presence_of :body
  should_validate_presence_of :user_id
end
