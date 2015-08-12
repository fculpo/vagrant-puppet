abstractit-pnp4nagios
====

####Table of Contents

0. [New stuff and bug fixes](#new)
1. [Overview - What is the pnp4nagios module?](#overview)
2. [Module Description - What does the module do?](#module-description)
3. [Setup - The basics of getting started with pnp4nagios](#setup)
4. [Usage - The parameters available for configuration](#usage)
5. [Implementation - An under-the-hood peek at what the module is doing](#implementation)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)
8. [Release Notes - Notes on the most recent updates to the module](#release-notes)

New stuff and bug fixes
-----------------------

I recently started a consulting company called Abstract IT Pty Ltd. I have transfered ownership of all my puppet modules to a new organisation on Puppet Forge called abstractit.
I am making one final release of my modules under rendhalver and abstractit to give you a chance to switch over to the new organisation.
I have also added a licence. All my modules will be licenced under Apache v2.

Overview
--------

Puppet module for managing pnp4nagios.

Module Description
------------------

Manages pnp4nagios install and configuration.

Setup
-----

**what pnp4nagios affects:**

* the npcd service
* config files for pnp4nagios

### Beginning with pnp4nagios

This will install pnp4nagios and set it up.

    include pnp4nagios

Usage
-----

Defaults for vars to set if you need them. Basically comes down to setting `$monotoring_type` and if you use my monitoring module thats already setup.
These are class params so use hiera or and ENC to set them up easily.

    $ensure = true
    $monitoring_type = hiera('monitoring::params::monitoring_type')
    $log_type = file
    $debug_lvl = 0

Implementation
--------------

Uses files based on templates to manage the pnp4nagios config files.
I have included some tricky logic to make sure the pnp4nagios service on Fedora 18 starts and stops properly.

Limitations
------------

There may be some. Don't hesitate to let me know if you find any.

Development
-----------

All development, testing and releasing is done by me at this stage.
If you wish to join in let me know.

Release Notes
-------------

**0.1.1**

Final release for rendhalver-nrpe.
First release as abstractit-nrpe.

**0.1.0**

Initial release
