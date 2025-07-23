#!/usr/bin/env python3

import subprocess
from pathlib import Path
from ufs_conda import CreateContext


def install_conda_env(ctx: CreateContext) -> None:
    """Install conda environment and modulefiles based on the CreateContext configuration.
    
    Equivalent to ./script/install-env.sh and ./script/install-conda-env.sh but using Python.
    """
    # Create conda environment from yaml file
    env_file = ctx.conda_env_def_dir / f"environment-ufs-{ctx.env_key.value}.yaml"
    subprocess.check_call([
        str(ctx.conda_bin),
        "env", "create",
        "-f", str(env_file)
    ])
    
    # Create modulefiles directory and process templates
    module_dst = ctx.install_dir / "modulefiles" / f"python-{ctx.conda_env_name}"
    module_dst.mkdir(parents=True, exist_ok=True)
    
    # Create modulefiles install directory
    ctx.modulefiles_install_dir.mkdir(parents=True, exist_ok=True)
    
    # Read template file
    template_file = Path("../modulefiles/python-3.lua.template")
    template_content = template_file.read_text()
    
    # Process template using string replacement
    processed_content = template_content.replace("__HELP_DESCRIPTION__", ctx.help_description)
    processed_content = processed_content.replace("__INSTALL_DIR__", str(ctx.install_dir))
    processed_content = processed_content.replace("__CONDA_ENV_NAME__", ctx.conda_env_name)
    
    # Write processed template to destination
    output_file = module_dst / "3.lua"
    output_file.write_text(processed_content)