module MIPLIB

using Artifacts, QuadraticModels, GZip, QPSReader
    
const miplib2010_path = joinpath(artifact"MIPLIB2010", "miplib2010")

"""
    import_mps(filename::String)

Import instance from the file whose path is specified in `filename`.

The function parses the file's extension to adapt the import. If the extension
is `.mps`, `.sif` or `.SIF`, it directly reads the file. If the extension
is `.gz` or `.bz2`, it decompresses the file using gzip or bzip2, respectively.

"""
function import_mps(filename)
    ext = match(r"(.*)\.(.*)", filename).captures[2]
    data = if ext ∈ ("mps", "sif", "SIF")
        readqps(filename)
    elseif ext == "gz"
        GZip.open(filename, "r") do gz
            readqps(gz)
        end
    elseif ext == "bz2"
        open(filename, "r") do io
            stream = Bzip2DecompressorStream(io)
            readqps(stream)
        end
    end
    return data
end

"""
        miplib2010_data(case)
Load the data of a MIPLIB2010 instance.
"""
function miplib2010_data(case)
    qpdat = import_mps(joinpath(miplib2010_path, case))
end

"""
        miplib2010(case)
Create a `QuadraticModel` from a MIPLIB2010 instance.
"""
function miplib2010(case)
    qpdat = miplib2010_data(case)
    QuadraticModel(qpdat)    
end

export miplib2010_data, miplib2010

end # module MIPLIB
