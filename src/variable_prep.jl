function prepare_directories(wd)
  moving2ref_dir= wd*"moving2ref/"
  transformed_roi_coordinates_dir = wd*"transformed_roi_coordinates/"
  results_dir = wd*"results/"
  roi_dir = wd*"roi_coordinates/"
  return(moving2ref_dir, transformed_roi_coordinates_dir, results_dir, roi_dir)
end

function prepare_filenames(wd, datdir, prefix)
  moving2ref_dir, transformed_roi_coordinates_dir, results_dir = prepare_directories(wd)
  autofn = datdir*prefix*"reimgauto.nrrd" #Maybe loading the original and using `resample` is better for the whole image analysis.
  fosfn = datdir*prefix*"reimgfos.nrrd" #Maybe loading the original and using `resample` is better.
  pointFileName = roi_dir*prefix*"roi_coordinates.txt"
  cfos_counts_fn = results_dir*prefix*"cfos_cell_counts.csv"
  return(autofn, fosfn, pointFileName, cfos_counts_fn)
end


