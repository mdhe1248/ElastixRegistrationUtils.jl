"""
`tform0` is transformation after image registration by `elastix_run`.
`TransformParameters.0.txt` will be generated in `outdir`.
"""
function elastix_inverse_tform(fixed, tform0, param_affine, param_bspline, outdir)
  isdir(outdir) ? nothing : mkdir(outdir)
  run(`elastix -f $fixed -m $fixed -t0 $tform0 -p $param_affine -p $param_bspline -out $outdir`)
  inputfn = outdir*"TransformParameters.0.txt"
  modify_first_txt(inputfn, "InitialTransformParametersFileName","(InitialTransformParametersFileName \"NoInitialTransform\")\n")
end

function modify_first_txt(inputfn, str, replace_str)
  mv(inputfn, inputfn*"_org", force = true)
  open(inputfn*"_org") do file
    f2 = open(inputfn, "w")
    for l in eachline(file)
      if contains(l, str)
##        write(f2, "//"*l*"\n")
        write(f2, replace_str)
      else
        write(f2, l*"\n")
      end
    end
    close(f2)
  end
end
