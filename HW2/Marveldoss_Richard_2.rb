class Numeric
  @@currencies1 = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019,'dollar'=>1}
  @@currencies2=  {'yen' => 76.9, 'euro' =>0.774, 'rupee'=>52.63, 'dollar'=>1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies1.has_key?(singular_currency)
      self * @@currencies1[singular_currency]
      
    else
      super
    end
  end


 
  def to(method_i)
      final_currency=method_i.to_s.gsub(/s$/,'')
      if @@currencies2.has_key?(final_currency)
          self * @@currencies2[final_currency]
          #print "hello"
      end
  end
end
#print 5.euro
print 10.rupees.to(:euro)
#end