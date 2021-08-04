import QuantumPlayground
import LinearAlgebra
import Test
using Test
using QuantumPlayground
using LinearAlgebra

@test QuantumPlayground.X * QuantumPlayground.X == QuantumPlayground.I

@test LinearAlgebra.isdiag(QuantumPlayground.H*QuantumPlayground.H)

@test QuantumPlayground.UB(pi/2) * QuantumPlayground.UB(-pi/2) == QuantumPlayground.I
