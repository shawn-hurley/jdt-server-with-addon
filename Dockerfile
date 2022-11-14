# A Java 8 runtime example
# The official Red Hat registry and the base image
FROM registry.access.redhat.com/ubi8/ubi-minimal
USER root
RUN microdnf install python39 java-17-openjdk go-toolset
RUN microdnf clean all
# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /etc/alternatives/jre
# Dir for my app
RUN mkdir -p /app
# Copy the MicroProfile starter app
COPY  ./ /jdtls/
# Copy the script from the source; run-java.sh has specific parameters to run a Thorntail app from the command line in a container. More on the script can be found at https://github.com/sshaaf/rhel7-jre-image/blob/master/run-java.sh
# Setting up permissions for the script to run
RUN chmod 755 /jdtls/bin/jdtls
# Finally, run the script
CMD [ "/jdtls/bin/jdtls" ]
