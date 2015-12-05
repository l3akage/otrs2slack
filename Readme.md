# OTRS2Slack

Post OTRS tickets to [Slack](https://slack.com/)

# Setup

set necessary variables
``` ruby
WEBHOOK_URL => Slack webhook url from https://my.slack.com/services/new/incoming-webhook
OTRS_HOST => your OTRS url
HOST, USER, PASSWORD and DATABSE of the database used by OTRS
```

# Integrate

Login into OTRS and go to Admin => GenericAgent and create a new one.
Set up the events that should trigger the script and add this script to CMD.
``` ruby
/opt/otrs2slack.rb
```
