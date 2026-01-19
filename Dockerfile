FROM node:20-bullseye-slim

WORKDIR /opt

RUN apt-get update \
 && apt-get install -y --no-install-recommends openssl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN npm i -g prisma@5

COPY prisma /opt/prisma

ENV DATABASE_URL=""

CMD ["sh", "-c", "prisma migrate deploy --schema=/opt/prisma/schema.prisma"]
