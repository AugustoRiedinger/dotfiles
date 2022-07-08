function pv
  if test -f foam.foam
    paraview foam.foam
  else if test -f open.foam
    paraview open.foam
  else
    echo Neither foam.foam nor open.foam exist
  end
end
