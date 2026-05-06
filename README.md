# Quick Survey 📊

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Rails Version](https://img.shields.io/badge/Rails-8.0-red.svg)](https://rubyonrails.org)
[![Ruby Version](https://img.shields.io/badge/Ruby-3.3.0-red.svg)](https://www.ruby-lang.org)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

Quick Survey is an open-source, modern Ruby on Rails 8.0 application designed for creating, managing, and analyzing surveys with ease. Built with performance and scalability in mind, it leverages the latest Rails features and a robust multi-tenant architecture.

---

## 🚀 Key Features

- **Multi-Tenancy**: Isolated data environments for multiple accounts/organizations using `acts_as_tenant`.
- **Dynamic Survey Builder**: Interactive interface to create surveys with various question types:
  - Checklists
  - Scoring (1-5, 1-10)
  - Yes/No questions
  - Free text
- **Advanced Organization**: Manage your surveys efficiently with **Spaces** and **Folders**.
- **Solid Queue**: Reliable background job processing using the new Rails 8 default, **SolidQueue**.
- **Modern UX**: A lightning-fast, reactive user experience powered by **Hotwire** (Turbo and Stimulus) and styled with **Tailwind CSS**.
- **PDF Export**: Generate professional PDF reports of survey results using `wicked_pdf`.
- **Authentication & Security**: Robust user management with **Devise**, including invitable users and pwned password checks.

---

## 🛠 Tech Stack

- **Backend**: Ruby on Rails 8.0
- **Database**: PostgreSQL 13+
- **Background Jobs**: SolidQueue
- **Frontend**: Tailwind CSS, esbuild, Stimulus, Hotwire (Turbo)
- **Multi-Tenancy**: `acts_as_tenant`
- **Testing**: Minitest

---

## 💻 Local Development

### Prerequisites

- **Ruby**: 3.3.0
- **Node.js**: 22.x
- **Yarn**: 1.x
- **PostgreSQL**: 13+

### Setup Instructions

1. **Clone the Repository**:
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
   ```bash
   bin/rails db:prepare
   ```

4. **Run the Application**:
   ```bash
   bin/dev
   ```
   Visit `http://localhost:3000` to get started.

### Running Tests
```bash
bin/rails test
```

---

## 🗺 Roadmap

- [ ] Support for multi-page surveys.
- [ ] Advanced analytics dashboard with charts.
- [ ] Integration with Slack/Discord for notifications.
- [ ] API access for external integrations.

---

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

---

## 🚢 Deployment (Render)

This project is optimized for deployment on **Render**.

- **Build Command**: `RAILS_ENV=production ./bin/render-build.sh`
- **Start Command**: `bundle exec puma -C config/puma.rb`

**Important**: Ensure `DATABASE_URL` and `RAILS_MASTER_KEY` are configured.

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---

## 📧 Community & Support

- **GitHub Discussions**: [Join the conversation](https://github.com/Crownstack-Technologies-Private-Limited/quick-survey/discussions)
- **Issues**: [Report a bug or request a feature](https://github.com/Crownstack-Technologies-Private-Limited/quick-survey/issues)