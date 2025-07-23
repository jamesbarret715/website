# BASE
FROM node:20-alpine AS base
WORKDIR /app

# DEPS
FROM base AS deps

COPY package*.json ./
RUN bun install --production --frozen-lockfile

# BUILD
FROM base AS build

COPY package*.json ./
RUN bun install

COPY . .

RUN bun run build

# PRODUCTION
FROM base AS production

ENV NODE_ENV=production

COPY --from=deps /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist

EXPOSE 4321

CMD ["bun", "dist/server/entry.mjs", "--host", "0.0.0.0"]

