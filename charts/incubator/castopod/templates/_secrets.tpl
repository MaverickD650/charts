{{/* Define the secrets */}}
{{- define "casto.secrets" -}}
{{- $basename := include "tc.v1.common.lib.chart.names.fullname" $ -}}
{{- $fetchname := printf "%s-secret" $basename -}}

{{/* Initialize all keys */}}
{{- $secrets := randAlphaNum 50 }}

enabled: true
data:
  {{ with (lookup "v1" "Secret" .Release.Namespace $fetchname) }}
    {{/* Get previous values and decode */}}
    {{ $secrets = (index .data "CP_ANALYTICS_SALT") | b64dec }}
  {{ end }}
  CP_ANALYTICS_SALT: {{ $secrets }}
{{- end -}}
