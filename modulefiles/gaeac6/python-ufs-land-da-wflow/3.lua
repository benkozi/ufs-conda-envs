help([[
  Set environment variables for Land DA workflow Python environment
]])

-- Make sure another version of the same package is not already loaded
conflict("land_da")

-- Set environment variables
prepend_path("PATH","/gpfs/f6/bil-fire8/world-shared/ufs-conda/miniconda3/envs/land_da/bin")
