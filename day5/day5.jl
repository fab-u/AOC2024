lines = readlines("day5/input.txt")

# extract the rules and orderings from input
rules = []
orderings = []

for line in lines
    if '|' in line
        pair = parse.(Int, split(line, "|"))
        push!(rules, pair)
    elseif ',' in line
        ordering = parse.(Int, split(line, ","))
        push!(orderings, ordering)
    end
end

# check if all rules are obeyed for a certain ordering
function check_rules(ordering)
    for (i, page) in enumerate(ordering)
        for rule in rules
            if rule[1] == page
                if rule[2] in ordering[begin: i]
                    return false
                end
            end
        end
    end
    return true
end

# returns the middle element of a vector
function middle_page(ordering)
    return ordering[div(length(ordering)+1, 2)]
end

# Part 1: Sum of middle pages of valid orderings
sum = 0
for ordering in orderings
    if check_rules(ordering)
        global sum += middle_page(ordering)
    end
end

println("Part 1 solution: $(sum)")

# Part 2: Correct invalid orederings
# If who numbers are the wrong way around, swich them
function reorder(ordering)
    while !check_rules(ordering) 
        
    end
end
