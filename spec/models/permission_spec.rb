require 'spec_helper'

describe Permission do
  should_validate_presence_of :user_id
  should_validate_presence_of :project_id
  should_validate_presence_of :permission_type
  should_validate_inclusion_of :permission_type, :in=>Permission::PERMISSION_TYPES

end
