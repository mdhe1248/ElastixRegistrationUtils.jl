using DelimitedFiles

""" load points from elastix outputpoint file"""
function load_points(fn)
  outputpts = readdlm(fn, '\t')
  strs = split.(outputpts[:,5])
  pts  = [(parse(Int, pt[5]), parse(Int, pt[6]), parse(Int, pt[7])) for pt in strs]
  return(pts)
end
