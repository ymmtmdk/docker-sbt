FROM hseeberger/scala-sbt

RUN groupadd --system --gid 1000 worker \
	&& useradd --system --gid worker --uid 1000 --shell /bin/bash --create-home worker \
	&& mkdir /home/worker/.ivy2 \
	&& mkdir /home/worker/.sbt \
	&& chown --recursive worker:worker /home/worker

USER worker
VOLUME "/home/worker/.ivy2"
VOLUME "/home/worker/.sbt"
WORKDIR /home/worker

CMD sbt
