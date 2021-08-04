module QuantumPlayground

# Importing and loading dependencies
import LinearAlgebra
import Calculus
import Statistics
import Pluto
import MathPhysicalConstants
import ChemEquations
import Nettle
import CryptoUtils

using LinearAlgebra
using Calculus
using Statistics
using Pluto
using MathPhysicalConstants
using ChemEquations
using CryptoUtils
using Nettle

# Euler's Constant
"""
    e = MathConstants.e

Eulers Constant.
"""
e = MathConstants.e # Euler's Constant

# Tensor Product Operator
"""
    × = LinearAlgebra.kron

written as \times in julia, this allows two matrixes to be combined into a tensor product to be used in larger circuits with more bits.

# Examples
```julia-repl
julia> I×I
[1 0 0 0;
 0 1 0 0;
 0 0 1 0;
 0 0 0 1]
"""
× = LinearAlgebra.kron  # written as \times in julia

# greet the user, can be used to test installation
greet() = print("Welcome to your Quantum Playground!")

include("QubitGates.jl")
include("PhotonPlayground.jl")
include("BasisStates.jl")

end # module
