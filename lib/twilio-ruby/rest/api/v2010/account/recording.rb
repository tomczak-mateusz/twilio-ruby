##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class RecordingList < ListResource
            ##
            # Initialize the RecordingList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The unique id of the Account responsible for this
            #   recording.
            # @return [RecordingList] RecordingList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  account_sid: account_sid
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/Recordings.json"
            end

            ##
            # Lists RecordingInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Time] date_created Only show recordings on the given date. Should be
            #   formatted as YYYY-MM-DD. You can also specify inequalities
            # @param [String] call_sid Only show recordings made during the call given by the
            #   indicated sid
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(date_created: nil, call_sid: nil, limit: nil, page_size: nil)
              self.stream(
                  date_created: date_created,
                  call_sid: call_sid,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams RecordingInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Time] date_created Only show recordings on the given date. Should be
            #   formatted as YYYY-MM-DD. You can also specify inequalities
            # @param [String] call_sid Only show recordings made during the call given by the
            #   indicated sid
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(date_created: nil, call_sid: nil, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  date_created: date_created,
                  call_sid: call_sid,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields RecordingInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Time] date_created Only show recordings on the given date. Should be
            #   formatted as YYYY-MM-DD. You can also specify inequalities
            # @param [String] call_sid Only show recordings made during the call given by the
            #   indicated sid
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to read the
            #                       limit with the most efficient page size, i.e. min(limit, 1000)
            def each
              limits = @version.read_limits

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of RecordingInstance records from the API.
            # Request is executed immediately.
            # @param [Time] date_created Only show recordings on the given date. Should be
            #   formatted as YYYY-MM-DD. You can also specify inequalities
            # @param [String] call_sid Only show recordings made during the call given by the
            #   indicated sid
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of RecordingInstance
            def page(date_created: nil, call_sid: nil, page_token: nil, page_number: nil, page_size: nil)
              params = {
                  'DateCreated' => Twilio.serialize_iso8601(date_created),
                  'CallSid' => call_sid,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              }
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return RecordingPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of RecordingInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of RecordingInstance
            def get_page(target_url: nil)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              return RecordingPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.RecordingList>'
            end
          end

          class RecordingPage < Page
            ##
            # Initialize the RecordingPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] account_sid The unique id of the Account responsible for this
            #   recording.
            # @return [RecordingPage] RecordingPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of RecordingInstance
            # @param [Hash] payload Payload response from the API
            # @return [RecordingInstance] RecordingInstance
            def get_instance(payload)
              return RecordingInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.RecordingPage>'
            end
          end

          class RecordingContext < InstanceContext
            ##
            # Initialize the RecordingContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @param [String] sid The recording Sid that uniquely identifies this resource
            # @return [RecordingContext] RecordingContext
            def initialize(version, account_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  account_sid: account_sid,
                  sid: sid,
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/Recordings/#{@solution[:sid]}.json"

              # Dependents
              @transcriptions = nil
              @add_on_results = nil
            end

            ##
            # Fetch a RecordingInstance
            # @return [RecordingInstance] Fetched RecordingInstance
            def fetch
              params = {}

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              return RecordingInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the RecordingInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              return @version.delete('delete', @uri)
            end

            ##
            # Access the transcriptions
            # @return [TranscriptionList] TranscriptionList
            def transcriptions(sid=:unset)
              if sid != :unset
                return TranscriptionContext.new(
                    @version,
                    @solution[:account_sid],
                    @solution[:sid],
                    sid,
                )
              end

              unless @transcriptions
                @transcriptions = TranscriptionList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    recording_sid: @solution[:sid],
                )
              end

              @transcriptions
            end

            ##
            # Access the add_on_results
            # @return [AddOnResultList] AddOnResultList
            def add_on_results(sid=:unset)
              if sid != :unset
                return AddOnResultContext.new(
                    @version,
                    @solution[:account_sid],
                    @solution[:sid],
                    sid,
                )
              end

              unless @add_on_results
                @add_on_results = AddOnResultList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    reference_sid: @solution[:sid],
                )
              end

              @add_on_results
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.RecordingContext #{context}>"
            end
          end

          class RecordingInstance < InstanceResource
            ##
            # Initialize the RecordingInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The unique id of the Account responsible for this
            #   recording.
            # @param [String] sid The recording Sid that uniquely identifies this resource
            # @return [RecordingInstance] RecordingInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'api_version' => payload['api_version'],
                  'call_sid' => payload['call_sid'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'duration' => payload['duration'],
                  'sid' => payload['sid'],
                  'price' => payload['price'],
                  'price_unit' => payload['price_unit'],
                  'status' => payload['status'],
                  'channels' => payload['channels'].to_i,
                  'source' => payload['source'],
                  'uri' => payload['uri'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'account_sid' => account_sid,
                  'sid' => sid || @properties['sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [RecordingContext] RecordingContext for this RecordingInstance
            def context
              unless @instance_context
                @instance_context = RecordingContext.new(
                    @version,
                    @params['account_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end

            def account_sid
              @properties['account_sid']
            end

            def api_version
              @properties['api_version']
            end

            def call_sid
              @properties['call_sid']
            end

            def date_created
              @properties['date_created']
            end

            def date_updated
              @properties['date_updated']
            end

            def duration
              @properties['duration']
            end

            def sid
              @properties['sid']
            end

            def price
              @properties['price']
            end

            def price_unit
              @properties['price_unit']
            end

            def status
              @properties['status']
            end

            def channels
              @properties['channels']
            end

            def source
              @properties['source']
            end

            def uri
              @properties['uri']
            end

            ##
            # Fetch a RecordingInstance
            # @return [RecordingInstance] Fetched RecordingInstance
            def fetch
              context.fetch
            end

            ##
            # Deletes the RecordingInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Access the transcriptions
            # @return [transcriptions] transcriptions
            def transcriptions
              context.transcriptions
            end

            ##
            # Access the add_on_results
            # @return [add_on_results] add_on_results
            def add_on_results
              context.add_on_results
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.RecordingInstance #{values}>"
            end
          end
        end
      end
    end
  end
end