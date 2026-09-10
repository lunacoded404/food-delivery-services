from rest_framework import serializers

from .models import ContactMessage


class ContactMessageSerializer(
    serializers.ModelSerializer
):

    class Meta:
        model = ContactMessage

        fields = [
            "id",
            "name",
            "email",
            "subject",
            "message",
            "created_at",
            "is_resolved",
        ]

        read_only_fields = [
            "id",
            "created_at",
            "is_resolved",
        ]

    def validate_name(self, value):

        value = value.strip()

        if not value:
            raise serializers.ValidationError(
                "Name is required."
            )

        return value

    def validate_subject(self, value):

        value = value.strip()

        if not value:
            raise serializers.ValidationError(
                "Subject is required."
            )

        return value

    def validate_message(self, value):

        value = value.strip()

        if not value:
            raise serializers.ValidationError(
                "Message is required."
            )

        return value