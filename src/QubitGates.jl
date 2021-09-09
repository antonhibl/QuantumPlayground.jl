import LinearAlgebra
import Calculus
import Statistics
import QuantumPlayground

using LinearAlgebra
using Calculus
using Statistics
using QuantumPlayground


# Euler's Constant
"""
    e = MathConstants.e

Eulers Constant.
"""
e = MathConstants.e

#####################
# Bit & Qubit Gates #
#####################

# The Pauli-X/NOT Gate
"""
    X = [0 1;1 0]

The pauli X gate, equivalent to a 90° rotation about the X axis.

# Examples
```julia-repl
julia> X
[0 1;
 1 0]
```
"""
X = [0 1;1 0]

# The Identity Matrix
"""
    I = [1 0;0 1]

The Identity Matrix

# Examples
```julia-repl
julia> I
[1 0;
 0 1]
```
"""
I = [1 0;0 1]

# The Pauli-X Gate
"""
    Y = [0 -im;im 0]

The pauli Y gate, equivalent to a 90° rotation about the Y axis.

# Examples
```julia-repl
julia> Y
[0+0im 0-1im;
 0+1im 0+0im]
```
"""
Y = [0 -im;im 0]

# The Pauli-Z Gate
"""
    Z = [1 0;0 -1]

The pauli Z gate, equivalent to a 90° rotation about the Z axis.

# Examples
```julia-repl
julia> Z
[1 0;
 0 -1]
```
"""
Z = [1 0;0 -1]

# The Hadamard Gate
"""
    H = (1/√(2))*[1 1;1 -1]

The Hadamard Gate, puts a state or matrix of bits into a linear combination or superposition of states, wherein the
information is no longer deterministic but probabilistic in that you may find it either position with varying
probabilities which may be manipulated before measurements.

# Examples
```julia-repl
julia> H
[0.707107 0.707107;
 0.707107 -0.707107]
```
"""
H = (1/√(2))*[1 1;1 -1]

# The Quantum S Phase Gate
"""
    S = [1 0;0 e^((im*π)/2)]

The S Gate initiates a phase of π/2.
"""
S = [1 0;0 e^((im*π)/2)]

# The Quantum T Phase Gate
"""
    T = [1 0;0 e^((im*π)/4)]

The T Gate initiates a phase of π/4.
"""
T = [1 0;0 e^((im*π)/4)]

# The Square Root of X Gate
"""
    SX = (1/√(2))*[1+im 1-im;1-im 1+im]

The Square Root of NOT gate acts the same as the Hadamard in essence, sometimes more cleanly,
carrying less noise.

# Examples
```julia-repl
julia> SX
[0.707107+0.707107im 0.707107-0.707107im;
 0.707107-0.707107im 0.707107+0.707107im]
```
"""
SX = (1/√(2))*[1+im 1-im;1-im 1+im]

# The RX Gate
"""
    RX = (1/√(2))*[1 -im;-im 1]

The Quantum RX Gate, equivalent to the Hadamard in essence.

# Examples
```julia-repl
julia> RX
[0.707107+0.0im 0.0-0.707107im;
 0.0-0.707107im 0.707107+0.0im]
```
"""
RX = (1/√(2))*[1 -im;-im 1]

# Rotational Gate
"""
    Rotation(matrix, Θ)

Computes a rotation of a matrix around the x-axis using an angle specified
by Θ.

# Examples
```julia-repl
julia> Rotation(I, pi/2)
[1 -1;1 1]
```

# Arguments
- `matrix`: Matrix to be rotated
- `Θ`: Angular degree of rotation
"""
function Rotation(matrix, Θ)
    [cos(Θ) -sin(Θ);sin(Θ) cos(Θ)]+matrix
end

# U2 Rotational Gate
"""
    U2_Rotation(matrix, θ, α)

Computes 2 consecutive rotations of a matrix; first around the x-axis, and
then around the y-axis. The degrees of each axis' rotation are given by θ
for the x-axis, and α for the y-axis.

# Examples
```julia-repl
julia> U2_Rotation(I, pi, 2pi)
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

# U3 Rotational Gate
"""
   U3_Rotation(matrix, θ, α, β)

Computes 3 consecutive rotations of a matrix around fist the x, then the y, then the z;the degrees for each axis' rotation are given by θ for x, α for 
y, and β for z.

# Examples
```julia-repl
julia> U3_Rotation(I, pi, pi/2, pi/2)
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

# Hermitian Operation
"""
    Hermitian(matrix)

Compute the Hermitian(Conjugate Transpose) of a matrix, remains the
same matrix if it is a unitary or quantum gate.

# Examples
```julia-repl
julia> Hermitian([1 0;0 1])
[1 0;
 0 1]
```

```julia-repl
julia> Hermitian([0 im;im 0])
[0 -im;
 -im 0]
```

# Arguments
- `matrix`: The matrix to compute the Hermitian of
"""
function Hermitian(matrix) 
	conj(transpose(matrix))
end

# Measurement Operation
"""
    Measure(matrix)

Measure a circuit matrix and return probabilities(with noise due to
classical computational physics).

# Examples
```julia-repl
julia> Measure(H)
[0.5 0.5;
 0.5 -0.5]
