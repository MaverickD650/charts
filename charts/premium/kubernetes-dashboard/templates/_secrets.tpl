{{/* Define the secrets */}}
{{- define "kubernetes-dashboard.secrets" -}}

data:
  CSRF_KEY: {{ (include "kubernetes-dashboard.app.csrf.secret.value" . ) -}}
