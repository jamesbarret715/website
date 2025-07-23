# BASE
FROM oven/bun:alpine AS base

WORKDIR /app
RUN bunx astro telemetry disable 

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
FROM nginx:1.25-alpine AS production

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


