import subprocess
from enum import StrEnum, unique
from pathlib import Path

from pydantic import BaseModel, computed_field


@unique
class Platform(StrEnum):
    gaeac6 = "gaeac6"
    hera = "hera"
    orion_hercules = "orion-hercules"
    docker = "docker"


@unique
class EnvKey(StrEnum):
    default = "default"
    land_da_wflow = "land-da-wflow"


class CreateContext(BaseModel):
    env_key: EnvKey
    platform: Platform
    conda_env_version: str
    install_dir_override: Path | None

    @computed_field
    def install_dir(self) -> Path:
        install_dir_str = (
            str(self.install_dir_override)
            or PLATFORM_CONFIG[self.platform]["install_dir"]
        )
        return Path(install_dir_str).absolute().resolve(strict=True)

    @computed_field
    def conda_root(self) -> Path:
        options = (
            self.install_dir / "miniconda3" / "condabin",
            self.install_dir / "condabin",
        )
        for opt in options:
            try:
                return opt.absolute().resolve(strict=True).parent
            except FileNotFoundError:
                continue
        raise ValueError("Conda binary not found")

    @computed_field
    def conda_bin(self) -> Path:
        return (self.conda_root / "condabin" / "conda").absolute().resolve(strict=True)

    @computed_field
    def help_description(self) -> str:
        return ENV_CONFIG[self.env_key]["help_description"]

    @computed_field
    def module_name(self) -> str:
        return f"python-{self.env_key.value}"

    @computed_field
    def conda_env_name(self) -> str:
        ret = f"ufs-{self.env_key.value}"
        if self.conda_env_version != "":
            ret += f"-{self.conda_env_version}"
        return ret

    @computed_field
    def conda_env_def_dir(self) -> Path:
        return Path("environment").absolute().resolve(strict=True)

    @computed_field
    def modulefile_template(self) -> Path:
        return Path("template/python-3.lua.template").absolute().resolve(strict=True)

    @computed_field
    def modulefiles_install_dir(self) -> Path:
        return (self.install_dir / "modulefiles").absolute().resolve()

    @computed_field
    def prepend_path(self) -> Path:
        return (
            Path(self.conda_root / "envs" / self.conda_env_name / "bin")
            .absolute()
            .resolve()
        )

    @computed_field
    def modulefiles_env_install_dir(self) -> Path:
        dirname = f"python-{self.conda_env_name}"
        if self.conda_env_version != "":
            dirname += f"-{self.conda_env_version}"
        return (self.modulefiles_install_dir / dirname).absolute().resolve()


# Configuration dictionaries
PLATFORM_CONFIG = {
    Platform.gaeac6: {
        "install_dir": "/gpfs/f6/bil-fire8/world-shared/ufs-conda",
    },
    Platform.hera: {
        "install_dir": "/scratch3/NAGAPE/epic/ufs-conda",
    },
    Platform.orion_hercules: {
        "install_dir": "/work/noaa/epic/UFS-conda",
    },
    Platform.docker: {
        "install_dir": "/opt/conda",
    },
}

ENV_CONFIG = {
    EnvKey.default: {
        "help_description": "UFS default Python environment",
    },
    EnvKey.land_da_wflow: {
        "help_description": "Land DA workflow Python environment",
    },
}


def install_conda_env(ctx: CreateContext) -> None:
    # Create conda environment from yaml file
    env_file = ctx.conda_env_def_dir / f"environment-ufs-{ctx.env_key.value}.yaml"
    subprocess.check_call(
        [
            str(ctx.conda_bin),
            "env",
            "create",
            "-n",
            ctx.conda_env_name,
            "-f",
            str(env_file),
        ]
    )

    # Create modulefiles install directory
    ctx.modulefiles_env_install_dir.mkdir(parents=True, exist_ok=True)

    # Read template file
    template_content = ctx.modulefile_template.read_text()

    # Process template using string replacement
    processed_content = template_content.replace(
        "__HELP_DESCRIPTION__", ctx.help_description
    )
    processed_content = processed_content.replace(
        "__PREPEND_PATH__", str(ctx.prepend_path)
    )

    # Write processed template to destination
    output_file = ctx.modulefiles_env_install_dir / f"3.lua"
    output_file.write_text(processed_content)
