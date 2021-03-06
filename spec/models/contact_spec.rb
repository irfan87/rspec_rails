require 'rails_helper'

RSpec.describe Contact, type: :model do
	it "is valid with a firstname, lastname and email" do
		contact = Contact.new(firstname: "Ahmad Irfan", lastname: "Mohammad Shukri", email: "irfanshukri203@gmail.com")
		expect(contact).to be_valid
	end

	it "is invalid without a firstname" do
		contact = Contact.new(firstname: nil)
		contact.valid?
		expect(contact.errors[:firstname]).to include("can't be blank")
	end

	it "is invalid without a lastname" do
		contact = Contact.new(lastname: nil)
		contact.valid?
		expect(contact.errors[:lastname]).to include("can't be blank")
	end

	it "is invalid without an email address" do
		contact = Contact.new(email: nil)
		contact.valid?
		expect(contact.errors[:email]).to include("can't be blank")
	end

	it "is invalid with a duplicate email address" do
		Contact.create(firstname: 'Ahmad Irfan', lastname: 'Mohammad Shukri', email: 'irfanshukri203@gmail.com')
		contact = Contact.create(firstname: 'Ahmad Irfan', lastname: 'Mohammad Shukri', email: 'irfanshukri203@gmail.com')
		contact.valid?
		expect(contact.errors[:email]).to include("has already been taken")
	end

	it "returns a contact's full name as string"
end
