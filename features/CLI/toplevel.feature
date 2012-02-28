Feature: Toplevel application
  As a user
  In order to have an m3u playlist file
  I run a converter application

  Background: xspf sample
    Given a file named "1.xspf" with:
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <playlist version="1" xmlns="http://xspf.org/ns/0/" xmlns:vlc="http://www.videolan.org/vlc/playlist/ns/0/">
      <title>Все каналы ТВ и FM</title>
      <trackList>
        <track>
          <location>http://1tv.tv.lan</location>
          <title>TV : Первый канал</title>
          <image>http://tv.lan/img/1tv.jpg</image>
        </track>
      </trackList>
    </playlist>
    """

  Scenario: running the app without options
    When I run `xspf2m3u`
    Then the output should contain "No value"

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
    Then the output should match /<partial_output>/
    And  a file named "<file>" should exist
    And  a file named "<no_file>" should not exist
    Examples:
      | task    | from            | to            | file          | no_file           | partial_output      |
      |         |                 | -o 1.m3u      | 1.xspf        | 1.m3u             | No value            |
      |         | -i 1.xspf       |               | 1.xspf        | 1.m3u             | No value            |
      | convert |                 | -o 1.m3u      | 1.xspf        | 1.m3u             | No value            |
      | convert | -i 1.xspf       |               | 1.xspf        | 1.m3u             | No value            |
      |         | -i 1.xspf       | -o 1.m3u      | 1.m3u         |                   | create +1.m3u       |
      | convert | -i 1.xspf       | -o 1.m3u      | 1.m3u         |                   | create +1.m3u       |

  Scenario: conversion should be correct
    When I run `xspf2m3u -i 1.xspf -o 1.m3u`
    Then the file "1.m3u" should contain exactly:
    """
    #EXTM3U
    #EXTINF:-1,TV : Первый канал
    http://1tv.tv.lan
    """
