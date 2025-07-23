#!/usr/bin/env python3

import subprocess
from pathlib import Path
from ufs_conda import CreateContext


def install_conda(ctx: CreateContext) -> None:
    """Install conda based on the CreateContext configuration.
    
    Equivalent to ./script/install-conda.sh but using Python.
    """
    # Check if install directory already exists
    if ctx.install_dir.exists():
        raise FileExistsError(f"Error: {ctx.install_dir} exists. Remove the install directory before proceeding")
    
    # Download miniconda installer
    installer = "Miniconda3-latest-Linux-x86_64.sh"
    subprocess.check_call([
        "wget", 
        f"https://repo.anaconda.com/miniconda/{installer}"
    ])
    
    # Install miniconda
    subprocess.check_call([
        "bash", 
        f"./{installer}", 
        "-bfp", 
        str(ctx.install_dir / "miniconda3")
    ])
    
    # Remove installer
    subprocess.check_call(["rm", installer])