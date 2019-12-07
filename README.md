# StateMachines.jl

A [Julia](https://julialang.org) package for state machines following loosely the system design language [SDL](http://sdl-forum.org/index.htm).

[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://pbayer.github.io/StateMachines.jl/stable)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://pbayer.github.io/StateMachines.jl/dev)
[![Build Status](https://travis-ci.com/pbayer/StateMachines.jl.svg?branch=master)](https://travis-ci.com/pbayer/StateMachines.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/pbayer/StateMachines.jl?svg=true)](https://ci.appveyor.com/project/pbayer/StateMachines-jl)
[![Codecov](https://codecov.io/gh/pbayer/StateMachines.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/pbayer/StateMachines.jl)
[![Coverage Status](https://coveralls.io/repos/github/pbayer/StateMachines.jl/badge.svg?branch=master)](https://coveralls.io/github/pbayer/StateMachines.jl?branch=master)

`StateMachines.jl` provides a framework to describe, model and simulate communicating and queueing systems. Its components are processes or blocks of processes communicating via channels. Processes behave as state machines with defined transitions between their states. Through state actions processes can change their environment e.g. by doing calculations or communicating with other processes.

### Examples

- see `docs/notebooks`
