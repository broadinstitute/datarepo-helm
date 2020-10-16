{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "sqlbackup.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sqlbackup.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sqlbackup.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "sqlbackup.labels" -}}
helm.sh/chart: {{ include "sqlbackup.chart" . }}
{{ include "sqlbackup.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "sqlbackup.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sqlbackup.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "sqlbackup.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "sqlbackup.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Back up script
*/}}
{{- define "backup" }}
#!/bin/bash
set -e
  {{- if or .Values.existingSecret .Values.existingSecretKey }}
gcloud auth activate-service-account {{ .Values.sqlInstanceName }} --key-file=/secrets/existingSecret
  {{- end }}
gcloud sql backups create --async --instance \
  {{ .Values.sqlInstanceName }} --description \"$(date '+%Y%m%d')\" --project {{ .Values.googleProjectId }}
{{- end -}}

{{/*
Clean up script
*/}}

{{- define "cleanup" }}
#!/bin/bash
set -e
  {{- if or .Values.existingSecret .Values.existingSecretKey }}
gcloud auth activate-service-account {{ .Values.sqlInstanceName }} --key-file=/secrets/existingSecret
  {{- end }}
apt-get -qq install jq -y > /dev/null

removaldate=$(date \'+%Y%m%d\' -d \"+{{ .Values.backupRetention }} days ago\")
backups=$(gcloud sql backups list --instance {{ .Values.sqlInstanceName }} --project {{ .Values.googleProjectId }} \
            --format json | jq  -r \'.[]| select (.| has(\"description\"))| select(.description < env.removaldate)\')

for i in $(echo \"${backups}\" | jq -r \'.id\');
  do gcloud sql backups delete $i --instance {{ .Values.sqlInstanceName }} --project {{ .Values.googleProjectId }} --quiet;
done
{{- end -}}
