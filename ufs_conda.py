#!/usr/bin/env python3

import typer
from typing_extensions import Annotated
from enum import Enum

app = typer.Typer()

class Platform(str, Enum):
    gaeac6 = "gaeac6"
    hera = "hera"
    docker = "docker"

class EnvKey(str, Enum):
    default = "default"
    land_da_wflow = "land-da-wflow"

@app.command()
def create(
    env_key: Annotated[EnvKey, typer.Option("--env-key", help="Conda environment type")] = EnvKey.default,
    platform: Annotated[Platform, typer.Option("--platform", help="Target platform")] = Platform.docker
):
    """Create a UFS conda environment."""
    typer.echo(f"Creating environment: {env_key.value} on platform: {platform.value}")
    
    # Set platform-specific variables
    if platform == Platform.gaeac6:
        install_dir = "/gpfs/f6/bil-fire8/world-shared/ufs-conda"
        conda_bin = f"{install_dir}/miniconda3/condabin/conda"
    elif platform == Platform.hera:
        install_dir = "/scratch3/NAGAPE/epic/ufs-conda"
        conda_bin = f"{install_dir}/miniconda3/condabin/conda"
    elif platform == Platform.docker:
        install_dir = "/opt/ufs-conda"
        conda_bin = "conda"
    
    # Set environment-specific variables
    if env_key == EnvKey.default:
        help_description = "UFS default Python environment"
        module_name = "python-ufs-default"
    elif env_key == EnvKey.land_da_wflow:
        help_description = "Land DA workflow Python environment"
        module_name = "python-ufs-land-da-wflow"
    
    # Derived variables
    conda_env_name = f"ufs-{env_key.value}"
    conda_env_def_dir = "../environment"
    modulefiles = f"../modulefiles/{platform.value}"
    modulefiles_install_dir = f"{install_dir}/modulefiles"
    
    typer.echo(f"Install directory: {install_dir}")
    typer.echo(f"Conda binary: {conda_bin}")
    typer.echo(f"Environment name: {conda_env_name}")
    typer.echo(f"Module name: {module_name}")

if __name__ == "__main__":
    app()