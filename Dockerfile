# specify a base image
# Note: 16-alpine used to avoid bugs!
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

# Download and install all required dependencies.
RUN npm install

# now we can copy all files over from the working dir to the container.
COPY . .

# default command
RUN npm run build


# This is the start of the second (run) phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
