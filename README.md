# ELK Detection Lab

An ELK environment loaded with the following datasets:

* [Mordor](https://github.com/hunters-forge/mordor) from Roberto Rodriguez [@Cyb3rWard0g](https://twitter.com/Cyb3rWard0g) and Jose Luis Rodriguez [@Cyb3rPandaH](https://twitter.com/Cyb3rPandaH)
* [EVTX-ATTACK-SAMPLES](https://github.com/sbousseaden/EVTX-ATTACK-SAMPLES) from Samir Bousseaden [SBousseaden](https://twitter.com/SBousseaden)

Thanks to the authors of the datasets as well as:

* [Shinta Nakano](https://sumeshi.github.io/) for [evtx2es](https://github.com/sumeshi/evtx2es) that I used to import the EVTX-ATTACK-SAMPLES dataset.

## Prerequisites

You need at least:

* a working Docker CE installation with docker-compose
* 4 GB free disk space
* 2 GB RAM for a reasonable Elasticsearch performance

## Installation

Run this command to start the ELK environment and import the datasets:

```
./elk-detection-lab.sh init
```

After this was run once, the ELK environment can be started without importing the data again:

```
./elk-detection-lab.sh run
```

## Usage

Open the [local Kibana](https://localhost:5601) in your browser. The data starts in 2019 and the
field naming follows the ECS scheme and Winlogbeat 7 conventions.
