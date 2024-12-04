content = readlines("day4/input.txt")

word = "XMAS"

directions = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [-1, 1], [1, -1], [-1, -1]]

function find_all(content)
    sum = 0
    locations = findall.(word[1], content)
    
    len = length(word)
    max_lines = length(content)
    max_columns = length(content[1])

    for (line, locs) in enumerate(locations)
        for loc in locs
            #println("___ $(line) $(loc) ________________________")
            for direction in directions
                is_valid = true
                #println("Direction: $(direction)")
                if (1 <= (line + (len-1)*direction[1]) <= max_lines) && (1 <= (loc + (len-1)*direction[2]) <= max_columns)
                    #direction is possible within the arrays bounds
                    for i in 1:len-1
                        position = [line, loc] + i*direction
                        if word[i+1] == content[position[1]][position[2]]
                            #println("    Valid character found: $(position), $(content[position[1]][position[2]])")
                        else
                            is_valid = false
                            break
                        end
                    end 
                else
                    is_valid = false
                end
                if is_valid
                    sum+=1
                end
            end
        end
    end
    return sum
end

println(find_all(content))