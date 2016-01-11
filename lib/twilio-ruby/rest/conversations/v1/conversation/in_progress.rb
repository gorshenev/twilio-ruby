##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Conversations < Domain
      class V1 < Version
        class ConversationList < ListResource
          class InProgressList < ListResource
            ##
            # Initialize the InProgressList
            def initialize(version)
              super(version)
              
              # Path Solution
              @solution = {}
              @uri = "/Conversations/InProgress"
            end
            
            ##
            # Reads InProgressInstance records from the API as a list.
            def list(limit: nil, page_size: nil)
              self.stream(
                  limit: limit,
                  page_size: page_size
              ).entries
            end
            
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)
              
              page = self.page(
                  page_size: limits['page_size'],
              )
              
              @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
            end
            
            def each
              limits = @version.read_limits
              
              page = self.page(
                  page_size: limits['page_size'],
              )
              
              @version.stream(page,
                              limit: limits['limit'],
                              page_limit: limits['page_limit']).each {|x| yield x}
            end
            
            ##
            # Retrieve a single page of InProgressInstance records from the API.
            def page(page_token: nil, page_number: nil, page_size: nil)
              params = {
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              }
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return InProgressPage.new(
                  @version,
                  response,
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Conversations.V1.InProgressList>'
            end
          end
        
          class InProgressPage < Page
            def initialize(version, response)
              super(version, response)
              
              # Path Solution
              @solution = {}
            end
            
            def get_instance(payload)
              return InProgressInstance.new(
                  @version,
                  payload,
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Conversations.V1.InProgressPage>'
            end
          end
        
          class InProgressInstance < InstanceResource
            def initialize(version, payload)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'status' => payload['status'],
                  'duration' => payload['duration'].to_i,
                  'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                  'start_time' => Twilio.deserialize_iso8601(payload['start_time']),
                  'end_time' => Twilio.deserialize_iso8601(payload['end_time']),
                  'account_sid' => payload['account_sid'],
                  'url' => payload['url'],
              }
            end
            
            def sid
              @properties['sid']
            end
            
            def status
              @properties['status']
            end
            
            def duration
              @properties['duration']
            end
            
            def date_created
              @properties['date_created']
            end
            
            def start_time
              @properties['start_time']
            end
            
            def end_time
              @properties['end_time']
            end
            
            def account_sid
              @properties['account_sid']
            end
            
            def url
              @properties['url']
            end
            
            def participants
              @context.participants
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Conversations.V1.InProgressInstance>"
            end
          end
        end
      end
    end
  end
end