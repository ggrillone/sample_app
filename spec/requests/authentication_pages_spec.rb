require 'spec_helper'

describe "Authentication" do
	
	subject { page }

	describe "signin" do
		before { visit signin_path }

		describe "with invalid information" do
			before { click_button 'Sign in' }

			it { should have_selector('title', text: 'Sign in') }
			it { should have_error_message('Invalid') }

			describe "after visiting another age" do
				before { click_link "Home" }
				it { should_not have_error_message('Invalid') }
			end
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before { valid_signin(user) }

			it { should have_selector('title', text: user.name) }
			it { should have_link('Profile', href: user_path(user)) }
			it { should have_link('Sign out', href: signout_path) }
			it { should_not have_link('Sign in', href: signin_path) }

			describe "followed by signout" do
				before { click_link "Sign out" }
				it { should have_link('Sign in') }
				it { should have_link('Sign up now!') }
				it { should_not have_link('Sign out') }
				it { should_not have_link('Account') }

				describe "should sign back in" do
					before do
						click_link "Sign in"
						valid_signin(user)
					end

					it { should have_selector('title', text: user.name) }
					it { should have_link('Profile', href: user_path(user)) }
					it { should have_link('Sign out', href: signout_path) }
					it { should_not have_link('Sign in', href: signin_path) }

				end
			end
		end
	end
end
