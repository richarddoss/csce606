class Class
    def attr_accessor_with_history(attr_name)
        attr_name=attr_name.to_s
        attr_reader attr_name
        #attr_writer attr_name
        attr_reader attr_name+"_history"
        class_eval %Q(def initialize; @#{attr_name}_history=["nil"];end)
        class_eval (%Q(def #{attr_name}=(value);@#{attr_name}_history.push(value.to_s);@#{attr_name}=value;end))
    end
end
class Foo
    attr_accessor_with_history:bar
end
f=Foo.new
print f.bar_history,"\n"
f.bar=1
#print f.bar
f.bar=2
print f.bar_history,"\n"
print f.bar
#print g