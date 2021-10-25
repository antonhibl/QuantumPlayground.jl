# QuantumPlayground.jl
---
Author: Anton Hibl, E-mail: antonhibl11@gmail.com
---

<hr>

## Introduction
The Quantum Playground package provides tools to quickly perform and 
test computations involving quantum compuational gates and their 
respective basis states. These are represented using Julia's already 
present Linear Algebra Syntax in unison with some of the higher level 
mathematical functions in the LinearAlgebra, Calculus, and Statistics 
packages. The goal is to create an easy to run environment in which 
the user can perform and test out small scale quantum computations and 
gate combinations to better understand the underlying concepts which 
motivate quantum computation. You are able to easily combine compuations
utilizing different gates, basis states, rotations, measurements, and 
functions in an intuitive way. Due to the inclusion of Pluto the user 
may also use it inside of a notebook easily, which is useful for 
scientific documentation purposes.

<hr>

## Installation
The install process is undergoing construction as the package is still 
under construction, if you desire to test as is please clone the repository
and follow the steps below to test the package:

1. Ensure your shell is working *inside* of the directory you just cloned, 
QuantumPlayground.jl. Start julia in your terminal using the `julia` 
command.
2. type in `]activate .`
3. type `update` to ensure all packages are updated
4. type `build`
5. *delete one char to exit pkg mode* and type: 

`using QuantumPlayground; qp = QuantumPlayground; la = qp.LinearAlgebra` 

this set some shortcuts to *qp* and *la* so that these two short forms can
be used to access the package instead of the longer words 
*QuantumPlayground* and *LinearAlgebra* every time we use them.

The package is now ready to use, type `qp.` and hit tab to see the list 
of accessible tools.

<hr>

## API
Many of the standard gates for quantum computing are defined so that 
researchers may analyze and document how a quantum states, fields, and 
systems evolve over time. The following is the beginnings of this gate-set:

- The NOT Gate(*Pauli X*)
: `X = [0 1;1 0]`, Also called the negation, uses one input to generate 
one output. A NOT gate inverts the input.

- The Identity Gate
: `I = [1 0;0 1]`, This is simply a gate that returns the identity of the 
matrix to which it is applied; it is also known as the identity matrix.

- The Hadamard Gate
: `H = (1/√2)*[1 1;1 -1]`, A fundamental quantum gate which allows us to 
move away from the poles of the Bloch sphere and create a superposition 
of |0⟩ and |1⟩

- The Pauli Y Gate
: `Y = [0 -im;im 0]`, The Pauli Y gate is equivalent to Ry for the angle. 
It is equivalent to applying X and Z, up to a global phase factor.

- The Pauli Z Gate
: `Z = [1 0;0 -1]`, The Pauli Z gate acts as identity on the state and 
multiplies the sign of the state by -1. It therefore flips the and states.
In the **+/-** basis, it plays the same role as the NOT gate in the 
**|0⟩/|1⟩** basis.

- The RX Gate
: `RX = (1/√(2))*[1+im 1-im;1-im 1+im]`, The RX gate implements . On the 
Bloch sphere, this gate corresponds to rotating the qubit state around 
the x axis by the given angle.

- The Square Root of X Gate
: `SX = (1/√(2))*[1 -im;-im 1]`, This gate implements the square-root of X,
**√X**. Applying this gate twice in a row produces the standard Pauli-X 
gate. Like the Hadamard gate, creates an equal superposition state if the 
qubit is in the state , but with a different relative phase.

these can be used like so:

`QuantumPlayground.<gate name here>`
or
`qp.<gate name here>`
if aliased as mentioned above.

Common measurement operations can be performed in the same syntax albeit 
calling as a function with parameters. Some of the measuring operations 
are `modlength`, `magnitude`, and `phase`; `modlength` measures the *length
of a complex number* in the cartesian-complex plane by calculating 
the modulus of the complex numbers components. The `magnitude` operation
measures a given statevector's *magnitude* or *statevector length*; a state
vector is typically a 2x1 or 1x2 vector constistant of 2 complex numbers
which represent the qubit's state. The `phase` operation measures the 
*phase of a complex number*, in other words the angle which represents the
*time* on the polar plane; this is returned in terms of radians.

an example of a measurement involving an entire 4x4 matrix and the 
`modlength` operation would look like:

`qp.modlength.(qp.SX)`

