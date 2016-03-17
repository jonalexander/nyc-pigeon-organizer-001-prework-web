def nyc_pigeon_organizer(data)

  #note - the attributes (:purple, :male, etc need to be converted to strings)
  pigeon_list = {}

  
  data.each do |category, info|    #category = :color, :gender, :lives

    #iterate over details
    info.each do |attribute, nameArray|  #attribute =:purple, :grey, etc, :male, :female, "Subway", "Central Park", etc etc

      #iterate over each name in the array
      nameArray.each do |name|        #name = names in array
    
        if pigeon_list.include?(name) && pigeon_list[name].include?(category)
          #if the name exists in pigeon_list as well as the category, we push the attibute to the attribute array
          pigeon_list[name][category] << attribute.to_s

        elsif pigeon_list.include?(name) && !(pigeon_list[name].include?(category))
          #if the name exists in PL but the category doesnt, we create the category and and attribute array and push the attribute to the array
          pigeon_list[name].merge!(category => [attribute.to_s])

        elsif !(pigeon_list.include?(name) && pigeon_list[name].include?(category))
          #if the name does not exist in PL and neither does the category, then we add name/cat/attribute to the new hash
          #we should only hit this block once for each name
          pigeon_list[name] = {category => [attribute.to_s]}

        end
      end #.each 3
    end #.each 2
  end #.each 1

  pigeon_list
end
