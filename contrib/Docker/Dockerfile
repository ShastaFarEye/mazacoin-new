FROM        phusion/baseimage
MAINTAINER  guruvan "guruvan@maza.club"

# We use a bootstrap script to avoid having temporary cache files and build
# dependencies being committed and included into the docker image.
COPY	. /
RUN	apt-get update \
	  && apt-get install -y libboost-all-dev \
	    libcurl4-openssl-dev libdb5.1++-dev \
	    git makepasswd libdb5.1-dev libboost-all-dev \
	  && tar -C /usr/local/ -xvpf mazacoin-new.tar \
	  && groupadd --gid 2211 maza \
	  && touch /etc/service/sshd/down \
	  && adduser --disabled-password --gecos "mazacoin" --uid 2211 --gid 2211 maza \
	  && chown -v root.root /etc/cron.d/cron-mazacoind \
	  && chmod -v 750 /etc/cron.d/cron-mazacoind \
	  && chown -v root.root /usr/local/bin/backupwallet.sh \
	  && chmod -v 755 /usr/local/bin/backupwallet.sh \
	  && touch /home/maza/.mazacoin/.firstrun \
	  && chmod -v 600 /home/maza/.mazacoin/mazacoin.conf \
	  && chmod -v 700 /etc/service/mazacoind/run \
	  && apt-get clean && apt-get autoremove -y
# Uncomment the follwing line if you prefer to run without
# the wallet volume
#VOLUME       ["/home/maza"]

# If you use the following line, you MUST 
# run with a wallet data container OR
# understand your wallet is EPHEMERAL!!
# 
# In our wallet container, we make /home/wallets/.container
# to know when we've added it our selves
VOLUME      ["/home/maza","/home/wallets"] 


#XPOSE      RPC   P2P   Testnet
EXPOSE      12832 12835 11832 11835 
#ENTRYPOINT  [""]
CMD         ["/sbin/my_init"]
