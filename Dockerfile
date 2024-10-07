FROM gcc:4.9
COPY . /tmp/src
WORKDIR /tmp/src
RUN make clean && make -j test
CMD ["./main"]
