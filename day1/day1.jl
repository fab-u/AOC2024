
content = split.(readlines(file))
get_sorted(n) = sort(parse.(Int, getindex.(content, n)))
A, B = get_sorted.([1,2]) # get sorted integer vectors of both columns

# some more comments
### 1. part: distance between lists ###
distance = sum(abs.(A - B))
println("Distance between lists: $(distance)")

### 2. part: similarity score ###
function similarity_score(A, B)
    score, a_previous, count_previous = 0, 0, 0
    for a in A
        if a == a_previous 
            # use result if number was already counted
            count = count_previous
        else 
            # if not, count it
            count = 0
            for b in B
                if a == b
                    count += 1
                elseif b > a
                    #no need to continue since A and B are sorted
                    break 
                end
            end
        end
        
        score += a * count
        count_previous, a_previous = count, a
    end
    return score
end

println("Similarity score: $(similarity_score(A, B))")
