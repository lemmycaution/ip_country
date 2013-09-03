class TestIpCountry < Minitest::Test
  def setup
    IPCountry.init      "data/geo_ip.dat"
    @ip_from_uk         = "2.103.255.255"
    @details            = {:iso=>"GB", :iso3=>"GBR", :isonumeric=>"826", 
      :fips=>"UK", :country=>"United Kingdom", :capital=>"London", 
      :areain_sq_km=>"244820", :population=>"62348447", :continent=>"EU", 
      :tld=>".uk", :currencycode=>"GBP", :currencyname=>"Pound", 
      :phone=>"44", :postal_code_format=>"@# \#@@|@## \#@@|@@# \#@@|@@## \#@@|@\#@ \#@@|@@\#@ \#@@|GIR0AA", 
      :postal_code_regex=>"^(([A-Z]\\d{2}[A-Z]{2})|([A-Z]\\d{3}[A-Z]{2})|([A-Z]{2}\\d{2}[A-Z]{2})|([A-Z]{2}\\d{3}[A-Z]{2})|([A-Z]\\d[A-Z]\\d[A-Z]{2})|([A-Z]{2}\\d[A-Z]\\d[A-Z]{2})|(GIR0AA))$", 
      :languages=>"en-GB,cy-GB,gd", :geonameid=>"2635167", :neighbours=>"IE", :equivalentfipscode=>nil}
    @country            = IPCountry.find(@ip_from_uk)
    @detail_by_code     = IPCountry.info(@country.country_code2)    
    @detail_by_ip       = IPCountry.info(@ip_from_uk)        
  end

  def test_that_ip_to_country
    assert_instance_of GeoIP::Country,  @country
    assert_equal 77,                    @country.country_code
    assert_equal "GB",                  @country.country_code2
    assert_equal "GBR",                 @country.country_code3    
    assert_equal "United Kingdom",      @country.country_name
    assert_equal "EU",                  @country.continent_code
  end

  def test_that_code_to_detailed_info
    @details.each do |k,v|
      assert_equal v, @detail_by_code[k]          
    end
  end
  
  def test_that_ip_to_detailed_info
    @details.each do |k,v|
      assert_equal v, @detail_by_ip[k]          
    end    
  end  
end