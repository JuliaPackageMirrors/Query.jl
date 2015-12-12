using LINQ
using DataFrames
using NamedTuples

immutable Person
    Name::String
    Friends::Vector{String}
end

source = Array(Person,0)
push!(source, Person("John", ["Sally", "Miles", "Frank"]))
push!(source, Person("Sally", ["Don", "Martin"]))

result = @from i in source begin
         @where length(i.Friends) > 2
         @select @NT( Name=>i.Name, Friendcount=>length(i.Friends))
end collect()

println(result)

result = @from i in source begin
         @where length(i.Friends) > 2
         @select @NT( Name=>i.Name, Friendcount=>length(i.Friends))
end collect(DataFrame)

println(result)
