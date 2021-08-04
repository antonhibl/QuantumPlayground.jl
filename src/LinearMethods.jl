import LinearAlgebra
import Calculus
import Statistics

using LinearAlgebra
using Calculus
using Statistics

# Functions and Rotations

"""
    Rotation(matrix, Θ)

Computes a rotation of a matrix around the x-axis using an angle specified
by Θ.

# Examples
```julia-repl
julia> qp.Rotation(qp.I, pi/2)
[1 -1;1 1]
```

# Arguments
- `matrix`: Matrix to be rotated
- `Θ`: Angular degree of rotation
"""
function Rotation(matrix, Θ)
    [cos(Θ) -sin(Θ);sin(Θ) cos(Θ)]+matrix
end

"""
    U2_Rotation(matrix, θ, α)

Computes 2 consecutive rotations of a matrix; first around the x-axis, and
then around the y-axis. The degrees of each axis' rotation are given by θ
for the x-axis, and α for the y-axis.

# Examples
```julia-repl
julia> qp.U2_Rotation(qp.I, pi, 2pi)
[1.70711+0.0im          0.707107-8.65956e-17im;
 0.707107-1.73191e-16im  0.292893+2.59787e-16im]

# Arguments
- `matrix`: The matrix to be rotated
- `θ`: The angle of rotation for the x-axis
- `α`: The angle of rotation for the y-axis
"""
function U2_Rotation(matrix, θ, α)
	((1/√(2))*[1 -e^(im*θ);e^(im*α) e^(im*(α+θ))])+matrix
end

"""
   U3_Rotation(matrix, θ, α, β)

Computes 3 consecutive rotations of a matrix around fist the x, then the y, then the z;the degrees for each axis' rotation are given by θ for x, α for 
y, and β for z.

# Examples
```julia-repl
julia> qp.U3_Rotation(qp.I, pi, pi/2, pi/2)
[1.70711+0.0im          -0.707107+1.73191e-16im;
 -0.707107+8.65956e-17im   0.292893+2.59787e-16im]
```

# Arguments
- `matrix`: matrix to be rotated
- `θ`: The angle of rotation for the x-axis
- `α`: The angle of rotation for the y-axis
- `β`: The angle of rotation for the z-axis

"""
function U3_Rotation(matrix, θ, α, β)
        [cos(θ/2) (-e^(im*α))*sin(θ/2);(e^(im*β)*sin(θ/2)) (e^(im*(β+α))*cos(θ/2))]+matrix
end

"""
    Hermitian(matrix)

Compute the Hermitian(Conjugate Transpose) of a matrix, remains the
same matrix if it is a unitary or quantum gate.

# Examples
```julia-repl
julia> qp.Hermitian([1 0;0 1])
[1 0;
 0 1]
```

```julia-repl
julia> qp.Hermitian([0 im;im 0])
[0 -im;
 -im 0]
```

# Arguments
- `matrix`: The matrix to compute the Hermitian of
"""
function Hermitian(matrix) 
	conj(transpose(matrix))
end

"""
    Measure(matrix)

Measure a circuit matrix and return probabilities(with noise due to
classical computational physics).

# Examples
```julia-repl
julia> qp.Measure(qp.H)
[0.5 0.5;
 0.5 -0.5]
```

# Arguments
- `matrix`: The matrix to be measured
"""
function Measure(matrix)
	matrix/√(2)
end

"""
    invert(matrix)

Compute the inversion of a 2×2 matrix

# Examples
```julia-repl
julia> qp.invert([0 -i;i 0]
[0 i;
 -i 0]
```

# Arguments
- `matrix`: The matrix to be inverted
"""
function invert(matrix)
	(1/((matrix[1]*matrix[4])-(matrix[2]*matrix[3])))*[matrix[4] -matrix[2];-matrix[3] matrix[1]]
end