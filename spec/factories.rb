FactoryGirl.define do
	factory :user do
		name					"Greg Grillone"
		email					"greg@gmail.com"
		password 				"foobar"
		password_confirmation	"foobar"
	end
end