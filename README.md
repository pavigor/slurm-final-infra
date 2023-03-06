# Infrastructure

## About
Для проекта использован личный домен **yelb.dev-ooops.com** от регистратора reg.ru  
Проект содержит описание инфраструктуры компании YELB, а также установку Ingress-контроллера и Gitlab-runner в кластер Kubernetes.
После создания Ingress имеется возможность прописать у регистратора A-запись для домена yelb.dev-ooops.com с указанием внешнего адреса балансировщика.

## Infrastructure
1. Network
2. Database 
3. Container registry
4. Kubernetes cluster

## Todo
- ~~добавить описание менеджера сертификатов в terraform~~
- ~~добавить создание TXT или CNAME-записи в reg.ru для валидации домена в Letsencrypt~~
- ~~добавить автоматическое проставление значений адреса кластера, ID registry в проекте https://s018753.gitlab.yandexcloud.net/yelb/graduation_work~~
- создать docker-образ с Helm/kubectl/YC

