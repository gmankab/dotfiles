### apply on localhost

```sh
ansible-playbook site.yml
```

### apply on phone

```sh
ansible-playbook site.yml -i '192.168.1.179,' -u 'user' --ask-pass
```
