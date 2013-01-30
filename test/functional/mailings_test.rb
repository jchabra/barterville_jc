require 'test_helper'

class MailingsTest < ActionMailer::TestCase
  test "welcome" do
    mail = Mailings.welcome
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "trade_proposed" do
    mail = Mailings.trade_proposed
    assert_equal "Trade proposed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "trade_accepted" do
    mail = Mailings.trade_accepted
    assert_equal "Trade accepted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
