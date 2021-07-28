# QuantumPlayground.jl
<br>
#### Author: Anton Hibl, E-mail: antonhibl11@gmail.com

<hr>

## Introduction
The Quantum Playground package provides tools to quickly perform and test computations involving quantum compuational gates
and their respective basis states. These are represented using Julia's already present Linear Algebra Syntax in unison with
some of the higher level mathematical functions in the LinearAlgebra, Calculus, and Statistics packages. The goal is to create
an easy to run environment in which the user can perform and test out small scale quantum computations and gate combinations
to better understand the underlying concepts which motivate quantum computation. You are able to easily combine compuations
utilizing different gates, basis states, rotations, measurements, and functions in an intuitive way, albeit while the matrices
themselves are only probabilistic and not truely quantum(deterministic). Due to includion of Pluto the user may also use it
inside of a notebook easily, as well as all the included mathematical packages are handy tools when dealing with matrices.

<hr>

## API
Most basic gates that would be involved in simple computations are included:

- `I = [1 0;0 1]`
- `H = (1/√2)*[1 1;1 -1]`
- `X = [0 1;1 0]`
- `Y = [0 -im;im 0]`
- `Z = [1 0;0 -1]`
- `RX = (1/√(2))*[1+im 1-im;1-im 1+im]`
- `SX = (1/√(2))*[1 -im;-im 1]`

these can be used like so:

`QuantumPlayground.<gate name here>` -> `<gate is returned>`

<hr>

Some Rotational functions for matrices and a Hermitian function are also defined

