FROM python:3.12.3
# python 3.12.3 버전이라는 베이스 이미지를 사용하여 새로운 이미지를 생성

RUN mkdir /app
WORKDIR /app
# 이 문장은 작업 디렉토리를 '/app'으로 설정합니다. 이 디렉토리는 이미지 내에서 모든 작업이 수행될 위치
# 쉽게는 manage.py를 가지고 있는 폴더의 위치라고 생각하면 됩니다.

COPY . /app
# 이 문장은 현재 디렉토리의 모든 파일과 폴더를 현재 작업 디렉토리(`/app`)로 복사합니다.
# 즉, 현재 디렉토리의 모든 파일과 폴더가 이미지 내의 `/app` 디렉토리로 복사됩니다.

RUN pip install django
#Django를 pip로 설치
#RUN pip install -r requirements.txt
# 이 문장은 Django를 이미지내에서 실행시키기 위해 pip으로 설치해야할 내용들을 설치하는 명령을 실행합니다.
# requirements.txt에 적혀있는 pip들을 설치하게 됩니다.

RUN apt-get install -y libmysqlclient-dev=5.7.31-0ubuntu0.18.04.1
RUN pip3 install mysqlclient
#mysql 설치

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# 이 문장은 컨테이너가 실행될 때 기본으로 실행할 명령을 지정합니다. WORKDIR에서 지정한 디렉터리에서 실행되는 문장
# 만약 gunicorn을 사용한다면 CMD ["gunicorn", "--bind", "0.0.0.0:8000", "config.wsgi:application"] 이 CMD를 사용

EXPOSE 8000
# django 서버의 포트를 8000으로 지정하였으므로 Docker의 컨테이너 또한 8000 포트를 열어줌
# 참고로 장고의 기본 포트번호는 8000