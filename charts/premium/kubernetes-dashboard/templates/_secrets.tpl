{{/* Define the secrets */}}
{{- define "kubernetes-dashboard.secrets" -}}

data:
  {{ (include "kubernetes-dashboard.app.csrf.secret.value" . ) -}}
