---
layout: post
title: From zero to web-scraping with TypeScript and Puppeteer
---

### Purpose

This post is mainly to document the first-time setup for a TypeScript project to be run with Node.js.

### Why use TypeScript

TypeScript's type system allows you, the developer, to make certain extra guarantees about the operation of your code. If you use the strict typing rules, a class of JavaScript errors like `TypeError: "x" is not a function` will be caught by the TypeScript compiler instead of at runtime.

This extra type information also allows your development tools to provide more specific warnings and recommendations, and to offer powerful refactoring and code-generation tools.

Finally, like Babel and WebPack, TypeScript allows you to consistently use the latest language features across projects. At compile time, your code is transformed to be compatible with your target environment, even if that's an outdated browser or other runtime that doesn't support the latest EcmaScript features.

### Why use Puppeteer for web scraping?

Web scraping is a method you turn to when you want to work with data that is publically available, but not available via API. 

There are many tools to facilitate this -- Python libraries Scrapy and BeautifulSoup are well-known examples -- but the advantage of Puppeteer is that its engine includes JavaScript support. 

This means Puppeteer can interact with single-page apps where the content isn't available until the page's script payload has run. For some pages where updates are served dynamically via websockets or by `fetch`ing from an api, maintaining one page session with Puppeteer should cause less load on the target web server than classic scraping techniques that involve a full page load.

The golden rule of web scraping is to be a "good citizen": 

* respect your target site's terms of use
* respect their crawler restrictions in `robots.txt`
* do not strain the target site's resources

For dynamic, js-driven sites, Puppeteer should let you get your data without causing trouble.

### Outline

Initialize project:

* Install nodejs from the official site (or via package manager)
* Install typescript `npm i -g typescript`
* Create a project folder `mkdir web-scraper-demo`
* `cd web-scraper-demo`
* `npm init`
* `npm i puppeteer` installs both puppeteer lib and chromium engine
* `npm i --save-dev @types/node`
* `npm i --save-dev @types/puppeteer`
* `tsc --init`

`tsconfig.json` settings:

```
{
  "compilerOptions": {
    /* Basic Options */
    "target": "es2015" /* Specify ECMAScript target version: 'ES3' (default), 'ES5', 'ES2015', 'ES2016', 'ES2017', 'ES2018', 'ES2019' or 'ESNEXT'. */,
    "module": "commonjs" /* Specify module code generation: 'none', 'commonjs', 'amd', 'system', 'umd', 'es2015', or 'ESNext'. */,

    /* Strict Type-Checking Options */
    "strict": true /* Enable all strict type-checking options. */,

    /* Module Resolution Options */
    "esModuleInterop": true /* Enables emit interoperability between CommonJS and ES Modules via creation of namespace objects for all imports. Implies 'allowSyntheticDefaultImports'. */
  }
}
```

Set up Prettier for auto formatting:

* `npm i --save-dev prettier`
* `touch .prettierrc`

`.prettierrc` settings:

```
{
  "printWidth": 100,
  "semi": true,
  "singleQuote": true
}
```

In Visual Studio Code:

* install Prettier extension (`esbenp.prettier-vscode`)
* in workspace settings, enable `Editor: Format on Save`
* in workspace settings, set `Editor: Default Formatter` to `esbenp.prettier-vscode`