Plotting in various forms can be done in a few ways using a few different
forms of complex numbers and accompanying differing representations to go
alongside the respective forms. What is meant by this is that for the
*cartesian form* of a complex number, *a+bi*, there is a cartesian plotting
function to coincide; for the *polar form* of a complex number, 
(*p, theta*), there is also a coinciding polar plotting function to plot 
using the polar representation of the number. A *bloch sphere*/*quaternion*
plotting function is in the works of being developed right now, stay
tuned.

Some more complex gates, such as ones which perform series of rotations and
phase modulations, are also available:

- The *S-Phase* Gate
: `S = [1 0;0 e^((im*pi)/2)]`, A quantum gate which can be utilized to 
initiate a phase of *pi/2* in the state matrix it is applied towards. This 
essentially evaluates the state at a time *pi/2*.

- The *T-Phase* Gate
: `T = [1 0;0 e^((im*pi)/4)]`, A quantum gate which can be utilized to 
initiate a phase of *pi/4* in the state matrix it is applied towards. This 
essentially evaluates the state at a time *pi/4*.

- The *Rotation* Gate
: `Rotation(matrix, theta)`, computes a rotation of the given matrix around
the x-axis by a degrees of an angle theta.

- The *U2-Rotational* Gate
: `U2_Rotation(matrix, theta, alpha)`, computes 2 consecutive rotations of 
a matrix; first around the x-axis according to degrees theta, then around 
the y-axis according to degrees alpha.

- The *U3-Rotational* Gate
: `U3_Rotation(matrix, theta, alpha, beta)`, computes 3 consecutive 
rotations of a matrix around first the x axis according to degrees theta,
then the y-axis according to degrees alpha, then finally around the z-axis
according to degrees beta.

- The SZ Gate
: `SZ = S*S`, A quantum gate which performs a *half-turn* of what the usual
Z-gate performs.

- The QZ Gate
: `QZ = T*T*T*T`, A quantum gate which performs a *quarter-turn* of what 
the usual Z-Gate performs.

- The *Spinning Hadamard* Gate
: `SpinH = ((Rotation([1 1;0 0], pi))*H)`, The *spinning* hadamard gate
represents a "spinning" superposition, wherein the randomness is more
inherent than a typical H gate as it could now have rotated either 
direction.

- The *Controlled NOT* Gate
: `CX = [1 0 0 0;0 1 0 0;0 0 0 1;0 0 1 0]`, the CX gate *entangles* 2 
qubits, affecting the target qubit only if the control qubit is active or
*on*; the target operation is a *pauli-X* Gate

- The *Controlled-Y* Gate
: `CY = [1 0 0 0;0 1 0 0;0 0 0 -im;0 0 im 0]`, the CY gate entangles 2
qubits, affecting the target qubit only if the control qubit is active or
*on*; the Target operation is a *pauli-Y Gate*.

- The *Controlled-Z* Gate
: `CZ = [1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 -1]`, The CZ gate entangles 2
qubits, affecting the target qubit only if the control qubit is active or
*on*; the target operation is a *pauli-Z Gate*.

- The *Toffoli* Gate
: `Toffoli = 
[1 0 0 0 0 0;0 1 0 0 0 0;0 0 1 0 0 0;0 0 0 1 0 0;0 0 0 0 0 1;0 0 0 0 1 0]`,
 The toffoli gate acts as an extension of the CX gate, now having 2 
control qubits instead of just 1. 

- The *Fredkin* Gate
: `Fredkin =
[1 0 0 0 0 0;0 1 0 0 0 0;0 0 1 0 0 0;0 0 0 01 0;0 0 0 1 0 0;0 0 0 0 0 1]`,
 The Fredkin Gate acts similarly to the Toffoli gate, having 2 control 
qubits, the main difference being the NOT acts between the 4th and 5th 
qubits.

Operations such as calculating the Hermitian can be performed too:

`qp.Hermitian(qp.H)`

this computes the hermitian(conjugate transpose) of a matrix, this should
return the same matrix if it is unitary.
<hr>

## PhotonPlayGround.jl
PhotonPlayground.jl serves as a sub-package to QuantumPlayground.jl where 
the user can explore the differences between classical qubit modeled 
quantum calculations and photonic continuous-variable modeled quantum 
calculations in terms of their matrix components and solving equations
involving different quantum fields or systems.
