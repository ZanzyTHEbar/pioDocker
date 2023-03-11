# Platformio in a Docker container

This is a custom Docker image for [Platformio](https://platformio.org/).

## Usage

```yaml
- name: Run Docker container
  uses: addnab/docker-run-action@v3
  with:
    image: pioDocker:latest
    options: -v ${{ github.workspace }}/ESP:/workspace
    run: |
      export OPENIRIS_CI_BUILD=1
      mkdir build 
      mkdir build/${{ matrix.target_name }}${{ matrix.target_build_type }}
      echo "::group::pio run"
      pio run --environment ${{ matrix.target_name }}${{ matrix.target_build_type }}
      echo "::endgroup::"
      unzip -l './build/${{ matrix.target_name }}${{ matrix.target_build_type }}/*.zip'
- name: Verify build
  run: |
    ls -la build/${{ matrix.target_name }}${{ matrix.target_build_type }}
```

## Keep Configuration

If you want to keep the downloaded packages, etc. you can save the PlatformIO configuration outside of the container. You can do this by adding the following line to the docker run call:

```bash
-v `$HOME/.platformio`:/.platformio \
```

Alternatively you could use a data volume container to save the PlatformIO configuration. First create the data volume container

```bash
docker run --name vc_platformio ZanzyTHEbar/vc_pioDocker:latest
```

Then add the following line to the docker run call:

```bash
--volumes-from=vc_platformio \
```
