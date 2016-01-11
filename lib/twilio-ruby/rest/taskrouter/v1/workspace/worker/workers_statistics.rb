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
          class WorkerList < ListResource
            class WorkersStatisticsList < ListResource
              ##
              # Initialize the WorkersStatisticsList
              def initialize(version, workspace_sid: nil)
                super(version)
                
                # Path Solution
                @solution = {
                    workspace_sid: workspace_sid
                }
              end
              
              ##
              # Constructs a WorkersStatisticsContext
              def get
                WorkersStatisticsContext.new(
                    @version,
                    workspace_sid: @solution[:workspace_sid],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Taskrouter.V1.WorkersStatisticsList>'
              end
            end
          
            class WorkersStatisticsPage < Page
              def initialize(version, response, workspace_sid: nil)
                super(version, response)
                
                # Path Solution
                @solution = {
                    'workspace_sid' => workspace_sid,
                }
              end
              
              def get_instance(payload)
                return WorkersStatisticsInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution['workspace_sid'],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Taskrouter.V1.WorkersStatisticsPage>'
              end
            end
          
            class WorkersStatisticsContext < InstanceContext
              def initialize(version, workspace_sid)
                super(version)
                
                # Path Solution
                @solution = {
                    workspace_sid: workspace_sid,
                }
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/Statistics"
              end
              
              ##
              # Fetch a WorkersStatisticsInstance
              def fetch(minutes: nil, start_date: nil, end_date: nil, task_queue_sid: nil, task_queue_name: nil, friendly_name: nil)
                params = {
                    'Minutes' => minutes,
                    'StartDate' => Twilio.serialize_iso8601(start_date),
                    'EndDate' => Twilio.serialize_iso8601(end_date),
                    'TaskQueueSid' => task_queue_sid,
                    'TaskQueueName' => task_queue_name,
                    'FriendlyName' => friendly_name,
                }
                
                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )
                
                return WorkersStatisticsInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution['workspace_sid'],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.WorkersStatisticsContext #{context}>"
              end
            end
          
            class WorkersStatisticsInstance < InstanceResource
              def initialize(version, payload, workspace_sid: nil)
                super(version)
                
                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'cumulative' => payload['cumulative'],
                    'realtime' => payload['realtime'],
                    'workspace_sid' => payload['workspace_sid'],
                }
                
                # Context
                @instance_context = nil
                @params = {
                    'workspace_sid' => workspace_sid,
                }
              end
              
              def context
                unless @instance_context
                  @instance_context = WorkersStatisticsContext.new(
                      @version,
                      @params['workspace_sid'],
                  )
                end
                @instance_context
              end
              
              def account_sid
                @properties['account_sid']
              end
              
              def cumulative
                @properties['cumulative']
              end
              
              def realtime
                @properties['realtime']
              end
              
              def workspace_sid
                @properties['workspace_sid']
              end
              
              ##
              # Fetch a WorkersStatisticsInstance
              def fetch(minutes: nil, start_date: nil, end_date: nil, task_queue_sid: nil, task_queue_name: nil, friendly_name: nil)
                @context.fetch(
                    start_date: nil,
                    end_date: nil,
                    task_queue_sid: nil,
                    task_queue_name: nil,
                    friendly_name: nil,
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.WorkersStatisticsInstance #{context}>"
              end
            end
          end
        end
      end
    end
  end
end