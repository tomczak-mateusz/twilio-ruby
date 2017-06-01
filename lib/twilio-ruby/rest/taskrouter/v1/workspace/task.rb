##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class TaskList < ListResource
            ##
            # Initialize the TaskList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @return [TaskList] TaskList
            def initialize(version, workspace_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  workspace_sid: workspace_sid
              }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Tasks"
            end

            ##
            # Lists TaskInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] priority The priority
            # @param [String] assignment_status The assignment_status
            # @param [String] workflow_sid The workflow_sid
            # @param [String] workflow_name The workflow_name
            # @param [String] task_queue_sid The task_queue_sid
            # @param [String] task_queue_name The task_queue_name
            # @param [String] evaluate_task_attributes The evaluate_task_attributes
            # @param [String] ordering The ordering
            # @param [Boolean] has_addons The has_addons
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(priority: nil, assignment_status: nil, workflow_sid: nil, workflow_name: nil, task_queue_sid: nil, task_queue_name: nil, evaluate_task_attributes: nil, ordering: nil, has_addons: nil, limit: nil, page_size: nil)
              self.stream(
                  priority: priority,
                  assignment_status: assignment_status,
                  workflow_sid: workflow_sid,
                  workflow_name: workflow_name,
                  task_queue_sid: task_queue_sid,
                  task_queue_name: task_queue_name,
                  evaluate_task_attributes: evaluate_task_attributes,
                  ordering: ordering,
                  has_addons: has_addons,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams TaskInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] priority The priority
            # @param [String] assignment_status The assignment_status
            # @param [String] workflow_sid The workflow_sid
            # @param [String] workflow_name The workflow_name
            # @param [String] task_queue_sid The task_queue_sid
            # @param [String] task_queue_name The task_queue_name
            # @param [String] evaluate_task_attributes The evaluate_task_attributes
            # @param [String] ordering The ordering
            # @param [Boolean] has_addons The has_addons
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(priority: nil, assignment_status: nil, workflow_sid: nil, workflow_name: nil, task_queue_sid: nil, task_queue_name: nil, evaluate_task_attributes: nil, ordering: nil, has_addons: nil, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  priority: priority,
                  assignment_status: assignment_status,
                  workflow_sid: workflow_sid,
                  workflow_name: workflow_name,
                  task_queue_sid: task_queue_sid,
                  task_queue_name: task_queue_name,
                  evaluate_task_attributes: evaluate_task_attributes,
                  ordering: ordering,
                  has_addons: has_addons,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields TaskInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] priority The priority
            # @param [String] assignment_status The assignment_status
            # @param [String] workflow_sid The workflow_sid
            # @param [String] workflow_name The workflow_name
            # @param [String] task_queue_sid The task_queue_sid
            # @param [String] task_queue_name The task_queue_name
            # @param [String] evaluate_task_attributes The evaluate_task_attributes
            # @param [String] ordering The ordering
            # @param [Boolean] has_addons The has_addons
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
            # Retrieve a single page of TaskInstance records from the API.
            # Request is executed immediately.
            # @param [String] priority The priority
            # @param [String] assignment_status The assignment_status
            # @param [String] workflow_sid The workflow_sid
            # @param [String] workflow_name The workflow_name
            # @param [String] task_queue_sid The task_queue_sid
            # @param [String] task_queue_name The task_queue_name
            # @param [String] evaluate_task_attributes The evaluate_task_attributes
            # @param [String] ordering The ordering
            # @param [Boolean] has_addons The has_addons
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of TaskInstance
            def page(priority: nil, assignment_status: nil, workflow_sid: nil, workflow_name: nil, task_queue_sid: nil, task_queue_name: nil, evaluate_task_attributes: nil, ordering: nil, has_addons: nil, page_token: nil, page_number: nil, page_size: nil)
              params = {
                  'Priority' => priority,
                  'AssignmentStatus' => assignment_status,
                  'WorkflowSid' => workflow_sid,
                  'WorkflowName' => workflow_name,
                  'TaskQueueSid' => task_queue_sid,
                  'TaskQueueName' => task_queue_name,
                  'EvaluateTaskAttributes' => evaluate_task_attributes,
                  'Ordering' => ordering,
                  'HasAddons' => has_addons,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              }
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return TaskPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of TaskInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of TaskInstance
            def get_page(target_url: nil)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              return TaskPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of TaskInstance records from the API.
            # Request is executed immediately.
            # @param [String] timeout The timeout
            # @param [String] priority The priority
            # @param [String] task_channel The task_channel
            # @param [String] workflow_sid The workflow_sid
            # @param [String] attributes The attributes
            # @return [TaskInstance] Newly created TaskInstance
            def create(timeout: nil, priority: nil, task_channel: nil, workflow_sid: nil, attributes: nil)
              data = {
                  'Timeout' => timeout,
                  'Priority' => priority,
                  'TaskChannel' => task_channel,
                  'WorkflowSid' => workflow_sid,
                  'Attributes' => attributes,
              }

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              return TaskInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution[:workspace_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.TaskList>'
            end
          end

          class TaskPage < Page
            ##
            # Initialize the TaskPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] workspace_sid The workspace_sid
            # @return [TaskPage] TaskPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of TaskInstance
            # @param [Hash] payload Payload response from the API
            # @return [TaskInstance] TaskInstance
            def get_instance(payload)
              return TaskInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution[:workspace_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.TaskPage>'
            end
          end

          class TaskContext < InstanceContext
            ##
            # Initialize the TaskContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            # @return [TaskContext] TaskContext
            def initialize(version, workspace_sid, sid)
              super(version)

              # Path Solution
              @solution = {
                  workspace_sid: workspace_sid,
                  sid: sid,
              }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Tasks/#{@solution[:sid]}"

              # Dependents
              @reservations = nil
            end

            ##
            # Fetch a TaskInstance
            # @return [TaskInstance] Fetched TaskInstance
            def fetch
              params = {}

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              return TaskInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution[:workspace_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Update the TaskInstance
            # @param [String] attributes The attributes
            # @param [task.Status] assignment_status The assignment_status
            # @param [String] reason The reason
            # @param [String] priority The priority
            # @param [String] task_channel The task_channel
            # @return [TaskInstance] Updated TaskInstance
            def update(attributes: nil, assignment_status: nil, reason: nil, priority: nil, task_channel: nil)
              data = {
                  'Attributes' => attributes,
                  'AssignmentStatus' => assignment_status,
                  'Reason' => reason,
                  'Priority' => priority,
                  'TaskChannel' => task_channel,
              }

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              return TaskInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution[:workspace_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the TaskInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              return @version.delete('delete', @uri)
            end

            ##
            # Access the reservations
            # @return [ReservationList] ReservationList
            def reservations(sid=:unset)
              if sid != :unset
                return ReservationContext.new(
                    @version,
                    @solution[:workspace_sid],
                    @solution[:sid],
                    sid,
                )
              end

              unless @reservations
                @reservations = ReservationList.new(
                    @version,
                    workspace_sid: @solution[:workspace_sid],
                    task_sid: @solution[:sid],
                )
              end

              @reservations
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.TaskContext #{context}>"
            end
          end

          class TaskInstance < InstanceResource
            ##
            # Initialize the TaskInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            # @return [TaskInstance] TaskInstance
            def initialize(version, payload, workspace_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'age' => payload['age'].to_i,
                  'assignment_status' => payload['assignment_status'],
                  'attributes' => payload['attributes'],
                  'addons' => payload['addons'],
                  'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                  'priority' => payload['priority'].to_i,
                  'reason' => payload['reason'],
                  'sid' => payload['sid'],
                  'task_queue_sid' => payload['task_queue_sid'],
                  'task_queue_friendly_name' => payload['task_queue_friendly_name'],
                  'task_channel_sid' => payload['task_channel_sid'],
                  'task_channel_unique_name' => payload['task_channel_unique_name'],
                  'timeout' => payload['timeout'].to_i,
                  'workflow_sid' => payload['workflow_sid'],
                  'workflow_friendly_name' => payload['workflow_friendly_name'],
                  'workspace_sid' => payload['workspace_sid'],
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'workspace_sid' => workspace_sid,
                  'sid' => sid || @properties['sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [TaskContext] TaskContext for this TaskInstance
            def context
              unless @instance_context
                @instance_context = TaskContext.new(
                    @version,
                    @params['workspace_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end

            def account_sid
              @properties['account_sid']
            end

            def age
              @properties['age']
            end

            def assignment_status
              @properties['assignment_status']
            end

            def attributes
              @properties['attributes']
            end

            def addons
              @properties['addons']
            end

            def date_created
              @properties['date_created']
            end

            def date_updated
              @properties['date_updated']
            end

            def priority
              @properties['priority']
            end

            def reason
              @properties['reason']
            end

            def sid
              @properties['sid']
            end

            def task_queue_sid
              @properties['task_queue_sid']
            end

            def task_queue_friendly_name
              @properties['task_queue_friendly_name']
            end

            def task_channel_sid
              @properties['task_channel_sid']
            end

            def task_channel_unique_name
              @properties['task_channel_unique_name']
            end

            def timeout
              @properties['timeout']
            end

            def workflow_sid
              @properties['workflow_sid']
            end

            def workflow_friendly_name
              @properties['workflow_friendly_name']
            end

            def workspace_sid
              @properties['workspace_sid']
            end

            def url
              @properties['url']
            end

            def links
              @properties['links']
            end

            ##
            # Fetch a TaskInstance
            # @return [TaskInstance] Fetched TaskInstance
            def fetch
              context.fetch
            end

            ##
            # Update the TaskInstance
            # @param [String] attributes The attributes
            # @param [reservation.Status] assignment_status The assignment_status
            # @param [String] reason The reason
            # @param [String] priority The priority
            # @param [String] task_channel The task_channel
            # @return [TaskInstance] Updated TaskInstance
            def update(attributes: nil, assignment_status: nil, reason: nil, priority: nil, task_channel: nil)
              context.update(
                  attributes: attributes,
                  assignment_status: assignment_status,
                  reason: reason,
                  priority: priority,
                  task_channel: task_channel,
              )
            end

            ##
            # Deletes the TaskInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Access the reservations
            # @return [reservations] reservations
            def reservations
              context.reservations
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.TaskInstance #{values}>"
            end
          end
        end
      end
    end
  end
end