```

# Arguments
- `matrix`: The matrix to be measured
"""
function Measure(matrix)
	matrix/√(2)
end

# 2x2 Inversion Operation
"""
    invert(matrix)

Compute the inversion of a 2×2 matrix

# Examples
```julia-repl
julia> invert([0 -i;i 0]
[0 i;
 -i 0]
```

# Arguments
- `matrix`: The matrix to be inverted
"""
function invert(matrix)
	(1/((matrix[1]*matrix[4])-(matrix[2]*matrix[3])))*[matrix[4] -matrix[2];-matrix[3] matrix[1]]
end

# The RZ Gate
"""
    RZ = [e^(-im*(pi/2)) 0;0 e^(im*(pi/2))]

The Quantum RZ gate.

# Examples
```julia-repl
julia> RZ
[6.12323e-17-1.0im 0.0+0.0im;
 0.0+0.0im 6.12323e-17+1.0im]
```
"""
RZ = [e^(-im*(pi/2)) 0;0 e^(im*(pi/2))]

# The RY Gate
"""
    RY(θ) = [cos(θ/2 -sin(θ/2);sin(θ/2) cos(θ/2)]

The Quantum RY Gate.

# Examples
```julia-repl
julia> RY(pi)
[6.12323e-17 -1.0;
 1.0 6.12323e-17]
```
"""
RY(θ) = [cos(θ/2) -sin(θ/2);sin(θ/2) cos(θ/2)]

# The "Square Root" of  Z Gate
"""
    SZ = S*S

The Square Root of Z gate acts as a half turn to the regular Z about the Z axis.

# Examples
```julia-repl
julia> SZ
[1.0+0.0im 0.0+0.0im;
 0.0+0.0im -1.0+1.22465e-16im]
```
"""
SZ = S*S

# Quarter-Z Gate
"""
    QZ = T*T*T*T

This acts as a quarter rotation of the regular Z gate around the Z axis.

# Examples
```julia-repl
julia> QZ
[1.0+0.0im 0.0+0.0im;
 0.0+0.0im -1.0+2.77556e-16im]
```
"""
QZ = T*T*T*T

# Quantum Phase Gate(π)
"""
    P = [1 0;0 e^(im*pi)]

The Quantum Phase Gate using a phase of pi to rotate around the Z axis.

# Examples
```julia-repl
julia> P
[1.0+0.0im 0.0+0.0im;
 0.0+0.0im -1.0+1.22465e-16im]
```
"""
P = [1 0;0 e^(im*pi)]

# The "Imaginary Identity" gate
"""
    II = qp.I+(qp.I*qp.Y*qp.X)

An I gate with a very basic imaginary component along its Echelon Form Diagonal, serves as a basic way to clone information into an imaginary bit component.

# Examples
```julia-repl
julia> II
[1-1im 0+0im;
 0+0im 1+1im]
```

```julia-repl
julia> II*II
[0-2im  0+0im;
 0+0im  0+2im]
 ```
"""
II = I+(I*Y*X)

# Some potentially new gates I have constructed here

# The "Spinning" Hadamard Gate
"""
    SpinH = ((Rotation([1 1;0 0], π))*H)

A "Spinning" Hadamard gate, due to it being rotated while in superposition, its negative value is now in 2 places showing how it could have rotated either direction.

# Examples
```julia-repl
julia> AH
[0.707107  -0.707107;
 -0.707107  0.707107]
"""
SpinH = ((Rotation([1 1;0 0], π))*H)

# The Hadamard Gate again
"""
    H = -eigvecs(SpinH/sqrt(2))

By using this new "SpinH" gate and the eigenvectors of its measured state, 
we can reconstruct a more accurate and faithful H gate that satisifies 
H*H=I. In reality the SpinH is a spinning version of the originally defined
Hadamard gate, defined as H = [1/√2 1/√2;1/√2 -1/√2]. This is the quantum gate
which is notorious for being th egate which instigates a linear combination of states;
in other words it is the quantum gate most commonly used to instigate states of superposition.
"""
H = -eigvecs(SpinH/sqrt(2))

# The X-Hadamard Gate
"""
    SpIn = (((([0 1;1 0]*RX)/sqrt(2))*SX)/sqrt(2))

A new theoretical "I" gate based on the principle that both the bits state, 
and its spins along the descending diagonal are in superpositions, meaning
the I matrix is is represented as one 2 bits split in two between its real and imaginary parts.

# Examples
```julia-repl
julia> XH
[0.5-0.5im  0.0+0.0im;
 0.0+0.0im  0.5-0.5im]
"""
XH = (((([0 1;1 0]*RX)/sqrt(2))*SX)/sqrt(2))

# The Controlled-Not Gate
"""
    CX = [1 0 0 0;0 1 0 0;0 0 0 1;0 0 1 0]

The CX Gate acts as an entangling mechanism in quantum circuits.

# Examples
```julia-repl
julia> CX
[1 0 0 0;
 0 1 0 0;
 0 0 0 1;
 0 0 1 0]
 ```
 """
 CX = [1 0 0 0;0 1 0 0;0 0 0 1;0 0 1 0]

 # The Controlled-Y Gate
 """
     CY = [1 0 0 0;0 1 0 0;0 0 0 -im;0 0 im 0]

Acts similarly to the Controlled Not in entangling.

# Examples
```julia-repl
julia> CY
[1 0 0 0;
 0 1 0 0;
 0 0 0 -im;
 0 0 im 0]
```
"""
CY = [1 0 0 0;0 1 0 0;0 0 0 -im;0 0 im 0]

# The Controlled-Z Gate
"""
    CZ = [1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 -1]

Acts similarly to the Controlled Not in entangling.

# Examples
```julia-repl
julia> CZ
[1 0 0 0;
 0 1 0 0;
 0 0 1 0;
 0 0 0 -1]
```
"""
CZ = [1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 -1]

# The Toffoli Gate
"""
    Toffoli = [1 0 0 0 0 0;
               0 1 0 0 0 0;
               0 0 1 0 0 0;
               0 0 0 1 0 0;
               0 0 0 0 0 1;
               0 0 0 0 1 0]

The Toffoli Gate acts as an extension of the CX gate, having 2 control qubits instead of 1.

# Examples
```julia-repl
julia> Toffoli
[1  0  0  0  0  0;
 0  1  0  0  0  0;
 0  0  1  0  0  0;
 0  0  0  1  0  0;
 0  0  0  0  0  1;
 0  0  0  0  1  0]
```
"""
Toffoli = [1 0 0 0 0 0;
	   0 1 0 0 0 0;
	   0 0 1 0 0 0;
	   0 0 0 1 0 0;
	   0 0 0 0 0 1;
	   0 0 0 0 1 0]

# The Fredkin Gate
"""
    Fredkin = [1 0 0 0 0 0;
               0 1 0 0 0 0;
               0 0 1 0 0 0;
               0 0 0 0 1 0;
               0 0 0 1 0 0;
               0 0 0 0 0 1]

The Fredkin Gate acts similarly to the Toffoli, having 2 control qubits. The main difference lies in the fact the not acts between the 4th and 5th qubits.

# Examples
```julia-repl
julia> Fredkin
[1 0 0 0 0 0;
 0 1 0 0 0 0;
 0 0 1 0 0 0;
 0 0 0 0 1 0;
 0 0 0 1 0 0;
 0 0 0 0 0 1]
```
"""
Fredkin = [1 0 0 0 0 0;
           0 1 0 0 0 0;
           0 0 1 0 0 0;
           0 0 0 0 1 0;
           0 0 0 1 0 0;
           0 0 0 0 0 1]

# The Adjacency Matrix
"""
    Adj = [0 0 1 0;
           0 0 0 1;
	   1 0 0 0;
	   0 1 0 0]

The Adjacency Matrix is simply an expanded Identity matrix which can be used for 2-qubit computations.

# Examples
```julia-repl
julia> Adj
[0 0 1 0;
 0 0 0 1;
 1 0 0 0;
 0 1 0 0]
```
"""
Adj = [0 0 1 0;
       0 0 0 1;
       1 0 0 0;
       0 1 0 0]

# Set Intersection Operation
⊕ = ⊻

# B Gate
"""
     B(θ) = [cos(θ) -sin(θ);sin(θ) cos(θ)]

Quantum "Beam" gate, acts similarly to a beam splitter, test this using this gate and the UB gate from QuantumPlayground (this UB gate is more specifically a optical photon beamsplitter gate).

# Examples
```julia-repl
julia> B(pi/4)
[1/√2 -1/√2
 1/√2  1/√2]
```
"""
B(θ) = [cos(θ) -sin(θ);sin(θ) cos(θ)]

# Reverse Split Gate
"""
    RSplit = qp.UB(11pi/4)

A version of the beam splitter, placing the matrix of states into a superposition of states, or a linear combination of states, partly opposite to that of the Lsplit gate.

# Examples
```julia-repl
julia> Rsplit
[ -0.707107+0.0im   0.0-0.707107im
   0.0-0.707107im  -0.707107+0.0im ]
```
"""
Rsplit = QuantumPlayground.UB(11pi/4)

# Forward Split Gate
"""
    Fsplit = qp.UB(5pi/4)

A version of the beam splitter, placing the matrix into a superposition of states, or linear combination of states, partly opposite to that of the Rsplit gate

# Examples
```julia-repl
julia> Fsplit
[ -0.707107+0.0im  -0.0+0.707107im
  -0.0+0.707107im  -0.707107+0.0im ]
"""
Fsplit = QuantumPlayground.UB(5pi/4)

# The SWAP Gate
"""
    SWAP = [1 0 0 0;
            0 0 1 0;
	    0 1 0 0;
	    0 0 0 1]

The Swap Gate reterally interchanges the states of 2 qubits with each other.

# Examples
```julia-repl
julia> SWAP
[1 0 0 0
 0 0 1 0
 0 1 0 0
 0 0 0 1]
```
"""
SWAP = [1 0 0 0;
	0 0 1 0;
	0 1 0 0;
        0 0 0 1]
