{{- /* cert.tpl */ -}}
{{ with secret "pki_int/issue/${pki_role}" "common_name=www.${dns_domain}"     "ttl=2m" }}
{{ .Data.certificate }}
{{ .Data.issuing_ca }}{{ end }}
