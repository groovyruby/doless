Factory.sequence :email do |n|
  "person#{n}@example.com"
end
    
Factory.define :user do |f|
  f.first_name "Maciej"
  f.last_name "Litwiniuk"
  f.password "abcdefg1"
  f.password_confirmation "abcdefg1"
  f.email { Factory.next(:email) }
end
