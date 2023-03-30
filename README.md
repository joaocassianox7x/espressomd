# espressomd

## Building the docker :
A docker to espressoMD package 

First, build the image with :

```bash
docker build -t espressomd .
```

Before run the docker image, let's create a volume to share data between docker and your pc kernel

```bash
mkdir data
```

Now, to run, just 

```bash
docker run -it -p 8888:8888 -v ./data:~/data espressomd
```

Fine. Now, it's working!

## Using espressomd

```python
import espressomd

system = espressomd.System(box=[10., 10., 10.], particle_types=['A'])

for i in range(100):
    system.create_particle([0., 0., 0.], type=0)

potential = espressomd.interaction.LennardJones(
    epsilon=1.0,
    sigma=1.0,
    cutoff=2.5,
    shift='auto'
)

system.set_interactions(potential)

integrator = espressomd.integrator.VelocityVerlet(time_step=0.1)

system.integrator = integrator

system.thermostat.set_langevin(kT=1.0, gamma=1.0)

system.time = 0

for i in range(100):
    system.integrator.run(100)
    print(system.time, system.energy)
```
