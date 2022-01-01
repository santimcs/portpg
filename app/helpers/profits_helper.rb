module ProfitsHelper

    def kind_desc(kind)
        case kind
        when 0
            kind_desc = 'Lower'            
        when 1
            kind_desc = 'Higher'          
        end     
    end

end
