# pimcore-docker
A docker image for Pimcore development

# example usage

here's an example docker-compose.yml that sets up a Pimcore docker image with a MySQL database, using the current directory as the source of the Pimcore site's codebase.

```yaml

pimcore:
  image: seejy/pimcore:1.0
  volumes:
    # mount the current directory as /var/www/html. if using in production, this could
    # become an ADD in a Dockerfile which extends the seejy/pimcore image.
    - ".:/var/www/html"
  links:
    - "mysql:mysql"
  environment:
    # if used in conjunction with https://github.com/jwilder/nginx-proxy
    # (recommended), set your virtual host to root the site to the right place
    # note: be sure to add the IP of your docker-machine to point to this in /etc/hosts
    - "VIRTUAL_HOST=my-cool-site.dev"

mysql:
  image: mysql:latest
  environment:
    - "MYSQL_ROOT_PASSWORD=root_password"
    - "MYSQL_PASSWORD=user_password"
    - "MYSQL_USER=user"
    - "MYSQL_DATABASE=cool_db"

  # uncomment the following for data persistence  
  # volumes:
  #  - "./mysql:/var/lib/mysql"
  
  # for debugging/import/export tasks
  ports:
    - "3306:3306"
```
