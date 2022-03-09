##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Service' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://chat.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "consumption_report_interval": 100,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "default_channel_creator_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "default_channel_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "default_service_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "limits": {
              "channel_members": 100,
              "user_channels": 250
          },
          "links": {
              "channels": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels",
              "users": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users",
              "roles": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles"
          },
          "notifications": {},
          "post_webhook_url": "post_webhook_url",
          "pre_webhook_url": "pre_webhook_url",
          "reachability_enabled": false,
          "read_status_enabled": false,
          "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "typing_indicator_timeout": 100,
          "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "webhook_filters": [
              "webhook_filters"
          ],
          "webhook_method": "webhook_method",
          "webhooks": {}
      }
      ]
    ))

    actual = @client.chat.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://chat.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.chat.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v1.services.create(friendly_name: 'friendly_name')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'FriendlyName' => 'friendly_name', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://chat.twilio.com/v1/Services',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "consumption_report_interval": 100,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "default_channel_creator_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "default_channel_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "default_service_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "limits": {
              "channel_members": 100,
              "user_channels": 250
          },
          "links": {
              "channels": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels",
              "users": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users",
              "roles": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles"
          },
          "notifications": {},
          "post_webhook_url": "post_webhook_url",
          "pre_webhook_url": "pre_webhook_url",
          "reachability_enabled": false,
          "read_status_enabled": false,
          "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "typing_indicator_timeout": 100,
          "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "webhook_filters": [
              "webhook_filters"
          ],
          "webhook_method": "webhook_method",
          "webhooks": {}
      }
      ]
    ))

    actual = @client.chat.v1.services.create(friendly_name: 'friendly_name')

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v1.services.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://chat.twilio.com/v1/Services',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://chat.twilio.com/v1/Services?PageSize=50&Page=0",
              "key": "services",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v1/Services?PageSize=50&Page=0"
          },
          "services": []
      }
      ]
    ))

    actual = @client.chat.v1.services.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://chat.twilio.com/v1/Services?PageSize=50&Page=0",
              "key": "services",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v1/Services?PageSize=50&Page=0"
          },
          "services": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "consumption_report_interval": 100,
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "default_channel_creator_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "default_channel_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "default_service_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "friendly_name",
                  "limits": {
                      "user_channels": 250,
                      "channel_members": 100,
                      "actions_per_second": 30
                  },
                  "links": {
                      "channels": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels",
                      "users": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users",
                      "roles": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles"
                  },
                  "notifications": {
                      "added_to_channel": {
                          "enabled": false,
                          "template": "notifications.added_to_channel.template"
                      },
                      "invited_to_channel": {
                          "enabled": false,
                          "template": "notifications.invited_to_channel.template"
                      },
                      "log_enabled": true,
                      "new_message": {
                          "enabled": false,
                          "template": "notifications.new_message.template"
                      },
                      "removed_from_channel": {
                          "enabled": false,
                          "template": "notifications.removed_from_channel.template"
                      }
                  },
                  "post_webhook_url": "post_webhook_url",
                  "pre_webhook_url": "pre_webhook_url",
                  "reachability_enabled": false,
                  "read_status_enabled": false,
                  "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "typing_indicator_timeout": 100,
                  "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "webhook_filters": [
                      "webhook_filters"
                  ],
                  "webhook_method": "webhook_method",
                  "webhooks": {
                      "on_channel_add": {
                          "format": "webhooks.on_channel_add.format",
                          "method": "webhooks.on_channel_add.method",
                          "url": "webhooks.on_channel_add.url"
                      },
                      "on_channel_added": {
                          "format": "webhooks.on_channel_added.format",
                          "method": "webhooks.on_channel_added.method",
                          "url": "webhooks.on_channel_added.url"
                      },
                      "on_channel_destroy": {
                          "format": "webhooks.on_channel_destroy.format",
                          "method": "webhooks.on_channel_destroy.method",
                          "url": "webhooks.on_channel_destroy.url"
                      },
                      "on_channel_destroyed": {
                          "format": "webhooks.on_channel_destroyed.format",
                          "method": "webhooks.on_channel_destroyed.method",
                          "url": "webhooks.on_channel_destroyed.url"
                      },
                      "on_channel_update": {
                          "format": "webhooks.on_channel_update.format",
                          "method": "webhooks.on_channel_update.method",
                          "url": "webhooks.on_channel_update.url"
                      },
                      "on_channel_updated": {
                          "format": "webhooks.on_channel_updated.format",
                          "method": "webhooks.on_channel_updated.method",
                          "url": "webhooks.on_channel_updated.url"
                      },
                      "on_member_add": {
                          "format": "webhooks.on_member_add.format",
                          "method": "webhooks.on_member_add.method",
                          "url": "webhooks.on_member_add.url"
                      },
                      "on_member_added": {
                          "format": "webhooks.on_member_added.format",
                          "method": "webhooks.on_member_added.method",
                          "url": "webhooks.on_member_added.url"
                      },
                      "on_member_remove": {
                          "format": "webhooks.on_member_remove.format",
                          "method": "webhooks.on_member_remove.method",
                          "url": "webhooks.on_member_remove.url"
                      },
                      "on_member_removed": {
                          "format": "webhooks.on_member_removed.format",
                          "method": "webhooks.on_member_removed.method",
                          "url": "webhooks.on_member_removed.url"
                      },
                      "on_message_remove": {
                          "format": "webhooks.on_message_remove.format",
                          "method": "webhooks.on_message_remove.method",
                          "url": "webhooks.on_message_remove.url"
                      },
                      "on_message_removed": {
                          "format": "webhooks.on_message_removed.format",
                          "method": "webhooks.on_message_removed.method",
                          "url": "webhooks.on_message_removed.url"
                      },
                      "on_message_send": {
                          "format": "webhooks.on_message_send.format",
                          "method": "webhooks.on_message_send.method",
                          "url": "webhooks.on_message_send.url"
                      },
                      "on_message_sent": {
                          "format": "webhooks.on_message_sent.format",
                          "method": "webhooks.on_message_sent.method",
                          "url": "webhooks.on_message_sent.url"
                      },
                      "on_message_update": {
                          "format": "webhooks.on_message_update.format",
                          "method": "webhooks.on_message_update.method",
                          "url": "webhooks.on_message_update.url"
                      },
                      "on_message_updated": {
                          "format": "webhooks.on_message_updated.format",
                          "method": "webhooks.on_message_updated.method",
                          "url": "webhooks.on_message_updated.url"
                      }
                  }
              }
          ]
      }
      ]
    ))

    actual = @client.chat.v1.services.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://chat.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "consumption_report_interval": 100,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "default_channel_creator_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "default_channel_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "default_service_role_sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "friendly_name",
          "limits": {
              "channel_members": 500,
              "user_channels": 600
          },
          "links": {
              "channels": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels",
              "users": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users",
              "roles": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles"
          },
          "notifications": {
              "added_to_channel": {
                  "enabled": false,
                  "template": "notifications.added_to_channel.template"
              },
              "invited_to_channel": {
                  "enabled": false,
                  "template": "notifications.invited_to_channel.template"
              },
              "new_message": {
                  "enabled": false,
                  "template": "notifications.new_message.template"
              },
              "removed_from_channel": {
                  "enabled": false,
                  "template": "notifications.removed_from_channel.template"
              }
          },
          "post_webhook_url": "post_webhook_url",
          "pre_webhook_url": "pre_webhook_url",
          "reachability_enabled": false,
          "read_status_enabled": false,
          "sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "typing_indicator_timeout": 100,
          "url": "https://chat.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "webhook_filters": [
              "webhook_filters"
          ],
          "webhook_method": "webhook_method",
          "webhooks": {
              "on_channel_add": {
                  "format": "webhooks.on_channel_add.format",
                  "method": "webhooks.on_channel_add.method",
                  "url": "webhooks.on_channel_add.url"
              },
              "on_channel_added": {
                  "format": "webhooks.on_channel_added.format",
                  "method": "webhooks.on_channel_added.method",
                  "url": "webhooks.on_channel_added.url"
              },
              "on_channel_destroy": {
                  "format": "webhooks.on_channel_destroy.format",
                  "method": "webhooks.on_channel_destroy.method",
                  "url": "webhooks.on_channel_destroy.url"
              },
              "on_channel_destroyed": {
                  "format": "webhooks.on_channel_destroyed.format",
                  "method": "webhooks.on_channel_destroyed.method",
                  "url": "webhooks.on_channel_destroyed.url"
              },
              "on_channel_update": {
                  "format": "webhooks.on_channel_update.format",
                  "method": "webhooks.on_channel_update.method",
                  "url": "webhooks.on_channel_update.url"
              },
              "on_channel_updated": {
                  "format": "webhooks.on_channel_updated.format",
                  "method": "webhooks.on_channel_updated.method",
                  "url": "webhooks.on_channel_updated.url"
              },
              "on_member_add": {
                  "format": "webhooks.on_member_add.format",
                  "method": "webhooks.on_member_add.method",
                  "url": "webhooks.on_member_add.url"
              },
              "on_member_added": {
                  "format": "webhooks.on_member_added.format",
                  "method": "webhooks.on_member_added.method",
                  "url": "webhooks.on_member_added.url"
              },
              "on_member_remove": {
                  "format": "webhooks.on_member_remove.format",
                  "method": "webhooks.on_member_remove.method",
                  "url": "webhooks.on_member_remove.url"
              },
              "on_member_removed": {
                  "format": "webhooks.on_member_removed.format",
                  "method": "webhooks.on_member_removed.method",
                  "url": "webhooks.on_member_removed.url"
              },
              "on_message_remove": {
                  "format": "webhooks.on_message_remove.format",
                  "method": "webhooks.on_message_remove.method",
                  "url": "webhooks.on_message_remove.url"
              },
              "on_message_removed": {
                  "format": "webhooks.on_message_removed.format",
                  "method": "webhooks.on_message_removed.method",
                  "url": "webhooks.on_message_removed.url"
              },
              "on_message_send": {
                  "format": "webhooks.on_message_send.format",
                  "method": "webhooks.on_message_send.method",
                  "url": "webhooks.on_message_send.url"
              },
              "on_message_sent": {
                  "format": "webhooks.on_message_sent.format",
                  "method": "webhooks.on_message_sent.method",
                  "url": "webhooks.on_message_sent.url"
              },
              "on_message_update": {
                  "format": "webhooks.on_message_update.format",
                  "method": "webhooks.on_message_update.method",
                  "url": "webhooks.on_message_update.url"
              },
              "on_message_updated": {
                  "format": "webhooks.on_message_updated.format",
                  "method": "webhooks.on_message_updated.method",
                  "url": "webhooks.on_message_updated.url"
              }
          }
      }
      ]
    ))

    actual = @client.chat.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end
end