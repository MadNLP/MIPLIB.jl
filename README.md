# MIPLIB.jl

[![CI](https://github.com/MadNLP/MIPLIB.jl/actions/workflows/ci.yml/badge.svg)](https://github.com/MadNLP/MIPLIB.jl/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/MadNLP/MIPLIB.jl/graph/badge.svg?token=BSse43tJoy)](https://codecov.io/gh/MadNLP/MIPLIB.jl)

This repository contains a Julia interface to the [MIPLIB benchmark library](https://miplib2010.zib.de) for mixed-integer programming (MIP) problems. It allows users to easily access and utilize MIPLIB instances within their Julia projects. Currently, the interface only supports [MIPLIB 2010 instances](https://miplib2010.zib.de) and formulate them as a [QuadraticModel](https://github.com/JuliaSmoothOptimizers/QuadraticModels.jl).
