require 'spec_helper'

describe Topic do
  should_validate_presence_of :title
  should_validate_presence_of :user_id
end
