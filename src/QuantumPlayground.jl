module QuantumPlayground

# Importing and loading dependencies
import LinearAlgebra
import Calculus
import Statistics
import MathPhysicalConstants
using Calculus
using Statistics
using MathPhysicalConstants

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

# Polar Form Conversion Operation
"""
    polarform(complex_number) = r*(cos(θ)+im*sin(θ))

A conversion function which can convert a complex number into its equivalent polar form. Can also be applied iteratively to matrices.

# Examples
```julia-repl
julia> polarform(2-3i)
3.605551275463989 * cos(-0.982793723247329) + im * sin(-0.982793723247329)

2.0-2.99999im
```
"""
function polarform(complex_number)
	a = complex_number.re
	b = complex_number.im
	r = √(((a)^2)+((b)^2))
	θ = atan(b/a)
	polar = r*(cos(θ)+im*sin(θ))
	print(r, " ", *, " ", cos, "(", θ, ")", " ", +, " ", im, " ", *, " ", sin, "(", θ, ")\n\n")
	return polar
end
		
# Inclusions
include("QubitGates.jl")
include("PhotonPlayground.jl")
include("BasisStates.jl")

end # module
