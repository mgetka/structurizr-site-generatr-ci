# Structurizr Site Generatr CI image

As for now, it is impossible to use [structurizr-site-generatr](https://github.com/avisi-cloud/structurizr-site-generatr) image provided by [Avisi Cloud](https://github.com/avisi-cloud) as an environment for GitLab CI task due to the [#1170 GitLab CI issue](https://gitlab.com/gitlab-org/gitlab-runner/-/issues/1170).

The issue has been filed and closed in 2016, Since then, and up until today, more and more people report encountering the same problem. Knowing that, we cannot expect the issue to be resolved anytime soon.

In the case of structurizr-site-generatr, the issue drills down to the fact that the underlying ubuntu image, symlinks _dash_ as `/bin/sh`.

Image backed by this repository, makes one small changes - points `/bin/sh` to _bash_ - this allow builds in the GitLab CI environment. On top of that, it also removes the entrypoint and places the main executable on PATH.

----------------------------------------------

Using this image, one can render the site using CI config like following:

```yaml
site:
  image: ghcr.io/mgetka/structurizr-site-generatr-ci:1.3.0
  stage: build
  script:
    - structurizr-site-generatr generate-site -w workspace.dsl --assets-dir assets
  artifacts:
    paths:
      - build
```

> [!WARNING]\
> For the whole thing to work, you need to have moderately recent Docker Engine (>20.10.0) installed alongside the GitLab runner.
