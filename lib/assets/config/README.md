# Config directory

In this directory are all delicate files with configuration information. For security reasons these files are not published in the public repositories.

## ByteBank API config file

This file is used to help configure HTTP requests with the ByteBank API.</br>
Name this file is `bytebank-api.json`, it uses **json** format.

Here is a example:
```json
{
    "scheme": "http",
    "host": "192.168.0.1",
    "port": 8080,
    "auth": {
        "username": "davidgaspar",
        "[assword": "gaspardavid10"
    }
}
```

> **important:** Use the [ByteBank API repository](https://github.com/davidgaspardev/bytebank-api) to build the server.