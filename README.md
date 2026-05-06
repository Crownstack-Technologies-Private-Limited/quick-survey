# Quick Survey

A modern Ruby on Rails 8.0 application for creating and managing surveys.

## Prerequisites

- **Ruby**: 3.3.0 (Check `.ruby-version`)
- **Node.js**: 22.x (Check `.nvmrc`)
- **Yarn**: 1.x
- **PostgreSQL**: 13+

## Local Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Crownstack-Technologies-Private-Limited/quick-survey
   cd quick-survey
   ```

2. **Install Ruby dependencies**:
   ```bash
   bundle install
   ```

3. **Install JavaScript dependencies**:
   ```bash
   yarn install
   ```

4. **Database Setup**:
   Ensure PostgreSQL is running locally, then run:
   ```bash
   bin/rails db:prepare
   ```

5. **Start the Development Server**:
   This will start both the Rails server and the CSS/JS watchers:
   ```bash
   bin/dev
   ```
   The application will be available at `http://localhost:3000`.

## Background Jobs (SolidQueue)

This project uses **SolidQueue 1.0+** for background job processing.

- **Local Development**: In development, SolidQueue is typically configured to run in-process or via a separate worker command.
- **Production**: On Render, SolidQueue runs as a plugin inside the Puma process (configured in `config/puma.rb`).

## Deployment (Render)

The application is configured for deployment on [Render](https://render.com/).

### Configuration

- **Environment**: Production
- **Build Command**: `RAILS_ENV=production ./bin/render-build.sh`
- **Start Command**: `bundle exec puma -C config/puma.rb`

### Required Environment Variables

Ensure the following environment variables are set in your Render dashboard:

- `DATABASE_URL`: The connection string for your PostgreSQL database.
- `RAILS_MASTER_KEY`: Your Rails master key for decrypting credentials.
- `SCREENER_DATABASE_PASSWORD`: (If applicable) Database password if not using `DATABASE_URL`.

### Build Script (`bin/render-build.sh`)

The deployment uses a custom build script that handles dependency installation, asset precompilation, and database migrations:
```bash
#!/usr/bin/env bash
set -o errexit

yarn install
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
```

## Database Schema (SolidQueue 1.0 Support)

The `config/database.yml` is configured for multi-database support required by SolidQueue 1.0+:
```yaml
production:
  primary:
    adapter: postgresql
    url: <%= ENV['DATABASE_URL'] %>
  queue:
    adapter: postgresql
    url: <%= ENV['DATABASE_URL'] %>
```
This ensures that both the application and the background job processor use the same database connection on Render.
