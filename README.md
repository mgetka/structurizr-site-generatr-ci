# Structurizr Site Generatr CI image

As for now, it is impossible to use [structurizr-site-generatr](https://github.com/avisi-cloud/structurizr-site-generatr) image provided by [Avisi Cloud](https://github.com/avisi-cloud) as an environment for GitLab CI task due to the [#1170 GitLab CI issue](https://gitlab.com/gitlab-org/gitlab-runner/-/issues/1170).

The issue has been filed and closed in 2016, Since then, and up until today, more and more people report encountering the same problem. Knowing that, we cannot expect the issue to be resolved anytime soon.

In the case of structurizr-site-generatr, the issue drills down to the fact that the underlying ubuntu image, symlinks _dash_ as `/bin/sh`.

Image backed by this repository, makes one small changes - points `/bin/sh` to _bash_ - this allow builds in the GitLab CI environment. On top of that, it also changes the entrypoint to shell and places the main executable on PATH.

> [!NOTE]\
> At this point I don't really know what is the issue and whether this image can be anyhow helpful. I have created the image while I was troubleshooting structurizr site builds with a dated gitlab-runner (13.7.0) backed by unknown version of docker engine - definitely dated as well.
>
> Using this image, I at least managed to execute any action in the runner. But still - no success. At first, I encountered some weird permissions issues, and after that java refused to cooperate stating that the system is out of resources... any resources.
>
> My last lead is [this issue](https://github.com/adoptium/temurin-build/issues/3020#issuecomment-1172892168) and negotiation of runner update ¯\\\_(ツ)\_/¯
