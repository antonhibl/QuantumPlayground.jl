import QuantumPlayground
import LinearAlgebra
import Test
using Test
using QuantumPlayground
using LinearAlgebra

@test QuantumPlayground.X * QuantumPlayground.X == QuantumPlayground.I

@test LinearAlgebra.diag(QuantumPlayground.H*QuantumPlayground.H)

@test QuantumPlayground.UB(pi/2) * QuantumPlayground.UB(-pi/2) == QuantumPlayground.I

@test QuantumPlayground.Rotation(QuantumPlayground.UB(pi/2), 2pi) == [1.0+0.0im -1.0+2.44929e-16im;1.0+2.44929e-16im 1.0+0.0im]

qp = QuantumPlayground

@test QuantumPlayground.phase(QuantumPlayground.â)

@test ℯ^(qp.phase(qp.â)*im)==cos(qp.phase(qp.â))+im*sin(qp.phase(qp.â))
