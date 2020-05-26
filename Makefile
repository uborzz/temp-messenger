rabbit-run:
	docker run -d -p 5672:5672 -p 15672:15672 --name rabbitmq rabbitmq

rabbit-start:
	docker start rabbitmq

redis-run:
	docker run -d -p 6379:6379 --name redis redis

redis-start:
	docker start redis

redis-client:
	docker exec -it redis redis-cli

nameko-run:
	nameko run temp_messenger.service --config config.yaml
	# nameko run temp_messenger.service:KonnichiwaService --config config.yaml

nameko-shell:
	nameko shell --config config.yaml
	# >>> n.rpc.konnichiwa_service.konnichiwa()

format:
	./format.sh .