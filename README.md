# Quick Survey 📊

Quick Survey is an open-source, modern Ruby on Rails 8.0 application designed for creating, managing, and analyzing surveys with ease. Built with performance and scalability in mind, it leverages the latest Rails features and a robust multi-tenant architecture.

---

## 🚀 Features

- **Multi-Tenancy**: Built-in support for multiple accounts/organizations using `acts_as_tenant`.
- **Dynamic Survey Builder**: Create surveys with various question types (checklists, scores, yes/no).
- **Organizational Structure**: Organize surveys into **Spaces** and **Folders**.
- **Real-time Processing**: Background jobs powered by **SolidQueue 1.0**.
- **Modern Frontend**: Fast, reactive UI using **Tailwind CSS**, **Stimulus**, and **Turbo**.
- **PDF Generation**: Export survey results using `wicked_pdf`.

## 🛠 Tech Stack

- **Framework**: Ruby on Rails 8.0
- **Database**: PostgreSQL
- **Background Jobs**: SolidQueue
- **Frontend**: Tailwind CSS, esbuild, Stimulus, Hotwire (Turbo)
- **Multi-Tenancy**: `acts_as_tenant`
- **Authentication**: Devise

---

## 💻 Local Development

### Prerequisites

- **Ruby**: 3.3.0
- **Node.js**: 22.x
- **Yarn**: 1.x
- **PostgreSQL**: 13+

### Setup Instructions

1. **Clone & Enter**:
   ```bash
   git clone https://github.com/Crownstack-Technologies-Private-Limited/quick-survey
   cd quick-survey
   ```

2. **Install Dependencies**:
   ```bash
   bundle install
   yarn install
   ```

3. **Database Setup**:
   Ensure PostgreSQL is running, then initialize the database and run migrations:
   ```bash
   bin/rails db:prepare
   ```

4. **Run the App**:
   Start the development server with watchers for CSS and JS:
   ```bash
   bin/dev
   ```
   Visit `http://localhost:3000` to see the app in action.

### Running Tests

We use Minitest for testing. Run the suite with:
```bash
bin/rails test
```

---


## 🚢 Deployment (Render)

This project is optimized for deployment on **Render**.

- **Build Command**: `RAILS_ENV=production ./bin/render-build.sh`
- **Start Command**: `bundle exec puma -C config/puma.rb`

**Important**: Ensure `DATABASE_URL` and `RAILS_MASTER_KEY` are configured in your environment settings.