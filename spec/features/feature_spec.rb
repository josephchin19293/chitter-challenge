feature 'sign up' do
	scenario 'user can sign up to chitter' do
		expect{sign_up}.to change(User, :count).by(1)
		expect(current_path).to eq('/peeps')
	end
end

feature 'signing in' do
	scenario 'users can sign in if they have signed up' do
		sign_in
		expect(page).to have_content("Hi, Joe!")
	end

	scenario 'sign in fails if username/pwd is incorrect' do
		bad_sign_in
		expect(page).not_to have_content("Hi, Joe!")
		expect(current_path).to eq('/users/signin')
	end
end

feature 'signing out' do
	scenario 'a signed in user can' do
		sign_in
		sign_out
		expect(page).not_to have_content("Hi, Joe!")
	end

	scenario 'if you are not signed in you cant' do
		expect(page).to_not have_selector('sign_out')
	end
end

feature 'posting peeps' do
	scenario 'only signed in users can post' do
	end

	scenario 'all peeps are visible to all users' do
	end

	scenario 'peeps contain which user they were written by' do
	end
end







