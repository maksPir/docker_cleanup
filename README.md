1.	docker container prune -f - удалить все остановленные контейнеры
2.	docker volume prune -fa – удаление неиспользуемых томов
3.	docker image prune -fa - удалить все образы, на которые не ссылаются контейнеры и висячие
4.	docker network prune -f – удалить неиспользуемые сети
5.	docker system prune -fa --volumes – удалить все образы и все тома
6.	pip install docker-squash
	docker-squash -с newImageName – сжатие слоев
7.	docker rmi image_id – удалить конкретный образ
8.	docker images -f dangling=true – получение висячих образов
9.	docker ps -a – список всех контейнеров
10.	docker images – список всех образов

Для запуска скрипта необходимо выполнить команды:
chmod +x docker_cleanup.sh
./docker_cleanup.sh <Название образа>
