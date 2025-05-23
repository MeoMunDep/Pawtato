FROM python:3.10.11-alpine3.18

RUN apk add --no-cache build-base libffi-dev openssl-dev

WORKDIR /app

COPY requirements.txt .

RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-warn-script-location --no-cache-dir -r requirements.txt

COPY . .

CMD ["python3", "meomundep.py"]
