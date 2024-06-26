from django.db import models
from django.contrib.auth.models import User


# Django 기본 User 모델을 가져옴

# Create your models here.

class TodoList(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    content = models.TextField(blank=True)
    dt_created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title