## Docker account:
- Username: ougraduation
- Password: 123456789

## 1. STEPS TO DOCKERIZE PROJECTS (Only Van Anh can do this)
- Step 1: Ensure logout docker from terminal: `docker logout`
- Step 1: Login docker in terminal: `docker login`
- Step 2: Type `username` and `password` with the account above
- Step 3: Use built-in maven cmd of root project
    + Step 3.1: Lifecycle > clean > install
    + Step 3.2: Plugins > jib > jib:build
- Step 4: run docker-compose file at server/docker-compose.yml: `docker-compose up -d`