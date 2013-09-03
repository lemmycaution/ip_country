require "geoip"
require "csv"
require "ip_country/version"

module IPCountry
  
  class << self
    
    def root
      File.expand_path '../..', __FILE__
    end

    # Load data into memory
    def init db_file
      @@geoip     = GeoIP.new(db_file)
      @@countries = CSV.read("#{root}/data/country_info.csv", {col_sep: "\t", headers: true, header_converters: [:symbol,:downcase]})
      @@countries = @@countries.reduce({}){|arr,c| arr[c[0]] = c; arr}
    end
  
    # Detailed country info
    def info ip_or_code
      raise RuntimeError.new("GeoIP not initialized") unless @@geoip
      if ip_or_code =~ /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/
        info find(ip_or_code).country_code2
      elsif ip_or_code =~ /^[A-Z]{2}$/
        @@countries[ip_or_code].to_hash 
      else
        raise ArgumentError.new("Not valid ip or two letter code: #{ip_or_code}")
      end
    end

    # Ip to Country
    def find ip
      raise RuntimeError.new("GeoIP not initialized") unless @@geoip
      raise ArgumentError.new("IP can not blank") if ip.nil?
      @@geoip.country(ip)
    end
  
  end
  
end
