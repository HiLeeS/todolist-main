# todolist/admin.py 
from django.contrib import admin

# Register your models here.
# 모델에서 TodoList 모델을 가져옴 
from .models import TodoList 

# 어드민 사이트에 TodoList 모델을 등록 
admin.site.register(TodoList)