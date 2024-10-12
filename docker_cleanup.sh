
#!/bin/bash

echo "Начинаем очистку Docker..."

# Удаление неиспользуемых контейнеров, сетей, образов и томов
echo "Удаляем неиспользуемые объекты..."
docker system prune -af

# Удаление висячих образов
echo "Удаляем висячие образы..."
docker rmi $(docker images -f "dangling=true" -q)

# Удаление остановленных контейнеров
echo "Удаляем остановленные контейнеры..."
docker container prune -f

# Удаление неиспользуемых томов
echo "Удаляем неиспользуемые тома..."
docker volume prune -fa

# Сжатие слоев с помощью docker-squash
echo "Сжатие слоев с помощью docker-squash... "
pip install docker-squash
docker-squash -с $1

# Удаление неиспользуемых сетей
echo "Удаляем неиспользуемые сети..."
docker network prune -f

# Предоставление списка оставшихся образов и контейнеров
echo "Остались следующие образы:"
docker images

echo "Остались следующие контейнеры:"
docker ps -a

echo "Очистка завершена."
