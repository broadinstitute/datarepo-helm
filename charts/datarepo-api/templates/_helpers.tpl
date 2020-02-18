{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "datarepo-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "datarepo-api.fullname" -}}
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
{{- define "datarepo-api.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "datarepo-api.labels" -}}
helm.sh/chart: {{ include "datarepo-api.chart" . }}
{{ include "datarepo-api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "datarepo-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "datarepo-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "datarepo-api.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "datarepo-api.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Generate existingDatarepoDbSecretKey key name in the secret
*/}}
{{- define "datarepo-api.secretKeyDatarepoDb" -}}
{{ default "datarepo-password" .Values.existingDatarepoDbSecretKey }}
{{- end -}}

{{/*
Generate existingStairwayDbSecretKey key name in the secret
*/}}
{{- define "datarepo-api.secretKeyStairwayDb" -}}
{{ default "stairway-password" .Values.existingStairwayDbSecretKey }}
{{- end -}}

{{/*
Generate existingServiceAccountSecretKey key name in the secret
*/}}
{{- define "datarepo-api.secretKeyServiceAccount" -}}
{{ default "credential-file-json" .Values.existingServiceAccountSecretKey }}
{{- end -}}

{{/*
Generate the secret name for DB
*/}}
{{- define "datarepo-api.secretNameDB" -}}
{{ default (include "datarepo-api.fullname" .) .Values.existingSecretDB }}
{{- end -}}

{{/*
Generate the secret name for SA
*/}}
{{- define "datarepo-api.secretNameSA" -}}
{{ default (include "datarepo-api.fullname" .) .Values.existingSecretSA }}
{{- end -}}

{{/*
Check if any type of credentials are defined
*/}}
{{- define "datarepo-api.hasCredentials" -}}
{{ or .Values.secretsgeneric.datarepoPassword ( or .Values.existingSecretDB .Values.existingSecretSA .Values.existingDatarepoDbSecretKey .Values.existingStairwayDbSecretKey .Values.existingServiceAccountSecretKey ) -}}
{{- end -}}

{{/*
Return the proper image name
*/}}
{{- define "datarepo-api.image" -}}
{{- $registryName := .Values.image.registry -}}
{{- $repositoryName := .Values.image.repository -}}
{{- $tag := .Values.image.tag | toString -}}

{{- if .Values.image }}
  {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}
{{- end -}}
