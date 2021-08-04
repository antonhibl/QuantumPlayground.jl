import QuantumPlayground
using QuantumPlayground

k = 1

# Eulers Constant
"""
    e = MathConstants.e

Eulers Constant.
"""
e = MathConstants.e

# ħ constant
"""
"""
ħ = 2
# ω(omega) constant
"""
"""
ω = 1

# The Annihilation and Creation Operators
"""
"""
â = (im/2)+im*(im/2)

"""
"""
âdag = (im/2)-im*(im/2)

# the x̂ and p̂ quadrature operators
"""
"""
x̂ = sqrt(ħ/(2*ω))*(â+âdag)

"""
"""
p̂ = (1/im)*(sqrt((ħ*ω)/2))*(â-âdag)


# Redefining the annihilation and creation operators
"""
"""
â = x̂+im*p̂

"""
"""
âdag = x̂-im*p̂

# The Unitary matrix associated with a Beamsplitter
"""
    U(θ, λ) = [cos(θ) (-e^(im*λ))*sin(θ);(e^(-im*λ))*sin(θ) cos(θ)]

The Unitary matrix associated with beam splitter, U(Β{θ,λ}), where θ
and λ are determined by the reflection amplitude ɼ and the transmission
amplitude τ.

# Examples
```julia-repl
julia> U(pi/2, pi/2)
[6.12323e-17+0.0im  -6.12323e-17-1.0im;
 6.12323e-17-1.0im   6.12323e-17+0.0im]
```

# Arguments
- `θ`: 1st Angle
- `λ`: 2nd Angle
"""
U(θ, λ) = [cos(θ) (-e^(im*λ))*sin(θ);(e^(-im*λ))*sin(θ) cos(θ)]

# A Better defined Unitary matrix associated with a Beamsplitter
"""
    UB(θ) = [cos(θ) -im*sin(θ);-im*sin(θ) cos(θ)]

This is a more simplified, albeit accurate representation of the
Unitary matrix that can be associated with a beamsplitter. θ is determined by the reflection amplitude ɼ and the transmission amplitude τ

# Examples
```julia-repl
julia> qp.UB(pi/2)
[6.12323e-17+0.0im 0.0-1.0im;
 0.0-1.0im 6.12323e-17+0.0im]
 ```

 ```julia-repl
 julia> UB(pi/2)*UB(-pi/2)
 [1.0+0.0im  0.0+0.0im;
  0.0+0.0im  1.0+0.0im]
  ```

  # Arguments
  - `θ`: Angle
"""
UB(θ) = [cos(θ) -im*sin(θ);-im*sin(θ) cos(θ)]

# The Phase Shift Operator P written as UP
"""
    UP(θ) = [e^(im*θ) 0;0 1]

This gate is equivalent to a rotation of -θ around the z-axis

# Examples
```julia-repl
julia> UP(pi)
[-1.0+1.22465e-16im 0.0+0.0im;
 0.0+0.0im 1.0+0.0im]
```

# Arguments
- `θ`: Angle of rotation
"""
UP(θ) = [e^(im*θ) 0;0 1]

# An Identity matrix keeping the imaginary portion coherent
"""
    UI = Rotation(UB(pi/2), 2pi)

This acts just like an Identity Gate but it also applies to an imaginary 
element of a matrices inversion coherently.

# Examples
```julia-repl
julia> UI*AH
[0.707107+0.707107im -0.707107-0.707107im;
 -0.707107-0.707107im 0.707107+0.707107im]
```

```julia-repl
julia> UI*H
[0.707107-0.707107im   0.707107+0.707107im;
 0.707107-0.707107im  -0.707107-0.707107im]
 ```
"""
UI = QuantumPlayground.Rotation(UB(pi/2), 2pi)

# Dagger operation
"""
"""
dag = QuantumPlayground.Hermitian

# The Hamiltonian which corresponds to field energy
"""
"""
Ĥ = ((ħ*ω)/2)*(â*dag(â)+dag(â)*â)

# The Heisenberg Equation of motion of an operator
"""
"""
Â(t) = e^(im*(Ĥ/ħ)*t)*e^(-im*(Ĥ/ħ)*0)

# The Vector Potential Operator
"""
"""
𝕬(r, t) = Â(0)*e^(im*(k*r-ω*t))*â+conj(Â(0))*e^(-im*(k*r-ω*t))*dag(â)

# The Electric Field Operator
"""
"""
𝕰(r, t) = im*ω*(Â(0)*e^(im*(k*r-ω*t))*â-conj(Â(0))*e^(-im*(k*r-ω*t))*dag(â))

# The Magnetic Flux Density Operator
"""
"""
𝕭(r,t) = im*k*(Â(0)*e^(im*(k*r-ω*t))*â-conj(Â(0))*e^(-im*(k*r-ω*t))*dag(â))
