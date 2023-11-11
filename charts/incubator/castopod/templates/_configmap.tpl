{{/* Define the configmap */}}
{{- define "castopod.configmap" -}}
enabled: true
data:
  CP_DATABASE_HOSTNAME:
    secretKeyRef:
      expandObjectName: false
      name: '{{ printf "%s-%s" .Release.Name "mariadbcreds" }}'
      key: plainhost
  CP_DATABASE_NAME: castopod
  CP_DATABASE_USERNAME: castopod
  CP_DATABASE_PASSWORD:
    secretKeyRef:
      expandObjectName: false
      name: '{{ printf "%s-%s" .Release.Name "mariadbcreds" }}'
      key: mariadb-password
  CP_BASEURL: "https://example.example.com"
  CP_ANALYTICS_SALT:
    secretRef:
      name: secrets
      key: CP_ANALYTICS_SALT
  CP_CACHE_HANDLER: "redis"
  CP_REDIS_HOST: 
    secretKeyRef:
      expandObjectName: false
      name: '{{ printf "%s-%s" .Release.Name "rediscreds" }}'
      key: plainhost
  CP_REDIS_PASSWORD:
    secretKeyRef:
      expandObjectName: false
      name: '{{ printf "%s-%s" .Release.Name "rediscreds" }}'
      key: redis-password
  CP_REDIS_DATABASE:
    secretKeyRef:
      expandObjectName: false
      name: '{{ printf "%s-%s" .Release.Name "rediscreds" }}'
      key: url
{{- end -}}