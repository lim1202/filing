FROM python:3.10-slim 

WORKDIR /app

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/timezone && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -i https://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com -r /tmp/requirements.txt

COPY . /app

ENTRYPOINT [ "python", "-u", "app.py" ]
