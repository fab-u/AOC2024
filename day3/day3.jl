 input = read("day3/input.txt", String)

# check if the first character(s) are digits
# if so, returns the number and its digit count
# otherwise returns false
function is_number(s)
    number = 0
    is_valid = false
    len = 0
    for i in 1:min(3, length(s)) # max three digits
        if isdigit(s[i])
            number = number * 10 + parse(Int, s[i])
            is_valid = true # at least one digit has to be given
            len = i
        else
            break
        end
    end
    return is_valid ? (number, len) : false
end

# returns sum of all valid multiplications 
function parse_code(content)
    sum = 0
    candidates = split(content, "mul(")
    for candidate in candidates
        if (A = is_number(candidate)) != false
            nextchar = A[2]+1
            if length(candidate) >= nextchar && candidate[nextchar] == ','
                nextchar += 1
                if (B = is_number(candidate[nextchar:end])) != false
                    nextchar += B[2]
                    if length(candidate) >= nextchar && candidate[nextchar] == ')'
                        # We have a winner !!!
                        sum += A[1] * B[1]
                    end
                end
            end
        end
    end
    return sum
end

### Part 1 ###
println("Part I ", parse_code(input))

### Part 2 ###
dont_split = split(input, "don't()")
do_split = split.(dont_split, "do()")
deleteat!.(do_split, 1) # remove the first element as it is a don't() block

do_blocks = vcat(do_split...)
push!(do_blocks, dont_split[1]) #string before first don't() is also valid

println("Part II ", parse_code(join(do_blocks)))
