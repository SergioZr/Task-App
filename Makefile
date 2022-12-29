build:
	docker image build -t task_app .
run:
	docker run -p 5000:5000 -d --name taskapp task_app
enter:
	docker exec -it taskapp sh
destroy:
	docker rm -f taskapp
	docker image rm task_app