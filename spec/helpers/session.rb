module SessionHelpers
	def sign_up
		visit '/'
		click_button('sign up')
		fill_in('name', with: 'Joe')
		fill_in('email', with: 'joe@chin.com')
		fill_in('password', with: '1234')
		click_button('submit')
	end

	def sign_in
		visit('/')
		click_button('sign up')
		fill_in('name', with: 'Joe')
		fill_in('email', with: 'joe@chin.com')
		fill_in('password', with: '1234')
		click_button('submit')
		click_button('sign in')
		fill_in('email', with: 'joe@chin.com')
		fill_in('password', with: '1234')
		click_button('submit')
	end

	def bad_sign_in
		visit('/')
		click_button('sign in')
		fill_in('email', with: 'badjoe@chin.com')
		fill_in('password', with: '123456')
		click_button('submit')
	end

	def sign_out
		visit('/')
		click_button('sign out')
	end

	def post_peep
		fill_in('title', with: 'Hi')
		fill_in('content', with: 'Hello world!')
		click_button 'peep!'
	end
end