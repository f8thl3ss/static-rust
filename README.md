# static-rust

Dead simple web-server using rust and serving files and static web-app from a hard-coded directory

## How to use:
- Put your stuff in the container directory `/static`
```
FROM --platform=linux/arm/v7 node as builder

...

RUN npm build

FROM --platform=linux/arm/v7 f8thl3ss/static-rust:1.0

COPY --from=builder /home/node/build /static
```
- Build your image
- Start the container `docker run -p 127.0.0.1:3000:3000 {MY_IMAGE}`
- You can access your static website on localhost:3000 
