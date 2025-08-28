# Contributing to Rundeck Plugin Starter Kit

We welcome contributions from the community! This project aims to make Rundeck plugin development accessible to everyone, and we especially encourage contributions that expand our template library.

## 🚀 Quick Start for Contributors

1. **Fork the repository** on GitHub
2. **Clone your fork** locally
3. **Create a feature branch** from `main`
4. **Make your changes** and test them
5. **Submit a pull request**

## 🎯 How You Can Contribute

### 1. Plugin Templates (High Priority!)

We're actively seeking contributors to expand our plugin template library. Current templates include:
- ✅ UI Plugin
- ✅ Node Executor
- ✅ Notification Plugin

**Wanted Templates:**
- **File Copier Plugin** - Copy files to remote nodes
- **Resource Model Source** - Provide node inventory
- **Storage Plugin** - Custom storage backends  
- **Log Filter Plugin** - Process job execution logs
- **Workflow Step Plugin** - Custom workflow steps
- **Content Converter Plugin** - Transform content formats
- **Storage Converter Plugin** - Encrypt/decrypt storage content
- **Option Values Plugin** - Dynamic option lists
- **Orchestrator Plugin** - Control job execution flow

### 2. CLI Enhancements

- Add template selection during `create` command
- Implement template variable substitution
- Add validation for plugin configurations
- Create testing framework integration

### 3. Documentation

- Plugin development tutorials
- Best practices guides
- Troubleshooting documentation
- Video tutorials

### 4. Testing & Quality Assurance

- Unit tests for CLI commands
- Integration tests with Docker
- Template validation scripts
- CI/CD pipeline improvements

## 📋 Template Contribution Guidelines

### Template Structure

Each plugin template should follow this structure:

```
templates/your-plugin-type/
├── plugin.yaml              # Plugin configuration with {{VARIABLES}}
├── scripts/                 # Executable scripts (if applicable)
│   └── main.sh
├── resources/               # Static resources (if applicable)
│   ├── js/
│   └── css/
└── README.md               # Template-specific documentation
```

### Template Variables

Use these standard template variables for consistency:

- `{{PLUGIN_NAME}}` - Plugin identifier
- `{{PLUGIN_TITLE}}` - Human-readable title
- `{{PLUGIN_DESCRIPTION}}` - Plugin description
- `{{AUTHOR_NAME}}` - Author name
- `{{AUTHOR_EMAIL}}` - Author email
- `{{DATE}}` - Current date
- `{{PLUGIN_URL}}` - Plugin repository URL
- `{{VERSION}}` - Plugin version

### Template Checklist

When creating a new template, ensure it includes:

- [ ] Complete `plugin.yaml` with all necessary configuration
- [ ] Functional example code with comments
- [ ] Template variable placeholders
- [ ] Template-specific README.md
- [ ] Proper error handling
- [ ] Security best practices
- [ ] Documentation comments

## 🛠️ Development Setup

### Prerequisites

- Bash shell (Linux/macOS/WSL)
- Docker
- Git
- Text editor or IDE

### Local Development

1. **Clone the repository:**
   ```bash
   git clone https://github.com/ranjithrajv/rundeck-plus.git
   cd rundeck-plus
   ```

2. **Set up environment:**
   ```bash
   cp .envrc.example .envrc
   # Edit .envrc with your preferences
   ```

3. **Test the CLI:**
   ```bash
   ./rundeck-plugins-cli --help
   ./rundeck-plugins-cli list
   ```

4. **Test with Docker:**
   ```bash
   ./rundeck-plugins-cli spinup
   ```

## 📝 Coding Standards

### Shell Scripts

- Use `#!/bin/bash` shebang
- Enable strict mode: `set -euo pipefail`
- Quote variables: `"$VARIABLE"`
- Use meaningful function names
- Add comments for complex logic
- Include error handling

### Plugin Templates

- Follow Rundeck plugin specification
- Use consistent indentation (2 spaces)
- Include comprehensive configuration options
- Add input validation
- Document configuration parameters

### Documentation

- Use clear, concise language
- Include practical examples
- Keep README files up to date
- Use proper Markdown formatting

## 🧪 Testing Your Changes

### CLI Testing

```bash
# Test basic commands
./rundeck-plugins-cli --help
./rundeck-plugins-cli --version
./rundeck-plugins-cli list

# Test template listing
ls -la templates/
```

### Template Testing

1. Create a test plugin using your template
2. Deploy to local Rundeck instance
3. Verify functionality in Rundeck UI
4. Test error conditions

### Integration Testing

```bash
# Full workflow test
./rundeck-plugins-cli spinup
./rundeck-plugins-cli create
./rundeck-plugins-cli deploy
```

## 🔍 Code Review Process

### Pull Request Guidelines

1. **Clear title and description**
   - Explain what your PR does
   - Reference any related issues

2. **Small, focused changes**
   - One feature/fix per PR
   - Keep changes manageable

3. **Test your changes**
   - Verify templates work
   - Test CLI functionality
   - Check documentation

4. **Follow coding standards**
   - Consistent formatting
   - Proper commenting
   - Error handling

### Review Criteria

We review PRs based on:
- **Functionality** - Does it work as expected?
- **Code Quality** - Is it readable and maintainable?
- **Security** - Does it follow security best practices?
- **Documentation** - Is it properly documented?
- **Testing** - Are there adequate tests?

## 🏆 Recognition

Contributors will be:
- Listed in our CONTRIBUTORS.md file
- Credited in release notes
- Given GitHub repository permissions (for regular contributors)
- Featured in project documentation

## 📞 Getting Help

### Communication Channels

- **GitHub Issues** - Bug reports and feature requests
- **GitHub Discussions** - Questions and general discussion
- **Pull Request Comments** - Code-specific discussions

### Questions?

- Check existing issues and documentation first
- Create a GitHub issue for bugs or feature requests
- Start a GitHub discussion for questions
- Tag maintainers for urgent issues

## 🎉 Special Call for Template Contributors

**We especially need your help with plugin templates!** 

If you have experience with any Rundeck plugin type, please consider contributing a template. Even if you're not an expert, a basic working template is incredibly valuable for the community.

**Template Bounty Program**: We're actively seeking contributors for the missing plugin types listed above. Each quality template contribution will be:
- Fast-tracked for review and merge
- Featured prominently in project documentation  
- Credited in the next release announcement

## 📄 License

By contributing to this project, you agree that your contributions will be licensed under the same license as the project.

---

**Thank you for helping make Rundeck plugin development more accessible! 🚀**

*For questions about contributing, feel free to open an issue or start a discussion.*