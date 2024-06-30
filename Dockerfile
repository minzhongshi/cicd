FROM node:latest as builder
WORKDIR /VueCICD
COPY package.json .
RUN npm install --no-frozen-lockfile
COPY . .
RUN npm run build
FROM nginx:latest
COPY --from=builder /VueCICD/dist /usr/share/nginx/html