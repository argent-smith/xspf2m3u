Feature: Toplevel application
  As a user
  In order to have an m3u playlist file
  I run a converter application

  Background: xspf sample
    Given a file named "1.xspf" with:
    """
    """

  Scenario: running the app without options
    When I run `xspf2m3u`
    Then the output should contain "Usage"

  Scenario Outline: help display
    When I run `xspf2m3u <h_key>`
    Then the output should contain "Usage"
    Examples:
      | h_key         |
      | help          |
      | -h            |
      | --help        |

  Scenario Outline: displaying the version number
    When I run `xspf2m3u <v_key>`
    Then the version display should be correct
    Examples:
      | v_key       |
      | version     |
      | -V          |
      | --version   |

  Scenario Outline: conversion run variants
    When I run `xspf2m3u <task> <from> <to>`
    Then the output should contain "<partial_output>"
    And  a file named "<file>" should exist
    And  a file named "<no_file>" should not exist
    Examples:
      | task    | from            | to            | file          | no_file           | partial_output      |
      |         |                 | -o 1.m3u      | 1.xspf        | 1.m3u             | No value            |
      |         | -i 1.xspf       |               | 1.xspf        | 1.m3u             | No value            |
      | convert |                 | -o 1.m3u      | 1.xspf        | 1.m3u             | No value            |
      | convert | -i 1.xspf       |               | 1.xspf        | 1.m3u             | No value            |
      |         | -i 1.xspf       | -o 1.m3u      | 1.m3u         |                   | converting          |
      | convert | -i 1.xspf       | -o 1.m3u      | 1.m3u         |                   | converting          |
