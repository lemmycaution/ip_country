# Ipcountry

A gem converts IP address to useful country information which includes 
ISO, ISO3, ISO-Numeric, fips, Country, Capital, Area(in sq km), Population, Continent, tld, CurrencyCode, CurrencyName, Phone, Postal Code Format, Postal Code Regex, Languages, geonameid, neighbours, EquivalentFipsCode

## Installation

Add this line to your application's Gemfile:

    gem 'ipcountry'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ipcountry

## Usage
First you need to obtain geo_ip.dat file from Maxmind
```
IPCountry.init("path/to/geo_ip.dat") # loads geoip.dat and country data

country = IPCountry.find "2.103.255.255" # GB
=> #<struct GeoIP::Country request="2.103.255.255", ip="2.103.255.255", country_code=77, country_code2="GB", country_code3="GBR", country_name="United Kingdom", continent_code="EU">
  
IPCountry.info c.country_code2
=> {:iso=>"GB", :iso3=>"GBR", :isonumeric=>"826", :fips=>"UK", :country=>"United Kingdom", :capital=>"London", :areain_sq_km=>"244820", :population=>"62348447", :continent=>"EU", :tld=>".uk", :currencycode=>"GBP", :currencyname=>"Pound", :phone=>"44", :postal_code_format=>"@# \#@@|@## \#@@|@@# \#@@|@@## \#@@|@\#@ \#@@|@@\#@ \#@@|GIR0AA", :postal_code_regex=>"^(([A-Z]\\d{2}[A-Z]{2})|([A-Z]\\d{3}[A-Z]{2})|([A-Z]{2}\\d{2}[A-Z]{2})|([A-Z]{2}\\d{3}[A-Z]{2})|([A-Z]\\d[A-Z]\\d[A-Z]{2})|([A-Z]{2}\\d[A-Z]\\d[A-Z]{2})|(GIR0AA))$", :languages=>"en-GB,cy-GB,gd", :geonameid=>"2635167", :neighbours=>"IE", :equivalentfipscode=>nil}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
