using Test, MIPLIB, NLPModelsIpopt

m = MIPLIB.miplib2010("markshare_5_0.mps.gz")
solution = ipopt(m)

@testset "MIPLIB markshare_5_0.mps.gz" begin
    @test solution.status == :first_order
    @test isapprox(solution.objective, 0.; atol=1e-5)
end
