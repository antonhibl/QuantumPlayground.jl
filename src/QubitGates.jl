# Classical Quantum Gate Definitions
# author: Anton Hibl

# Importing Dependencies
import LinearAlgebra
import QuantumPlayground

# Specifying Use of Dependencies
using LinearAlgebra
using QuantumPlayground


# Euler's Constant
"""
    e = ℯ

Eulers Constant.
"""
e = ℯ

# The Pauli-X/NOT Gate
"""
    X = [0 1;1 0]

The pauli X gate, equivalent to a 90° rotation about the X axis; also acts the same as a classical not gate, albeit remaining reversible.

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

The Identity Matrix, Returns the same matrix as any matrix it is applied 
towards, in other words, returning the "identity".

# Examples
```julia-repl
julia> I
[1 0;
 0 1]
```
"""
I = [1 0;0 1]

# The Pauli-Y Gate
"""
    Y = [0 -im;im 0]

The pauli Y gate, equivalent to a 90° rotation about the Y axis; flips 
the imaginary and real parts of each element with each other.

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

The Hadamard Gate, places a state into a state of superposition, this 
means can be utilized as a linear combination of states. This 
superposition and it's representation as a matrix of complex numbers, 
can be interpreted mathematically by interpreting the linear combination 
of states linearly by utilizing bra-ket notation.

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

The S Gate initiates a phase of π/2 into a matrix of states.
"""
S = [1 0;0 e^((im*π)/2)]

# The Quantum T Phase Gate
"""
    T = [1 0;0 e^((im*π)/4)]

The T Gate initiates a phase of π/4 into a matrix of states.
"""
T = [1 0;0 e^((im*π)/4)]

# The Square Root of X Gate
"""
    SX = (1/√(2))*[1+im 1-im;1-im 1+im]

The Square Root of NOT gate acts similarly

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

# Length Measurement of a Complex Number ( The Modulus )
"""
    modlength(x[a, b]) = √(a^2 + b^2)

This operation measures the length of a given complex number by 
returning the modulus of the given complex number.

# Examples
```julia-repl
julia> modlength(1/√2+1/√2im)
0.9999999
"""
function modlength(x)
	a = x.re
    b = x.im
    p = √((a^2)+(b^2))
    return p
end

"""
    phase = atan(b/a)

This operation measures the phase of a given complex number, an angle 
which otherwise represents the "time" on the polar plane. Returned in
terms of radians, convert to radians with `rad2deg`
"""
function phase(x)
	a = x.re
	b = x.im
    θ = atan(b/a)
	θ = mod(θ, 2pi)
	return θ
end

# Length Measurement Operation
"""
    magnitude( statevector )

Measures the statevector by returning the modulus of 2 complex numbers,
this is referred to as the magnitude of the statevector. The statevector
is a 1×2 or 2×1 vector consisting of 2 complex numbers typically 
representing the state of a qubit.

# Examples
```julia-repl
julia> magnitude([0 1])
1
"""
function magnitude( statevector )
	magnitude = sqrt((statevector^2)*(conj(transpose(statevector)))^2)
	return magnitude
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

By calculating the eigenvectors of a spinning Hadamard matrix's measured state, 
we can reconstruct a more accurate and faithful H gate that satisifies H*H=I. 
In reality the SpinH is a spinning version of the originally defined Hadamard 
gate, defined as H = [1/√2 1/√2;1/√2 -1/√2]. This is the quantum gate which 
is a key piece in instigating linear combinations or superpositions of states.
"""
H = -eigvecs(SpinH/sqrt(2))

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
    Adjacency = [0 0 1 0;
                 0 0 0 1;
	         1 0 0 0;
	         0 1 0 0]

The Adjacency Matrix is simply an expanded Identity matrix which can be used 
for 2-qubit computations.

# Examples
```julia-repl
julia> Adjacency
[0 0 1 0;
 0 0 0 1;
 1 0 0 0;
 0 1 0 0]
```
"""
Adjacency = [0 0 1 0;
	   0 0 0 1;
	   1 0 0 0;
	   0 1 0 0]


