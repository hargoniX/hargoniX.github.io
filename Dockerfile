FROM ghcr.io/getzola/zola:v0.19.2 AS zola

COPY . /project
WORKDIR /project
RUN ["zola", "build"]

FROM ghcr.io/static-web-server/static-web-server:2 AS blog_server
WORKDIR /
COPY --from=zola /project/public /public
