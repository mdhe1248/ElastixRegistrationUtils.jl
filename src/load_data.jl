""" load points from elastix outputpoint file"""
function load_points(fn)
  outputpts = readdlm(fn, '\t')
  strs = split.(outputpts[:,5])
  pts  = [(parse(Int, pt[5]), parse(Int, pt[6]), parse(Int, pt[7])) for pt in strs]
  return(pts)
end

""" open annotation from JSON file that is stored in clearmap folder.
This may be updated into the newer version from allen brain atlas.
"""
function load_annotation_lbls(jsonfn, annotationImg)
  d = []
  open(jsonfn) do io
    push!(d, JSON.parse(io));
  end
  ## prepare data for DataFrame
  subbrain_ids = Int.(unique(annotationImg))
  subbrain_labels = map(x -> retrieve(d[1], "name", "id", x), subbrain_ids)
  parent_ids = map(x -> retrieve(d[1],"parent_structure_id", "id", x), subbrain_ids)
  return(d, subbrain_ids, subbrain_labels, parent_ids)
end
