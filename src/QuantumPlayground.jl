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
e = MathConstants.e # Euler's Constant

# Defining orthonormal computational basis states
zero_state = [1;0]
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

# Functions and Rotations
function Rotation(matrix, Θ)
    [cos(Θ) -sin(Θ);sin(Θ) cos(Θ)]+matrix
end

function U2_Rotation(matrix, θ, α)
	((1/√(2))*[1 -e^(im*θ);e^(im*α) e^(im*(α+θ))])+matrix
end

function U3_Rotation(matrix, θ, α, β)
        [cos(θ/2) (-e^(im*α))*sin(θ/2);(e^(im*β)*sin(θ/2)) (e^(im*(β+α))*cos(θ/2))]+matrix
end

function Hermitian(matrix) 
	conj(transpose(matrix))
end

# Rotating Hadamard Matrix
AH = ((Rotation([1 1;0 0], π))*H)

# Redefine a more accurate H with this new quantum gate
H = -eigvecs(AH/sqrt(2))   # Satisfies HH=I

# An entangled bit matrix of both probabilities and spins being in superpositions
XH = eigvals(((([0 1;1 0]*RX)/sqrt(2))*SX)/sqrt(2))

# greet the user
greet() = print("Welcome to your Quantum Playground!")

end # module
