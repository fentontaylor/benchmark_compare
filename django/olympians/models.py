from django.db import models

class Olympian(models.Model):
    name = models.CharField(max_length = 250)
    sex = models.CharField(max_length = 3)
    age: models.IntegerField()
    height: models.IntegerField()
    weight: models.IntegerField()

    def __str__(self):
        return self.name
