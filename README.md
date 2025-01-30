# DeepSeek  Chatbot

A step-by-step guide to setting up and running DeepSeek locally using Ollama, making it accessible via a browser as an offline chatbot.

## Prerequisites

Before starting, ensure you have the following installed on your system:

- **Docker** ([Install | Docker Docs](https://docs.docker.com/engine/install/))
    
- **Docker Compose** ([Install | Docker Docs](https://docs.docker.com/compose/install/))
    

## Installation & Setup

### 1. Clone the Repository

```
git clone https://github.com/bleo181-dev/deepseek-chatbot.git
cd deepseek-chatbot
```


### 2. Start the Services

Run the following command to start all necessary containers:

```
make start
```

This will:

- Start a MongoDB database
    
- Start Ollama with DeepSeek
    
- Launch the Chat UI accessible from your browser
    

### 3. Pull the DeepSeek Model

Once the containers are running, install the DeepSeek model:

```
make install
```

This command pulls both deepseek-r1:7b and deepseek-r1:1.5b models into Ollama.

### 4. Access the Chatbot

After installation, open your browser and go to:

```
http://localhost:4000
```

You should now see a chatbot interface where you can interact with DeepSeek offline! You can select between the 7B and 1.5B versions as needed.

## Stopping the Services

To stop all running services, use:

```
make stop
```

## Directory Structure

```
/
├── .env.local             # Environment variables
├── Makefile               # Shortcut commands for setup and control
└── docker-compose.yaml    # Docker Compose configuration
```

## Conclusion

Congratulations! 🎉 You’ve successfully set up a local, offline chatbot powered by DeepSeek and Ollama. Enjoy experimenting with AI chat models without requiring an internet connection!


# Technical Overview

This implementation combines modern AI infrastructure with containerized services to create a self-contained chatbot system. At its core lies **DeepSeek-R1**, an open-source large language model family developed by DeepSeek AI, specifically optimized for conversational tasks. The 7B parameter variant (7 billion neural connections) offers sophisticated reasoning capabilities at the cost of higher hardware requirements, while the 1.5B version provides faster inference on resource-constrained devices. Both models leverage advanced training techniques including grouped-query attention and rotary positional embeddings, achieving performance comparable to commercial alternatives while remaining fully localizable.

The system utilizes **Ollama** as the model serving framework - a lightweight abstraction layer that handles GPU-accelerated inference through llama.cpp, model version management, and REST API exposure. Unlike cloud-based alternatives, Ollama operates entirely offline after initial setup, ensuring data never leaves the local environment. Its modular architecture allows hot-swapping of models without service interruption, crucial for comparing the 1.5B and 7B variants.

Infrastructure components are orchestrated through **Docker Compose**, creating isolated environments for each service:

- **MongoDB** persists chat histories in JSON format
    
- **Ollama** serves model inferences via OpenAI-compatible API endpoints
    
- **Custom Chat UI** (Node.js/React frontend) provides browser access
    
- **Nginx** reverse proxy manages secure inter-container communication
    

Key architectural advantages include:

1. **Zero external dependencies** - All components run locally via Docker
    
2. **Hardware optimization** - Automatic CUDA detection for GPU acceleration
    
3. **Persistent memory** - Conversation continuity across sessions
    
4. **Model version control** - Pin specific model iterations for reproducibility
    

The hybrid web-native approach enables access from any device on the local network while maintaining enterprise-grade security. Memory management implements context window optimization, dynamically adjusting token allocation based on conversation length to prevent performance degradation.

This stack demonstrates how cutting-edge AI can be democratized through containerization, providing researchers and developers with a privacy-preserving alternative to cloud-based chatbots without sacrificing functionality. The modular design allows straightforward integration of future models from the DeepSeek family or other open-source LLMs supported by Ollama's growing ecosystem.