#!/usr/bin/env python3

from enum import StrEnum, unique
from pathlib import Path

import typer
from pydantic import BaseModel, computed_field
from typing_extensions import Annotated

app = typer.Typer()

@unique
class Platform(StrEnum):
    gaeac6 = "gaeac6"
    hera = "hera"
    docker = "docker"

@unique
class EnvKey(StrEnum):
    default = "default"
    land_da_wflow = "land-da-wflow"

class CreateContext(BaseModel):
    env_key: EnvKey
    platform: Platform
    
    @computed_field
    def install_dir(self) -> Path:
        return Path(PLATFORM_CONFIG[self.platform]["install_dir"]).absolute().resolve()
    
    @computed_field
    def conda_bin(self) -> Path:
        return Path(PLATFORM_CONFIG[self.platform]["conda_bin"]).absolute().resolve()
    
    @computed_field
    def help_description(self) -> str:
        return ENV_CONFIG[self.env_key]["help_description"]
    
    @computed_field
    def module_name(self) -> str:
        return ENV_CONFIG[self.env_key]["module_name"]
    
    @computed_field
    def conda_env_name(self) -> str:
        return f"ufs-{self.env_key.value}"
    
    @computed_field
    def conda_env_def_dir(self) -> Path:
        return Path("../environment").absolute().resolve()
    
    @computed_field
    def modulefiles_install_dir(self) -> Path:
        return (self.install_dir / "modulefiles").absolute().resolve()

# Configuration dictionaries
PLATFORM_CONFIG = {
    Platform.gaeac6: {
        "install_dir": "/gpfs/f6/bil-fire8/world-shared/ufs-conda",
    },
    Platform.hera: {
        "install_dir": "/scratch3/NAGAPE/epic/ufs-conda",
    },
    Platform.docker: {
        "install_dir": "/opt/ufs-conda",
        "conda_bin": "conda"
    }
}

ENV_CONFIG = {
    EnvKey.default: {
        "help_description": "UFS default Python environment",
        "module_name": "python-ufs-default"
    },
    EnvKey.land_da_wflow: {
        "help_description": "Land DA workflow Python environment",
        "module_name": "python-ufs-land-da-wflow"
    }
}

@app.command()
def create(
    env_key: Annotated[EnvKey, typer.Option("--env-key", help="Conda environment type")] = EnvKey.default,
    platform: Annotated[Platform, typer.Option("--platform", help="Target platform")] = Platform.docker
):
    """Create a UFS conda environment."""
    ctx = CreateContext(env_key=env_key, platform=platform)
    typer.echo(f"{ctx=}")

if __name__ == "__main__":
    app()
