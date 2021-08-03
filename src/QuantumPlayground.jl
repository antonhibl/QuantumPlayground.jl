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

# Defining various constants

"""
    e = MathConstants.e

Eulers Constant.
"""
e = MathConstants.e # Euler's Constant

"""
    × = LinearAlgebra.kron

written as \times in julia, this allows two matrixes to be combined into a tensor product to be used in larger circuits with more bits.

# Examples
```julia-repl
julia> qp.I×qp.I
[1 0 0 0;
 0 1 0 0;
 0 0 1 0;
 0 0 0 1]
"""
× = LinearAlgebra.kron  # written as \times in julia


# Defining orthonormal(orthogonal) computational basis states

"""
    zero_state = [1;0]

|0⟩ basis state as defined in terms of Quantum Computational Linear Algebra.

# Examples
```julia-repl
julia> qp.zero_state
[1;
 0]
 ```
"""
zero_state = [1;0]

"""
    one_state = [0;1]

|1⟩ basis state as defined in terms of Quantum Computational Linear Algebra.

# Examples
```julia-repl
julia> qp.one_state
[0;
 1]
 ```
"""
one_state = [0;1]


# Defining directional basis states
up_state = zero_state
down_state = one_state
left_state = [1/sqrt(2);1/sqrt(2)]
right_state = [1/sqrt(2);-1/sqrt(2)]
upright_state = [1/2;-sqrt(3)/2] 
downleft_state = [sqrt(3)/2;1/2]

# Defining some gates and transformations
X = [0 1;1 0]
I = [1 0;0 1]
Y = [0 -im;im 0]
Z = [1 0;0 -1]
H = (1/√(2))*[1 1;1 -1]
S = [1 0;0 e^((im*π)/2)]
T = [1 0;0 e^((im*π)/4)]
SX = (1/√(2))*[1+im 1-im;1-im 1+im]
RX = (1/√(2))*[1 -im;-im 1]
RZ = [e^(-im*(pi/2)) 0;0 e^(im*(pi/2))]
SZ = S*S
QZ = T*T*T*T
P = [1 0;0 e^(im*pi)]
AND = [1 1 1 0;0 0 0 1]
NAND = [0 0 0 1;1 1 1 0]
OR = [1 0 0 0;0 1 1 1]
NOR = [0 1 1 1;1 0 0 0]
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


# Some potentially new gates I have constructed here

"""
    AH = ((Rotation([1 1;0 0], π))*H)

A "Spinning" Hadamard gate, due to it being rotated while in superposition.

# Examples
```julia-repl
julia> qp.AH
[0.707107  -0.707107;
 -0.707107  0.707107]
"""
AH = ((Rotation([1 1;0 0], π))*H)

"""
    H = -eigvecs(AH/sqrt(2))

By using this new "AH" gate and the eigenvectors of its measured state, 
we can reconstruct a more accurate and faithful H gate that satisifies 
H*H=I.
"""
H = -eigvecs(AH/sqrt(2))

"""
    XH = (((([0 1;1 0]*RX)/sqrt(2))*SX)/sqrt(2))

A new theoretical H gate based on the principle that both the bits state, 
and its spins along the descending diagonal are in superpositions.

# Examples
```julia-repl
julia> qp.XH
[0.5-0.5im  0.0+0.0im;
 0.0+0.0im  0.5-0.5im]
"""
XH = (((([0 1;1 0]*RX)/sqrt(2))*SX)/sqrt(2))

QAND = invert(Hermitian(AND))

# greet the user
greet() = print("Welcome to your Quantum Playground!")

end # module
