from typing import Annotated

import typer

from ufs_conda.core import EnvKey, Platform, CreateContext, install_conda_env

app = typer.Typer()


@app.command()
def create(
    platform: Annotated[Platform, typer.Option("--platform", help="Target platform")],
    env_key: Annotated[
        EnvKey | None,
        typer.Option(
            "--env-key", help="Conda environment key. Required if --all is not set"
        ),
    ] = None,
    do_all: Annotated[
        bool,
        typer.Option("--all", help="Install all environments. Overrides --env-key"),
    ] = False,
    conda_env_version: Annotated[
        str,
        typer.Option(
            "--module-version",
            help="Conda environment version which is also applied to the module install directory.",
        ),
    ] = "",
):
    if do_all:
        env_keys = tuple(EnvKey)
    else:
        env_keys = (env_key,)
    contexts = [
        CreateContext(
            env_key=env_key, platform=platform, conda_env_version=conda_env_version
        )
        for env_key in env_keys
    ]
    for ctx in contexts:
        typer.echo(f"{ctx=}")
        install_conda_env(ctx)


@app.command()
def remove():
    raise NotImplementedError


if __name__ == "__main__":
    app()
