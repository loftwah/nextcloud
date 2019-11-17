
deploy:
	docker stack deploy -c docker-compose.yml dockerownc

update:
	docker service update dockerownc_web-nc --force

rp_logs:
	docker service logs -f dockerownc_rp
