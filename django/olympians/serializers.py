from .models import Olympian

class OlympiansSerializer(serializers.ModelSerializer):
    class Meta:
        model = Olympian
        fields = ('name', 'sex', 'age', 'height', 'weight')
