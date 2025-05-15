help([[
  Set environment variables for ufs-conda Python environment)
]])

-- Make sure another version of the same package is not already loaded
conflict("ufs-python")

-- Set environment variables
prepend_path("PATH","")
