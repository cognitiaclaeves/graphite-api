
Forked from brutasse/graphite-api.

Part of a project to buid a grafana stack with single-use containers.

Single use containers make it easier to switch out the components:

 - carbon-c-relay instead of carbon-relay
 - interesting statsd alternatives:
 -- statsite ( C implementation )
 -- statsdaemon ( go )
 -- gostatsd ( go )

Build:

     sudo docker build -t brutasse-graphite-api:2-dbg .



To start the standard grafana container:

     sudo docker run -it --name grafana --rm -p 3000:3000 --link graphite:graphite grafana/grafana

(All other associated containers include run scripts.)

====

Graphite-API
============

.. image:: https://travis-ci.org/brutasse/graphite-api.svg?branch=master
   :alt: Build Status
   :target: https://travis-ci.org/brutasse/graphite-api

.. image:: https://img.shields.io/coveralls/brutasse/graphite-api/master.svg
   :alt: Coverage Status
   :target: https://coveralls.io/r/brutasse/graphite-api?branch=master

Graphite-web, without the interface. Just the rendering HTTP API.

This is a minimalistic API server that replicates the behavior of
Graphite-web. I removed everything I could and simplified as much code as
possible while keeping the basic functionality.

Implemented API calls:

* ``/metrics/find``
* ``/metrics/expand``
* ``/render``

No-ops:

* ``/dashboard/find``
* ``/dashboard/load/<name>``
* ``/events/get_data``

Difference from graphite-web
----------------------------

* Stateless. No need for a database.
* No Pickle rendering.
* No remote rendering.
* JSON data in request bodies is supported, additionally to form data and
  querystring parameters.
* Ceres integration will be as an external backend.
* Compatibility with python 2 and 3.
* Easy to install and configure.

Goals
-----

* Solid codebase. Strict flake8 compatibility, good test coverage.
* Ease of installation/use/configuration.
* Compatibility with the original Graphite-web API and 3rd-party dashboards.

Non-goals
---------

* Support for very old Python versions (Python 2.6 is still supported but
  maybe not for long).
* Built-in support for every metric storage system in the world. Whisper is
  included by default, other storages are added via 3rd-party backends.

Documentation
-------------

`On readthedocs.org`_ or in the ``docs/`` directory.

.. _On readthedocs.org: https://graphite-api.readthedocs.io/en/latest/

Hacking
-------

`Tox`_ is used to run the tests for all supported environments. To get started
from a fresh clone of the repository:

.. code-block:: bash

    pip install tox
    tox

.. _Tox: https://testrun.org/tox/
