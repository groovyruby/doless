Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.sequence :name do |n|
  "sample_name_#{n}"
end

Factory.define :user do |f|
  f.first_name "Maciej"
  f.last_name "Litwiniuk"
  f.password "abcdefg1"
  f.password_confirmation "abcdefg1"
  f.email { Factory.next(:email) }
end


Factory.define :project do |f|
  f.name { Factory.next(:name) }
end


Factory.define :task do |f|
  f.title { Factory.next(:name) }
end

Factory.define :task_with_project, :parent=>:task do |f|
  f.association :project, :factory=>:project
end

Factory.define :update do |f|
  f.body "lorem ipsum"
end

Factory.define :document do |f|
  f.title "foobar"
end