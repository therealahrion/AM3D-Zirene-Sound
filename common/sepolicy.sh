# Put sepolicy statements here
# Example: allow { audioserver mediaserver } audioserver_tmpfs file { read write open }
allow { audioserver mediaserver } { audioserver_tmpfs mediaserver_tmpfs } file { read write execute }
allow { audioserver mediaserver } system_file file execmod
