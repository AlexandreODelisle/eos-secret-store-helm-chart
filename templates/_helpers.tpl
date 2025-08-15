{{/* Returns the value or a default for RBAC names */}}
{{- define "secret-store.rbacName" -}}
{{- if . }}{{ . }}{{- else }}vault-sa{{- end -}}
{{- end -}}

{{- define "secret-store.rbacTokenSecretName" -}}
{{- if . }}{{ . }}{{- else }}vault-sa-token{{- end -}}
{{- end -}}

{{- define "secret-store.rbacRoleName" -}}
{{- if . }}{{ . }}{{- else }}vault-reader{{- end -}}
{{- end -}}

{{- define "secret-store.rbacRoleBindingName" -}}
{{- if . }}{{ . }}{{- else }}vault-reader-binding{{- end -}}
{{- end -}}

{{- define "secret-store.rbacClusterRoleBindingName" -}}
{{- if . }}{{ . }}{{- else }}vault-tokenreview-binding{{- end -}}
{{- end -}}
