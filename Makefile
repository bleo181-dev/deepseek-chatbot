start:
	@docker-compose up -d

stop:
	@docker-compose down

install:
	@docker exec -it deepseek-chatbot-ollama-service-1 ollama pull deepseek-r1:7b
	@docker exec -it deepseek-chatbot-ollama-service-1 ollama pull deepseek-r1:1.5b
