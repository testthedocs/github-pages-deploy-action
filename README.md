# GitHub Pages Deploy Action :rocket:

This [GitHub action](https://github.com/features/actions) will handle the building and deploy process of your project to [GitHub Pages](https://pages.github.com/).

It only supports uploading to the `gh-pages` branch!

This action is built on [Node](https://nodejs.org/en/), which means that you can call any optional build scripts your project requires prior to deploying.

## Getting Started :airplane:

You can include the action in your workflow to trigger on any event that [GitHub actions supports](https://help.github.com/en/articles/events-that-trigger-workflows).

If the remote branch that you wish to deploy to doesn't already exist the action will create it for you.

Your workflow will also need to include the `actions/checkout` step before this workflow runs in order for the deployment to work.

You can view an example of this below.

```yml
name: Build and Deploy
on: [push]
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@master

    - name: Build and Deploy
      uses: testthedocs/github-pages-deploy-action@master
      env:
        ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
        BUILD_DIR: test/build/ # The folder, the action should deploy.
        BUILD_SCRIPT: npm install && npm run-script build # The build script the action should run prior to deploying.
```

If you'd like to make it so the workflow only triggers on push events to specific branches then you can modify the `on` section.

```yml
on:
  push:
    branches:
      - master
```

## Configuration

The `env` portion of the workflow **must** be configured before the action will work.
You can add these in the `env` section found in the examples above.

Any `secrets` must be referenced using the bracket syntax and stored in the GitHub repositories `Settings/Secrets` menu.

You can learn more about setting environment variables with GitHub actions [here](https://help.github.com/en/articles/workflow-syntax-for-github-actions#jobsjob_idstepsenv).

Below you'll find a description of what each option does.


`ACCESS_TOKEN`: Depending on the repository permissions you may need to provide the action with a GitHub personal access token instead of the provided GitHub token in order to deploy.
You can [learn more about how to generate one here](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line).

**This should be stored as a secret**.

`BUILD_SCRIPT`: If you require a build script to compile your code prior to pushing it you can add the script here.

The Docker container which powers the action runs Node which means `npm` commands are valid.

`BUILD_DIR`: The folder, the action should deploy.

With the action correctly configured you should see the workflow trigger the deployment under the configured conditions.


`PAGES_CNAME`: The CNAME to use for pages (Optional)

This variable should contain the CNAME you want to run your pages under. The action will use this to generate the necessary `CNAME` file.

## Contributing

We are a community effort, and everybody is most welcome to participate!

Be it filing bugs, formulating enhancements, creating pull requests, or any other means of contribution, we encourage contributions from everyone.

## Credits

- [ghpages](https://github.com/maxheld83/ghpages)
- [github-pages-deploy-action](https://github.com/grasilife/github-pages-deploy-action)