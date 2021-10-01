# FHIR-Questionnaires

This repository contains the FHIR Questionnaires supported by [NAV](https://nav.no).

## Development

The Questionnaires are developed using [FSH](https://build.fhir.org/ig/HL7/fhir-shorthand/overview.html) ([Tutorial](https://fshschool.org/docs/tutorials/basic/)).

Each Questionnaire is located in a folder within the `input/fsh` folder. Typical content of a Questionnaire folder:

```
input/fsh/NAV-06-03-04/
├── CHANGELOG.md # Maintained by the release process
├── package.json # Configure package name, version is managed by the release process
└── questionnaire.fsh # Source code for the Questionnaire
```

To build the FHIR resources just run the following at the root of the project:
```
npm install -g fsh-sushi
sushi .
```

## Release management

The release process is managed by [release-please](https://github.com/googleapis/release-please). The release workflow relies on the following convention:

- Workflow name, Questionnaire id (`Instance` field in the .fsh file) and Questionnaire's folder name in the `input/fsh` folder **must match**.

Commits following the [Conventional Commit messages](https://www.conventionalcommits.org/en/v1.0.0/) and affecting the Questionnaire folder, will trigger the creation of a PR. While open, this PR will keep track of additional commits satisfying the aforementioned mentioned rules and update the Changelog and version ([see](https://github.com/google-github-actions/release-please-action#how-should-i-write-my-commits) for more details).

Upon merge of this PR a Github Release will be created containing the json resource for the Questionnaire, as well as a npm package will be published containing the same resource. The version in the Questionnaire resource will be inferred from the `package.json` file.

## Creating new Questionnaire

To create a new Questionnaire just create a folder in the `input/fsh` folder. Here create a `package.json` and a `.fsh` file describing your Questionnaire. Make sure you also create a workflow file for the release process.

**NOTE**: Make sure you follow the convention mentioned in the `Release management` section.