{{/* Define the configmap */}}
{{- define "kubernetes-dashboard.configmap.dblessconfig" -}}
enabled: true
data:
  kong.yml: |
    _format_version: "3.0"
    services:
      - name: auth
        host: {{ template "kubernetes-dashboard.fullname" . }}-{{ .Values.auth.role }}
        port: 8000
        protocol: http
        routes:
          - name: authLogin
            paths:
              - /api/v1/login
            strip_path: false
          - name: authCsrf
            paths:
              - /api/v1/csrftoken/login
            strip_path: false
          - name: authMe
            paths:
              - /api/v1/me
            strip_path: false
      - name: api
        host: {{ template "kubernetes-dashboard.fullname" . }}-{{ .Values.api.role }}
        port: 8000
        protocol: http
        routes:
          - name: api
            paths:
              - /api
            strip_path: false
          - name: metrics
            paths:
              - /metrics
            strip_path: false
      - name: web
        host: {{ template "kubernetes-dashboard.fullname" . }}-{{ .Values.web.role }}
        port: 8000
        protocol: http
        routes:
          - name: root
            paths:
              - /
            strip_path: false

{{- end -}}

{{/* Define the configmap */}}
{{- define "kubernetes-dashboard.configmap.settings" -}}
enabled: true
data:
{{- with .Values.app.settings.global }}
  settings: {{ toJson . | quote }}
{{- end }}
{{- with .Values.app.settings.pinnedResources }}
  pinnedResources: {{ toJson . | quote }}
{{- end }}

{{- end -}}
