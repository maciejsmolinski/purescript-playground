# PureScript Playground

[PureScript](http://www.purescript.org/) playground repository is supposed to consist of tiny projects that are easy to scan and reason about so that everybody can learn the language quickly by example.

Demos: http://purescript-playground.surge.sh/

## Prerequisites

* Install [Node.js](https://nodejs.org/en/) following instructions on the website
* Install [PureScript](http://www.purescript.org/) `npm install -g purescript@0.11.6`
* Install [pulp](https://github.com/purescript-contrib/pulp) `npm install -g pulp@11.0.0`
* Install [bower](https://github.com/bower/bower) `npm install -g bower`

## Projects

### Simple Todo List

* Demo: http://purescript-playground.surge.sh/todo
* Dependencies:
  * [Halogen](https://github.com/slamdata/purescript-halogen)
* Installation:
  * Clone the repository with `git clone https://github.com/maciejsmolinski/purescript-playground.git && cd purescript-playground/todo`
  * Install all dependencies with `bower install`
  * Build the project: `npm run build`
    * To watch for filechanges and re-build run: `npm run dev` instead
* When done open the project with `npm run open` or simply open `index.html` in your browser

![](https://cdn.pbrd.co/images/GCiImVr.gif)

## Purpose of the repository

This repository is meant to be a playground so that everybody can learn the language, break things, change things or even improve them.

Feel free to create pull requests if you find these examples useful. Also, please let me know if you find them too easy or too complex or not interesting at all.

Thanks for the interest and taking your time to visit the repository!

## Stay in touch

Have questions? Raise an [issue](https://github.com/maciejsmolinski/purescript-playground/issues) or contact me on twitter: [@maciejsmolinski](https://twitter.com/maciejsmolinski)