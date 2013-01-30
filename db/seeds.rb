User.delete_all
Product.delete_all

'zip = [11111, 11112, 11113, 11114, 11115]'

('A'..'Z').each do |letter|
	u = User.create(:username => letter, :first_name => "first#{letter}", :last_name => "last#{letter}", :password => '123', :password_confirmation => '123', :zip => zip.sample, :bio => 2.sentences)
end

condition = ['new', 'used', 'poor']

('A'..'Z').each do |letter|
	p = Product.create(:name => letter, :description => 2.sentences, :condition => condition.sample, :user_id => User.all.sample.id)
end