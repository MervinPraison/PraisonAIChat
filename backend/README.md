# PraisonAI UI

**Modern AI Agent Interface for PraisonAI**

[![PyPI - Downloads](https://img.shields.io/pypi/dm/praisonai-ui)](https://pypi.org/project/praisonai-ui/)
[![GitHub Contributors](https://img.shields.io/github/contributors/MervinPraison/PraisonAI-UI)](https://github.com/MervinPraison/PraisonAI-UI/graphs/contributors)

PraisonAI UI is a powerful, modern chat interface designed for AI agent interactions. Built for the [PraisonAI](https://github.com/MervinPraison/PraisonAI) multi-agent framework.

## Features

- **Multi-Agent Support** - Seamlessly interact with multiple AI agents
- **Tool Call Visualization** - See agent tool calls and their results in real-time
- **Streaming Responses** - Real-time streaming of agent responses
- **Session Management** - Persistent sessions with history
- **Run Timeline** - Visual timeline of agent runs and traces
- **Modern UI** - Clean, responsive interface built with React

## Installation

```sh
pip install praisonai-ui
praisonai run app.py
```

Or run directly:

```sh
praisonai run app.py -w
```

## Quick Start

### With PraisonAI Agents

```python
from praisonaiagents import Agent
from praisonai.chat import start_chat_server

agent = Agent(
    name="Assistant",
    instructions="You are a helpful assistant."
)

# Start the chat UI with your agent
start_chat_server(agent=agent, port=8000)
```

### Standalone Mode

```sh
praisonai chat
```

This starts the chat interface at `http://localhost:8000`.

## Key Features

- **Multi Modal chats** - Support for text, images, and files
- **Chain of Thought visualization** - See agent reasoning steps
- **Data persistence** - Save and restore chat sessions
- **Authentication** - Built-in auth support
- **Tool Integration** - Visualize tool calls and results

## Integration with PraisonAI

PraisonAI UI integrates seamlessly with the PraisonAI agent framework:

```python
from praisonaiagents import Agent, Task, PraisonAIAgents

# Define your agents
researcher = Agent(name="Researcher", role="Research specialist")
writer = Agent(name="Writer", role="Content writer")

# Create tasks
research_task = Task(description="Research the topic", agent=researcher)
write_task = Task(description="Write the article", agent=writer)

# Run with chat UI
agents = PraisonAIAgents(agents=[researcher, writer], tasks=[research_task, write_task])
```

## Documentation

Full documentation is available at [docs.praison.ai](https://docs.praison.ai).

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](.github/CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the [Apache 2.0](LICENSE) license.

**Based on [Chainlit](https://github.com/Chainlit/chainlit)** - An open-source async Python framework for building conversational AI applications.
