require 'test_helper'

class GradeMailerTest < ActionMailer::TestCase
  test "mailer can be send to student" do
    @student = users(:alice_smith)
    email = GradeMailer.create_report(@student).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ENV["GMAIL_USER"], email.from
    assert_equal "alice@email.com", email.to
    assert_equal "Your Grade Report", email.subject
    assert_equal true, email.text?
    assert_equal true, email.body.to_s.include?("Grades are listed below:")
  end
end
