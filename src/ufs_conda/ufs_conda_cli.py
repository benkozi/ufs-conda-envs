from typing import Annotated

import typer

from ufs_conda.core import EnvKey, Platform, CreateContext, install_conda_env

app = typer.Typer()

@app.command()
def create(
    env_key: Annotated[EnvKey, typer.Option("--env-key", help="Conda environment type")] = EnvKey.default,
    platform: Annotated[Platform, typer.Option("--platform", help="Target platform")] = Platform.docker
):
    ctx = CreateContext(env_key=env_key, platform=platform)
    typer.echo(f"{ctx=}")
    install_conda_env(ctx)

@app.command()
def remove():
    raise NotImplementedError


if __name__ == "__main__":
    app()
