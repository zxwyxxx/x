# Вибір базового образу Python 3.10
FROM python:3.10-slim

# Встановлюємо робочу директорію
WORKDIR /code

# Копіюємо requirements.txt у контейнер
COPY requirements.txt /code/


# Оновлення pip та встановлення залежностей
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Копіюємо всі файли проєкту в контейнер
COPY . /code/

# Налаштування середовища для Django
ENV PYTHONUNBUFFERED 1

# Команда для запуску сервера Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Встановлюємо пакети, необхідні для компіляції psycopg2
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*
