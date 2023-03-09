Проект написан в образовательных целях (изучение Ruby on Rails и Docker) 
по [данному туториалу.](https://guides.rubyonrails.org/getting_started.html) 

# Туториал для разработки внутри контейнера (для меня) 
- Создать образ: \
`docker build -t ruby:fawking .`
- Запустить контейнер: \
`docker run -d -it --name <container_name> --mount type=bind,source="$(pwd)"/,target=/usr/src/app ruby:fawking`
- Зайти в контейнер, чтобы вносить изменения: \
`docker exec -it <container_id> bash`
- Сохранить изменения, совершенные в контейнере: \
`docker commit <container_id> <changed>/fawkingruby:<tag>`
- Дальше можно просто стартовать сохраненный контейнер:\
`docker start <saved_container_id>`
- И для внесения изменений заходить уже в него: \
`docker exec -it <saved_container_id> bash`

## Troubleshooting
- Не работало удаление с помощью `turbo_method`
  - Нужно было доустановить:
    - `rails importmap:install`
    - `rails turbo:install stimulus:install`
## Errors and solutions 
- Docker: image has dependent child images:
  - https://gist.github.com/Siva-Charan/db7bd84ad2ca2b0779d87a75e6bb4176
