module QuantumPlayground

# Importing and loading dependencies
import LinearAlgebra
import Calculus
import Statistics
import MathPhysicalConstants
import Plots
using Calculus
using Statistics
using MathPhysicalConstants
using Plots

# Euler's Constant
"""
    e = MathConstants.e

Eulers Constant.
"""
e = MathConstants.e # Euler's Constant

# Tensor Product Operator
"""
    × = LinearAlgebra.kron

written as \times in julia, this allows two matrixes to be combined 
into a tensor product to be used in larger circuits with more bits.

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
    cartesian2polar(cartesian_complex_number) --> (p, θ)

A conversion function which takes a cartesian form of a complex number, 
a+bi, and transforms it into its polar form, (p, θ).

# Examples
```julia-repl
julia> cartesian2polar(2-3i)
(3.605551275463989, -0.982793723247329)

```
"""
function cartesian2polar(cartesian_complex_number)
	a = cartesian_complex_number.re
	b = cartesian_complex_number.im
	p = √((a^2)+(b^2))
	θ = atan(b/a)

	polar = ( p, θ )

	return polar
end

# Polar Form to Cartesian form function
"""
    polar2cartesian(polar_complex_number) --> a=bi

A conversion function which takes a polar form of a complex number, (p, θ), and transforms it into
it's cartesian form.

# Examples
```julia-repl
julia> polar2cartesian()
```
"""
function polar2cartesian(polar_complex_number)
	p = polar_complex_number[1]
	θ = polar_complex_number[2]

	complex = (p*(cos(θ)+im*sin(θ)))

	if complex == (p*e^(im*θ))
		return complex
	else 
		print("Error")
	end
end

Plots.plotly()

# Polar Form Plotting Function
"""
    polarplot(polar_complex_number)

Plots a given polar form number on the complex polar plane.
"""
function polarplot(polar_complex_number)
	p = polar_complex_number[1]
	θ = polar_complex_number[2]
        
	plot([0, θ], [0, p], proj = :polar, m = 2)
end
	
# Inclusions
include("QubitGates.jl")
include("PhotonPlayground.jl")
include("BasisStates.jl")

end # module
