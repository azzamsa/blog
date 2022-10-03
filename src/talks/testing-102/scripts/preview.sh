#!/usr/bin/env bash

asciidoctor-web-pdf presentation.adoc --template-require ./template.js -w --preview
