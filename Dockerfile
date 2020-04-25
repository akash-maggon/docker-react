FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install --save core-js@^3
RUN npm install 
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
