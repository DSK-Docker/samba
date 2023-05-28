FROM alpine:3.18.0

LABEL maintainer "Dschinghis Kahn"

####################################################
######### DEFAULT VALUES                 ###########
####################################################
ENV TIMEZONE=UTC
ENV SMB_USERNAME=samba
ENV SMB_PASSWORD=samba

####################################################
######### INSTALLING BASE STUFF          ###########
####################################################
RUN apk add --no-cache shadow tzdata

####################################################
######### INSTALLING SAMBA SERVER        ###########
####################################################
RUN apk add --no-cache samba

####################################################
######### SETUP FILES & FOLDERS          ###########
####################################################
COPY init /

####################################################
######### CLEANUP                        ###########
####################################################
RUN rm -rf /tmp/* /root/.cache

EXPOSE 137/UDP
EXPOSE 138/UDP
EXPOSE 139/TCP
EXPOSE 445/TCP

HEALTHCHECK CMD nc -z localhost 445 || exit 1

CMD ["/init"]
