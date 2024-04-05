# Security Application Yaml

해당 패키지에서는 노출되면 안되는 환경 변수들을 가지고 있습니다.

## application-config.yml

```yaml
server:
  port: 8888

spring:
  application:
    name: local-config-server
```

## application-eureka-client.yml

```yaml
spring:
  rabbitmq:
    host: 127.0.0.1
    port: 5672
    username: cdd
    password: 1234
  cloud:
    config:
      server:
        git:
          uri: https://github.com/CoffeeDrivenDevelopment/Env
          default-label: main
          username: ${자신의 GitHub 계정}
          password: ${자신의 GitHub 비밀번호}

eureka:
  client:
    service-url:
      defaultZone: http://127.0.0.1:8761/eureka
```