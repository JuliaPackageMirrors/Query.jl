using Query
using DataFrames
using NamedTuples
using DataStreams
using CSV
using Feather

df = DataFrame(name=["John", "Sally", "Kirk"], age=[23., 42., 59.], children=[3,5,2])

x = @from i in df begin
    @select i
    @collect CSV.Sink("test.csv")
end

x = @from i in df begin
    @select i
    @collect Feather.Sink("test.feather")
end
