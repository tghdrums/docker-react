# build the initial container which will be copied over to the final nginx container
FROM node:16-alpine as builder
WORKDIR /home/node/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# start up the prod container by copying the above build
FROM nginx
COPY --from=builder /home/node/app/build /usr/share/nginx/html

# don't need a run command here as the default nginx command will run it anyway