class NotifyToSlack
  class << self
    SLEEP_SECONDS = 30

    def execute
      slack_webhook_url = ENV['SLACK_BLUEMOON_BASECAMP']

      notification_message = <<~TEXT
        Hello, CircleCI World!
      TEXT

      payload = {
        "attachments": [
          {
            "fallback": 'fallback!',
            "pretext": 'pretext!',
            "color": '#add8e6',
            "fields": [
              {
                "value": notification_message
              },
            ]
          },
        ]
      }

      notify_to_slack_command = %(/usr/bin/env curl -X POST --data-urlencode 'payload=#{payload.to_json}' #{slack_webhook_url})
      `#{notify_to_slack_command}`
    end
  end
end
