# Can define a phase with 'as'
FROM node:16.8.0-alpine as builder
WORKDIR '/usr/app'
COPY package.json .
COPY yarn.lock .
RUN yarn install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html
