# encoding: utf-8
# 
# = Sender Field
# 
# The Sender field inherits sender StructuredField and handles the Sender: header
# field in the email.
# 
# Sending sender to a mail message will instantiate a Mail::Field object that
# has a SenderField as it's field type.  This includes all Mail::CommonAddress
# module instance metods.
# 
# Only one Sender field can appear in a header, though it can have multiple
# addresses and groups of addresses.
# 
# == Examples:
# 
#  mail = Mail.new
#  mail.sender = 'Mikel Lindsaar <mikel@test.lindsaar.net>, ada@test.lindsaar.net'
#  mail.sender    #=> '#<Mail::Field:0x180e5e8 @field=#<Mail::SenderField:0x180e1c4
#  mail[:sender]  #=> '#<Mail::Field:0x180e5e8 @field=#<Mail::SenderField:0x180e1c4
#  mail['sender'] #=> '#<Mail::Field:0x180e5e8 @field=#<Mail::SenderField:0x180e1c4
#  mail['Sender'] #=> '#<Mail::Field:0x180e5e8 @field=#<Mail::SenderField:0x180e1c4
# 
#  mail.sender.to_s  #=> 'Mikel Lindsaar <mikel@test.lindsaar.net>, ada@test.lindsaar.net'
#  mail.sender.addresses #=> ['mikel@test.lindsaar.net', 'ada@test.lindsaar.net']
#  mail.sender.formatted #=> ['Mikel Lindsaar <mikel@test.lindsaar.net>', 'ada@test.lindsaar.net']
# 
module Mail
  class SenderField < StructuredField
    
    include Mail::CommonAddress
    
    FIELD_NAME = 'sender'

    def initialize(*args)
      super(FIELD_NAME, strip_field(FIELD_NAME, args.last))
    end

    def addresses
      [address]
    end

    def address
      result = tree.addresses.first
    end
    
  end
end
