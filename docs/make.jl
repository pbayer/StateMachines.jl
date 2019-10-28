using Documenter, StateMachines

makedocs(
    modules = [StateMachines],
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    sitename = "StateMachines.jl",
    authors  = "Paul Bayer",
    pages = [
        "Home" => "index.md",
        "Overview" => "overview.md",
        "Usage" => "usage.md",
        "Examples" => "examples.md",
        "Internals" => "internals.md"
    ]
)

deploydocs(
    repo   = "github.com/pbayer/StateMachines.jl.git",
    target = "build",
    deps   = nothing,
    make   = nothing
)
