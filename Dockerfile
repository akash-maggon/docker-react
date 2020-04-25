FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install --verbose
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
