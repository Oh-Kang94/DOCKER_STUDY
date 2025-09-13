# 1. MacOS

brew 로 인스톨하는 걸 기조

- docker install

```bash
    brew install docker
```

- docker Compose

```bash
    brew install docker-compose docker-credential-helper
```

- Config 설정

```json
//!~/.docker/config.json
{
  "auths": {
    "https://index.docker.io/v1/": {}
  },
  "credStore": "desktop",
  "currentContext": "colima",
  "cliPluginsExtraDirs": ["/opt/homebrew/lib/docker/cli-plugins"]
}
```

# 2. Colima

docker desktop대신, LinuxVM을 이용하기 위해서, 이용

```bash
brew install colima
```
