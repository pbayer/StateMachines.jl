# StateMachines.jl

A [Julia](https://julialang.org) package for state machines.

[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://pbayer.github.io/StateMachines.jl/stable)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://pbayer.github.io/StateMachines.jl/dev)
[![Build Status](https://travis-ci.com/pbayer/StateMachines.jl.svg?branch=master)](https://travis-ci.com/pbayer/StateMachines.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/pbayer/StateMachines.jl?svg=true)](https://ci.appveyor.com/project/pbayer/StateMachines-jl)
[![Codecov](https://codecov.io/gh/pbayer/StateMachines.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/pbayer/StateMachines.jl)
[![Coverage Status](https://coveralls.io/repos/github/pbayer/StateMachines.jl/badge.svg?branch=master)](https://coveralls.io/github/pbayer/StateMachines.jl?branch=master)

`StateMachines.jl` provides a framework to describe, model and simulate communicating and queueing systems. A *system* has different incarnations or levels:

1. the outer *box* provides a clock and an interface to the environment and contains *blocks* and *state machines*.
2. Blocks can be nested and used to construct more and deeper levels.
3. State machines implement the system *behavior* with defined *transitions* between their *states*. Through *actions* processes change their environment and communicate with other processes or blocks via *channels*.

### Examples

- see `docs/notebooks`
