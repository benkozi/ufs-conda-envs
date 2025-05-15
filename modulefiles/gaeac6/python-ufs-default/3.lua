help([[
  Set environment variables for ufs-conda Python environment
]])

-- Make sure another version of the same package is not already loaded
conflict("python-ufs-default")

-- Set environment variables
prepend_path("PATH","/gpfs/f6/bil-fire8/world-shared/ufs-conda/miniconda3/envs/ufs-default/bin")
