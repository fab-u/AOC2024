reports = [parse.(Int, split(line)) for line in readlines(open("input.txt", "r"))]

function is_safe(report::Vector{Int})
    grad = diff(report) 
    return all(x -> abs(x) <= 3, grad) && (all(x -> x > 0, grad) || all(x -> x < 0, grad))
end

n_safe = 0
n_also_safe_if_you_trust_the_engineers = 0

for report in reports
    if is_safe(report)
        global n_safe += 1
    else
        for i in 1:length(report)
            if is_safe(report[setdiff(1:end, i)])
                global n_also_safe_if_you_trust_the_engineers += 1
                break
            end
        end
    end
end

println("Part 1: ", n_safe)
println("Part 2: ", n_safe + n_also_safe_if_you_trust_the_engineers)
