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
          class AvailablePhoneNumberCountryList < ListResource
            ##
            # Initialize the AvailablePhoneNumberCountryList
            def initialize(version, account_sid: nil)
              super(version)
              
              # Path Solution
              @solution = {
                  account_sid: account_sid
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/AvailablePhoneNumbers.json"
            end
            
            ##
            # Reads AvailablePhoneNumberCountryInstance records from the API as a list.
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
            # Retrieve a single page of AvailablePhoneNumberCountryInstance records from the API.
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
              return AvailablePhoneNumberCountryPage.new(
                  @version,
                  response,
                  account_sid: @solution['account_sid'],
              )
            end
            
            ##
            # Constructs a AvailablePhoneNumberCountryContext
            def get(country_code)
              AvailablePhoneNumberCountryContext.new(
                  @version,
                  account_sid: @solution[:account_sid],
                  country_code: country_code,
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.AvailablePhoneNumberCountryList>'
            end
          end
        
          class AvailablePhoneNumberCountryPage < Page
            def initialize(version, response, account_sid: nil)
              super(version, response)
              
              # Path Solution
              @solution = {
                  'account_sid' => account_sid,
              }
            end
            
            def get_instance(payload)
              return AvailablePhoneNumberCountryInstance.new(
                  @version,
                  payload,
                  account_sid: @solution['account_sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.AvailablePhoneNumberCountryPage>'
            end
          end
        
          class AvailablePhoneNumberCountryContext < InstanceContext
            def initialize(version, account_sid, country_code)
              super(version)
              
              # Path Solution
              @solution = {
                  account_sid: account_sid,
                  country_code: country_code,
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/AvailablePhoneNumbers/#{@solution[:country_code]}.json"
              
              # Dependents
              @local = nil
              @toll_free = nil
              @mobile = nil
            end
            
            ##
            # Fetch a AvailablePhoneNumberCountryInstance
            def fetch
              params = {}
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return AvailablePhoneNumberCountryInstance.new(
                  @version,
                  payload,
                  account_sid: @solution['account_sid'],
                  country_code: @solution['country_code'],
              )
            end
            
            def local
              unless @local
                @local = LocalList.new(
                    @version,
                    country_code: @solution[:country_code],
                    account_sid: @solution[:account_sid],
                )
              end
              
              @local
            end
            
            def toll_free
              unless @toll_free
                @toll_free = TollFreeList.new(
                    @version,
                    country_code: @solution[:country_code],
                    account_sid: @solution[:account_sid],
                )
              end
              
              @toll_free
            end
            
            def mobile
              unless @mobile
                @mobile = MobileList.new(
                    @version,
                    country_code: @solution[:country_code],
                    account_sid: @solution[:account_sid],
                )
              end
              
              @mobile
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.AvailablePhoneNumberCountryContext #{context}>"
            end
          end
        
          class AvailablePhoneNumberCountryInstance < InstanceResource
            def initialize(version, payload, account_sid: nil, country_code: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'country_code' => payload['country_code'],
                  'country' => payload['country'],
                  'uri' => payload['uri'],
                  'beta' => payload['beta'],
                  'subresource_uris' => payload['subresource_uris'],
              }
              
              # Context
              @instance_context = nil
              @params = {
                  'account_sid' => account_sid,
                  'country_code' => country_code || @properties['country_code'],
              }
            end
            
            def context
              unless @instance_context
                @instance_context = AvailablePhoneNumberCountryContext.new(
                    @version,
                    @params['account_sid'],
                    @params['country_code'],
                )
              end
              @instance_context
            end
            
            def country_code
              @properties['country_code']
            end
            
            def country
              @properties['country']
            end
            
            def uri
              @properties['uri']
            end
            
            def beta
              @properties['beta']
            end
            
            def subresource_uris
              @properties['subresource_uris']
            end
            
            ##
            # Fetch a AvailablePhoneNumberCountryInstance
            def fetch
              @context.fetch()
            end
            
            def local
              @context.local
            end
            
            def toll_free
              @context.toll_free
            end
            
            def mobile
              @context.mobile
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.AvailablePhoneNumberCountryInstance #{context}>"
            end
          end
        end
      end
    end
  end
end