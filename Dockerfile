FROM frolvlad/alpine-gxx

RUN addgroup --system app && adduser app --system --ingroup app
RUN chown app /home/app

WORKDIR /home/app
ADD ./smscsimulator.cpp /home/app

RUN g++ smscsimulator.cpp -o MLSMSCSimulator

CMD ["/bin/sh","-c","/home/app/MLSMSCSimulator"]

# docker build -t smpp-smsc-simulator:latest .
# docker run -it --rm -p 2775:2775 -p 8775:8775 smpp-smsc-simulator:latest
