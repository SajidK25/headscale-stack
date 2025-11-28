# HeadScale HeadScale-UI and Pangolin Stack

## How to run

- Clone the repository
` git clone https://github.com/SajidK25/headscale-stack.git`
- Enter the project Directory and run the stack:
```
cd headscale-stack/
docker compose up -d
```
- See the logs
`docker compose logs headscale`
```
headscale  | 2025-11-27T16:37:01Z INF Opening database database=sqlite3 path=/var/lib/headscale/db.sqlite
headscale  | 2025-11-27T16:37:01Z INF Starting Headscale commit=f658a8eacd4d86edc65424b50635afed46ca4b2a version=v0.27.1+dirty
headscale  | 2025-11-27T16:37:01Z INF Clients with a lower minimum version will be rejected minimum_version=v1.64.0
headscale  | 2025-11-27T16:37:02Z WRN Listening without TLS but ServerURL does not start with http://
headscale  | 2025-11-27T16:37:02Z INF listening and serving HTTP on: 0.0.0.0:8080
headscale  | 2025-11-27T16:37:02Z INF listening and serving debug and metrics on: 127.0.0.1:9090
headscale  | 2025-11-27T16:37:03Z INF New followup node registration using key: YzZyrvKtcbTXj-y8Jv94dEBi

```
- docker compose logs pangolin
```
pangolin  | 
pangolin  | > @fosrl/pangolin@0.0.0 start
pangolin  | > ENVIRONMENT=prod node dist/migrations.mjs && ENVIRONMENT=prod NODE_ENV=development node --enable-source-maps dist/server.mjs
pangolin  | 
pangolin  | Starting migrations from version 1.12.2
pangolin  | Migrations to run: 
pangolin  | All migrations completed successfully
pangolin  | 2025-11-27T16:37:06+00:00 [info]: Started offline checker interval
pangolin  | 2025-11-27T16:37:06+00:00 [warn]: Email SMTP configuration is missing. Emails will not be sent.
pangolin  | === SETUP TOKEN EXISTS ===
pangolin  | Token: vt6234b3emhglj8nrrh3opx1ybw10072
pangolin  | Use this token on the initial setup page
pangolin  | ================================
pangolin  | Failed to fetch server IP from https://checkip.amazonaws.com: getaddrinfo EAI_AGAIN checkip.amazonaws.com
pangolin  | Failed to fetch server IP from https://ifconfig.io/ip: timeout of 5000ms exceeded
pangolin  | 2025-11-27T16:37:17+00:00 [debug]: Detected public IP: 160.250.95.34
pangolin  | 2025-11-27T16:37:17+00:00 [info]: Pangolin now gathers anonymous usage data to help us better understand how the software is used and guide future improvements and feature development. You can find more details, including instructions for opting out of this anonymous data collection, at: https://docs.pangolin.net/telemetry
pangolin  | 2025-11-27T16:37:17+00:00 [debug]: Using CORS options {"credentials":true}
pangolin  | 2025-11-27T16:37:17+00:00 [info]: API server is running on http://localhost:3000
pangolin  | 2025-11-27T16:37:17+00:00 [info]: Internal server is running on http://localhost:3001
pangolin  | 2025-11-27T16:37:18+00:00 [info]: OpenAPI documentation saved to config/openapi.yaml
pangolin  | 2025-11-27T16:37:19+00:00 [info]: Next.js server is running on http://localhost:3002
pangolin  | 2025-11-27T16:37:19+00:00 [info]: Integration API server is running on http://localhost:3003
```

- **Note the SETUP TOKEN EXISTS**

- Create a HeadScale API Key: `docker exec headscale headscale apikeys create`
```
Headscale API Key: Vmkz1mp.e5QmYC--zm1M8swRQhEkVP3AaIZB0-1T
```

- Test the HeadScale Server connection with TaleScale: `tailscale up --login-server https://headscale.t99ltd.com`