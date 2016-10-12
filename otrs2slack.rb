#! /usr/bin/env ruby

require 'slack-notifier'
require 'mysql2'

WEBHOOK_URL = 'WEBHOOK URL'
OTRS_HOST   = 'http://example.com'

exit if ARGV.size != 2

client = Mysql2::Client.new(host: 'SQL HOST',
                            username: 'SQL USER',
                            password: 'SQL PASSWORD',
                            database: 'SQL DATABASE')

row = client.query("SELECT id, tn, title, customer_id FROM ticket WHERE tn = '#{ARGV[0]}'").first

notifier = Slack::Notifier.new(WEBHOOK_URL)
notifier.channel  = '#otrs'
notifier.username = 'otrs'

msg = "<#{OTRS_HOST}/index.pl?Action=AgentTicketZoom;TicketID=#{row['id']}|#{row['tn']}>"
msg = "#{msg} New Ticket from #{row['customer_id']}: #{row['title']}"

msg = Slack::Notifier::LinkFormatter.format(msg)

notifier.ping(msg, icon_emoji: ':email:')
client.close
