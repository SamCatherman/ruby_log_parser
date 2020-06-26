class LogParser
  attr_accessor :log, :src, :dst

  def initialize(log)
    @log = log
    @src = ip_address("src")
    @dst = ip_address("dst")
  end

  # @reutrn [Hash]
  #   {
  #  'source_ip': source IP address,
  #  'destination_ip': destination IP address,
  #  'source_ip_valid: True/False,
  #  'destination_ip_valid': True/False,
  #  'source_ip_is_private': True/False, - if IP address is invalid, this defaults to false
  #  'destination_ip_is_private': True/False # - if IP address is invalid, this defaults to false
  # }
  def parse
    {}.tap do |l|
      l[:source_ip] = @src.to_s
      l[:destination_ip] = @dst.to_s  
      l[:source_ip_valid] = valid_ip('src')
      l[:destination_ip_valid] = valid_ip('dst')
      l[:source_ip_is_private] = @src.is_a?(IPAddr) ? @src.private? : false
      l[:destination_ip_is_private] = @dst.is_a?(IPAddr) ? @dst.private? : false
    end
  end

  def ip_address(location)
    begin
      ip = IPAddr.new(log.rpartition("#{location}=").last.split(' ').first)
    rescue IPAddr::InvalidAddressError => error
      @error = {  
        location: location,
        ip: error.message.split(" ").last,
        message: error.message
      }
      error.message.split(" ").last
    end
  end

  def valid_ip(location)
    if @error && @error[:location] == location
      false
    else
      true
    end
  end
end
