FROM python
ADD news.py /
ADD requirements.txt /
RUN pip install -r requirements.txt
ENV FLASK_APP=news.py
EXPOSE 5000
CMD [ "python", "./news.py" ]