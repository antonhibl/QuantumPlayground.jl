import LinearAlgebra
import Calculus
import Statistics

using LinearAlgebra
using Calculus
using Statistics

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
"""
S = [1 0;0 e^((im*π)/2)]

# The Quantum T Phase Gate
"""
"""
T = [1 0;0 e^((im*π)/4)]

# The Square Root of X Gate
"""
    SX = (1/√(2))*[1+im 1-im;1-im 1+im]

The Square Root of NOT gate acts the same as the Hadamard in essence, sometimes more cleanly,
carrying less noise.

# Examples
```julia-repl
julia> qp.SX
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
julia> qp.RX
[0.707107+0.0im 0.0-0.707107im;
 0.0-0.707107im 0.707107+0.0im]
```
"""
RX = (1/√(2))*[1 -im;-im 1]

# The RZ Gate
"""
    RZ = [e^(-im*(pi/2)) 0;0 e^(im*(pi/2))]

The Quantum RZ gate.

# Examples
```julia-repl
julia> qp.RZ
[6.12323e-17-1.0im 0.0+0.0im;
 0.0+0.0im 6.12323e-17+1.0im]
```
"""
RZ = [e^(-im*(pi/2)) 0;0 e^(im*(pi/2))]

# The "Square Root" of  Z Gate
"""
    SZ = S*S

The Square Root of Z gate acts as a half turn to the regular Z about the Z axis.

# Examples
```julia-repl
julia> qp.SZ
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
julia> qp.QZ
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
julia> qp.P
[1.0+0.0im 0.0+0.0im;
 0.0+0.0im -1.0+1.22465e-16im]
```
"""
P = [1 0;0 e^(im*pi)]

# The Classical AND Gate
"""
    AND = [1 1 1 0;0 0 0 1]

The classical AND gate for computing wih bits of information.

# Examples
```julia-repl
julia> qp.AND
[1 1 1 0;
 0 0 0 1]
```
"""
AND = [1 1 1 0;0 0 0 1]

# The Classical NAND Gate
"""
    NAND = [0 0 0 1;1 1 1 0]

The classical NAND gate for computing with bits of information.

# Examples
```julia-repl
julia> qp.NAND
[0 0 0 1;
 1 1 1 0]
```
"""
NAND = [0 0 0 1;1 1 1 0]

# The Classical OR Gate
"""
    OR = [1 0 0 0;0 1 1 1]

The classical OR gate for computing with bits of information.

# Examples
```julia-repl
julia> qp.OR
[1 0 0 0;
 0 1 1 1]
```
"""
OR = [1 0 0 0;0 1 1 1]

# The Classical NOR Gate
"""
    NOR = [0 1 1 1;1 0 0 0]

The classical NOR gate for computing with bits of information.

# Examples
```julia-repl
julia> qp.NOR
[0 1 1 1;
 1 0 0 0]
```
"""
NOR = [0 1 1 1;1 0 0 0]

# The "Imaginary Identity" gate
"""
    II = qp.I+(qp.I*qp.Y*qp.X)

An I gate with a very basic imaginary component along its Echelon Form Diagonal.

# Examples
```julia-repl
julia> qp.II
[1-1im 0+0im;
 0+0im 1+1im]
```

```julia-repl
julia> qp.II*qp.II
[0-2im  0+0im;
 0+0im  0+2im]
 ```
"""
II = qp.I+(qp.I*qp.Y*qp.X)

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
