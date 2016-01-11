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
          class SipList < ListResource
            class IpAccessControlListList < ListResource
              ##
              # Initialize the IpAccessControlListList
              def initialize(version, account_sid: nil)
                super(version)
                
                # Path Solution
                @solution = {
                    account_sid: account_sid
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/SIP/IpAccessControlLists.json"
              end
              
              ##
              # Reads IpAccessControlListInstance records from the API as a list.
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
              # Retrieve a single page of IpAccessControlListInstance records from the API.
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
                return IpAccessControlListPage.new(
                    @version,
                    response,
                    account_sid: @solution['account_sid'],
                )
              end
              
              ##
              # Create a new IpAccessControlListInstance
              def create(friendly_name: nil)
                data = {
                    'FriendlyName' => friendly_name,
                }
                
                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )
                
                return IpAccessControlListInstance.new(
                    @version,
                    payload,
                    account_sid: @solution['account_sid'],
                )
              end
              
              ##
              # Constructs a IpAccessControlListContext
              def get(sid)
                IpAccessControlListContext.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    sid: sid,
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.IpAccessControlListList>'
              end
            end
          
            class IpAccessControlListPage < Page
              def initialize(version, response, account_sid: nil)
                super(version, response)
                
                # Path Solution
                @solution = {
                    'account_sid' => account_sid,
                }
              end
              
              def get_instance(payload)
                return IpAccessControlListInstance.new(
                    @version,
                    payload,
                    account_sid: @solution['account_sid'],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.IpAccessControlListPage>'
              end
            end
          
            class IpAccessControlListContext < InstanceContext
              def initialize(version, account_sid, sid)
                super(version)
                
                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    sid: sid,
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/SIP/IpAccessControlLists/#{@solution[:sid]}.json"
                
                # Dependents
                @ip_addresses = nil
              end
              
              ##
              # Fetch a IpAccessControlListInstance
              def fetch
                params = {}
                
                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )
                
                return IpAccessControlListInstance.new(
                    @version,
                    payload,
                    account_sid: @solution['account_sid'],
                    sid: @solution['sid'],
                )
              end
              
              ##
              # Update the IpAccessControlListInstance
              def update(friendly_name: nil)
                data = {
                    'FriendlyName' => friendly_name,
                }
                
                payload = @version.update(
                    'POST',
                    @uri,
                    data=data,
                )
                
                return IpAccessControlListInstance.new(
                    @version,
                    payload,
                    account_sid: @solution['account_sid'],
                    sid: @solution['sid'],
                )
              end
              
              ##
              # Deletes the IpAccessControlListInstance
              def delete
                return @version.delete('delete', @uri)
              end
              
              def ip_addresses(sid=:unset)
                if sid != :unset
                  return IpAddressContext.new(
                      @version,
                      @solution[:account_sid],
                      @solution[:ip_access_control_list_sid],
                      sid,
                  )
                end
                
                unless @ip_addresses
                  @ip_addresses = IpAddressList.new(
                      @version,
                      account_sid: @solution[:account_sid],
                      ip_access_control_list_sid: @solution[:sid],
                  )
                end
                
                @ip_addresses
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.IpAccessControlListContext #{context}>"
              end
            end
          
            class IpAccessControlListInstance < InstanceResource
              def initialize(version, payload, account_sid: nil, sid: nil)
                super(version)
                
                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'friendly_name' => payload['friendly_name'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'subresource_uris' => payload['subresource_uris'],
                    'uri' => payload['uri'],
                }
                
                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'sid' => sid || @properties['sid'],
                }
              end
              
              def context
                unless @instance_context
                  @instance_context = IpAccessControlListContext.new(
                      @version,
                      @params['account_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end
              
              def sid
                @properties['sid']
              end
              
              def account_sid
                @properties['account_sid']
              end
              
              def friendly_name
                @properties['friendly_name']
              end
              
              def date_created
                @properties['date_created']
              end
              
              def date_updated
                @properties['date_updated']
              end
              
              def subresource_uris
                @properties['subresource_uris']
              end
              
              def uri
                @properties['uri']
              end
              
              ##
              # Fetch a IpAccessControlListInstance
              def fetch
                @context.fetch()
              end
              
              ##
              # Update the IpAccessControlListInstance
              def update(friendly_name: nil)
                @context.update()
              end
              
              ##
              # Deletes the IpAccessControlListInstance
              def delete
                @context.delete()
              end
              
              def ip_addresses
                @context.ip_addresses
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.IpAccessControlListInstance #{context}>"
              end
            end
          end
        end
      end
    end
  end
end