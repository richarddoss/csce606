class Desserts                                #defintion of base class with setter and getter function
    def initialize(name,calories)
        @name=name
        @calories=calories
    end
    def set_Desserts(name,calories)
        @name=name
        @calories=calories
    end
    def get_name
        @name
    end
    def get_calories
        @calories
    end
    def healthy?                               #custom function healthy? to check if calories value is less than 200
        if  @calories <200 
            return(true)
        else
            return(false)
        end
    end
    def Delicious?                             #custom function to check if delcious 
        return true                             
    end
end
    
class JellyBean < Desserts                     #class Jellybean defined inherited from Desserts
    def initialize(name,calories,flavor)
        super(name,calories)                   #calling base class constructor
        @flavor=flavor
    end
    def get_flavor
        @flavor
    end
    def set_flavor(flavor)
        @flavor=flavor
    end
    def delicious?                               #function overloaded and method defined
        if @flavor!="black licorice"
            return(true)
        else
            return(false)
        end
    end
end

#Testing conditions

D=JellyBean.new("Icecream",200,"black licorice")
C=Desserts.new("Brownies",100)
print C.get_name
