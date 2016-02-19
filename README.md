# rancher-api-control
## Summary
This container is specifically built for configuring the `graphite.host` value within a Rancher server instance. It reliss upon the labels below to give it authorisation to the Rancher API.
```
      io.rancher.container.create_agent: true
      io.rancher.container.agent.role: environment
```

## Usage

The primary use for this container is part of the rancher community catalog item 'Prometheus'. This container forms part of that templated deployemnt.
If you wish to run this container outside of this then below is an example compose file:
```
rancher-api-setup:
    tty: true
    image: rucknar/rancher-api-control
    labels:
      io.rancher.container.start_once: true
      io.rancher.container.create_agent: true
      io.rancher.container.agent.role: environment
```
