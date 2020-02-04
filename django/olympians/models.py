from django.db import models

class Olympian(models.Model):
    name = models.CharField(max_length = 250)
    sex = models.CharField(max_length = 3)
    age = models.IntegerField(blank=True, null=True)
    height = models.IntegerField(blank=True, null=True)
    weight = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'olympians'
