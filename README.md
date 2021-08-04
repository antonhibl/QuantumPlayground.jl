# QuantumPlayground.jl
---
Author: Anton Hibl, E-mail: antonhibl11@gmail.com
---

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

## Installation
The install process is undergoing construction as the package is still under construction, if you desire to test as is please clone the
repository and use the Pkg manager to compile and build yourself. This will be streamlined later on. :)

<hr>

## API
Gates from the standard classical model of computing are defined alongside the standard gates which are used in the qubit
model of quantum computation:

- The AND Gate
: `AND = [1 1 1 0;0 0 0 1]`, This gate is a classical digital logic gate with 2 or more inputs and 1 output that performs *logical conjunction*. The output of an AND gate is true only when all of the inputs are true. If one or more of an AND gate's inputs are false, then the output of the AND gate is false.

- The NOT Gate(*Pauli X*)
: `X = [0 1;1 0]`, Also called the negation, uses one input to generate one output. A NOT gate inverts the input.

- The NAND Gate
: `NAND = [0 0 0 1;1 1 1 0]`, A logic gate which produces an output which is false only if all its inputs are true; thus its output is complement to that of an AND gate.

- The OR Gate
: `OR = [1 0 0 0;0 1 1 1]`, A digital logic gate that implements logical disjunction (∨) from mathematical logic, effectively returning finds the maximum between two binary digits, just as the complementary AND function finds the minimum.

- The NOR Gate
: `NOR = [0 1 1 1;1 0 0 0]`, A digital logic gate that implements logical NOR, NOR is the result of the negation of the OR operator. It can also in some senses be seen as the inverse of an AND gate.

- The Identity Gate
: `I = [1 0;0 1]`, This is simply a gate that does nothing. Its matrix is the identity matrix.

- The Hadamard Gate
: `H = (1/√2)*[1 1;1 -1]`, A fundamental quantum gate which allows us to move away from the poles of the Bloch sphere and create a superposition of |0⟩ and |1⟩

- The Pauli Y Gate
: `Y = [0 -im;im 0]`, The Pauli Y gate is equivalent to Ry for the angle . It is equivalent to applying X and Z, up to a global phase factor.

- The Pauli Z Gate
: `Z = [1 0;0 -1]`, The Pauli Z gate acts as identity on the state and multiplies the sign of the state by -1. It therefore flips the and states. In the +/- basis, it plays the same role as the NOT gate in the $$ |0\rangle/|1\rangle $$ basis.

- The RX Gate
: `RX = (1/√(2))*[1+im 1-im;1-im 1+im]`, The RX gate implements . On the Bloch sphere, this gate corresponds to rotating the qubit state around the x axis by the given angle.

- The Square Root of X Gate
: `SX = (1/√(2))*[1 -im;-im 1]`, This gate implements the square-root of X, $$ \sqrt{X} $$. Applying this gate twice in a row produces the standard Pauli-X gate. Like the Hadamard gate, creates an equal superposition state if the qubit is in the state , but with a different relative phase.

these can be used like so:

`QuantumPlayground.<gate name here>`

<hr>

## PhotonPlayGround.jl
PhotonPlayground.jl serves as a sub-package to QuantumPlayground.jl wherein the user can explore the differences between classical qubit 
modeled quantum calculations and photonic continuous-variable modeled quantum calculations. This sub-package is a WIP and the math is under
inspection and refinement still.

