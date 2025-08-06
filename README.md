# Rundeck Plugin Starter Kit

A complete template with development tools and examples to help new developers get started with Rundeck UI plugin development.

## Overview

The Rundeck Plugin Starter Kit provides everything you need to start developing Rundeck UI plugins. This project serves as a comprehensive template that includes:

- Complete plugin structure and configuration
- Local development environment setup
- Automated build and deployment scripts
- Best practices and examples
- Developer resources and documentation

Whether you're new to Rundeck plugin development or looking for a streamlined workflow, this starter kit will get you up and running quickly.

## Features

- 🚀 **Quick Setup**: One-command local development environment
- 🔧 **Development Tools**: Automated build and deployment scripts
- 📦 **Docker Integration**: Containerized Rundeck for consistent development
- 🎨 **UI Plugin Template**: Ready-to-customize JavaScript and CSS
- 📚 **Documentation**: Comprehensive guides and examples
- 🔄 **Hot Reload**: Fast development cycle with automatic plugin deployment

## Project Structure

```
rundeck-plugin-starter-kit/
├── plugin.yaml                     # Plugin configuration file
├── resources/
│   ├── js/
│   │   └── main.js                 # Main JavaScript functionality
│   └── css/
│       └── main.css               # Custom styling
├── setup-localdev-rundeck.sh      # Local development setup script
├── deploy-rundeck-plugins.sh      # Plugin deployment script
├── .envrc.example                 # Environment configuration template
├── .gitignore                     # Git ignore rules
├── README.md                      # This file
└── CONTRIBUTING.md                # Contribution guidelines
```

## Quick Start

### Prerequisites

- Docker
- Bash shell
- zip utility

### Getting Started

1. **Clone and Setup**
   ```bash
   git clone https://github.com/ranjithrajv/rundeck-plus.git
   cd rundeck-plus
   cp .envrc.example .envrc
   ```

2. **Start Development Environment**
   ```bash
   ./setup-localdev-rundeck.sh
   ```

3. **Deploy Your Plugin**
   ```bash
   ./deploy-rundeck-plugins.sh
   ```

4. **Access Rundeck**
   - Open your browser to `http://localhost:4440`
   - Login with default credentials: `admin/admin`
   - Navigate to Jobs to see your plugin in action

## Configuration

### Environment Variables (.envrc)

Copy `.envrc.example` to `.envrc` and customize:

```bash
export CONTAINER_NAME="rundeck-localdev"     # Docker container name
export PLUGIN_DIR=".rundeck/plugins"        # Local plugin directory
export RUNDECK_VERSION="5.9.0"              # Rundeck Docker image version
export RUNDECK_URL="http://localhost:4440"  # Rundeck URL
export HOST_RUNDECK_PORT="4440"             # Host port for Rundeck
export PLUGIN_NAME="rundeck-plus"           # Your plugin name
export PLUGIN_ZIP="rundeck-plus.zip"        # Plugin package name
export RUNDECK_AUTH_TOKEN="your-api-key"    # API token for automation
```

### Plugin Configuration (plugin.yaml)

The plugin configuration defines how your plugin integrates with Rundeck:

```yaml
name: your-plugin-name
version: 1.0.0
description: "Your plugin description"
rundeckPluginVersion: 1.2
author: Your Name
providers:
  - service: UI
    name: your-plugin-name
    plugin-type: ui
    title: "Your Plugin Title"
    description: "Detailed description"
    ui:
      - pages: 'menu/jobs'  # Target page
        scripts:
          - js/main.js      # JavaScript files
        styles:
          - css/main.css    # CSS files
```

## Development Workflow

### 1. Customize Your Plugin

Edit the following files to customize your plugin:

- **`plugin.yaml`**: Update plugin metadata and configuration
- **`resources/js/main.js`**: Add your JavaScript functionality
- **`resources/css/main.css`**: Style your plugin interface

### 2. Test Changes

```bash
./deploy-rundeck-plugins.sh
```

This will:
- Package your plugin
- Deploy it to the running Rundeck container
- Restart the container to load changes

### 3. View Logs

Monitor your plugin and Rundeck logs:

```bash
# Container logs
sudo docker logs rundeck-localdev -f

# Check container status
sudo docker ps
```

## Plugin Development Resources

### Official Rundeck Documentation

- [Plugin Development Guide](https://docs.rundeck.com/docs/developer/ui-plugins.html)
- [UI Plugin Reference](https://docs.rundeck.com/docs/developer/ui-plugins.html#ui-plugins)
- [Plugin Types](https://docs.rundeck.com/docs/developer/plugin-types.html)
- [Rundeck API Documentation](https://docs.rundeck.com/docs/api/)

### Community Resources

- [Rundeck Plugin Examples](https://github.com/rundeck/rundeck/tree/main/plugins)
- [Rundeck Community Plugins](https://github.com/rundeck-plugins)
- [Rundeck Slack Community](https://rundeck.slack.com)
- [Rundeck Forum](https://groups.google.com/forum/#!forum/rundeck-discuss)

### Development Tools

- [Rundeck CLI](https://rundeck.github.io/rundeck-cli/) - Command line interface
- [Rundeck API Client Libraries](https://docs.rundeck.com/docs/api/rundeck-api.html#client-libraries)
- [Plugin Development Best Practices](https://docs.rundeck.com/docs/developer/plugin-development.html)

### UI Development

- [Rundeck UI Framework](https://docs.rundeck.com/docs/developer/ui-plugins.html#ui-framework)
- [JavaScript API Reference](https://docs.rundeck.com/docs/developer/ui-plugins.html#javascript-api)
- [CSS Styling Guide](https://docs.rundeck.com/docs/developer/ui-plugins.html#styling)

## Common Plugin Types

This starter kit focuses on UI plugins, but Rundeck supports many plugin types:

- **Node Executor**: Execute commands on nodes
- **File Copier**: Copy files to nodes
- **Resource Model**: Provide node resources
- **Notification**: Send notifications
- **Storage**: Store data
- **Log Filter**: Process log output
- **Workflow Step**: Custom workflow steps
- **UI Plugin**: Enhance the web interface (this template)

## Troubleshooting

### Common Issues

1. **Port already in use**: Change `HOST_RUNDECK_PORT` in `.envrc`
2. **Container name conflict**: Change `CONTAINER_NAME` in `.envrc`
3. **Plugin not loading**: Check Docker logs for errors
4. **Permission issues**: Ensure Docker has proper permissions

### Debug Commands

```bash
# Check running containers
sudo docker ps

# View container logs
sudo docker logs rundeck-localdev

# Access container shell
sudo docker exec -it rundeck-localdev bash

# List installed plugins
sudo docker exec rundeck-localdev ls -la /home/rundeck/libext/
```

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is open source. Please refer to the license file for details.

## Support

- 📖 [Documentation](https://docs.rundeck.com/)
- 💬 [Community Forum](https://groups.google.com/forum/#!forum/rundeck-discuss)
- 🐛 [Issues](https://github.com/ranjithrajv/rundeck-plus/issues)
- 💡 [Discussions](https://github.com/ranjithrajv/rundeck-plus/discussions)

---

**Happy Plugin Development!** 🚀
