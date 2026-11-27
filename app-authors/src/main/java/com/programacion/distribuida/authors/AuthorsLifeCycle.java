package com.programacion.distribuida.authors;

import io.quarkus.runtime.ShutdownEvent;
import io.quarkus.runtime.StartupEvent;
import io.vertx.core.Vertx;//uso de core no multyni
import io.vertx.ext.consul.ConsulClient;
import io.vertx.ext.consul.ConsulClientOptions;
import io.vertx.ext.consul.ServiceOptions;
import jakarta.annotation.PostConstruct;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.event.Observes;
import jakarta.inject.Inject;
import org.eclipse.microprofile.config.inject.ConfigProperty;

@ApplicationScoped
public class AuthorsLifeCycle {

    @Inject
    @ConfigProperty(name = "consul.host", defaultValue = "127.0.0.1")
    String consulHost;

    @Inject
    @ConfigProperty(name = "consul.port", defaultValue = "8500")
    Integer consulPort;

    @Inject
    @ConfigProperty(name = "quarkus.http.port", defaultValue = "8070")
    Integer appPort;

    @Inject
    @ConfigProperty(name = "app.name")
    String appName;

    String ServiceId;

    @PostConstruct
    public void construct() {
        String ipAddress = "127.0.0.1";
        ServiceId = "%s-%s:%d".formatted(appName, ipAddress, appPort);
    }

    public void init(@Observes StartupEvent event, Vertx vertx) {
        System.out.println("AuthorsLifeCycle: calling init");
        System.out.println("consulHost = " + consulHost);
        System.out.println("consulPort = " + consulPort);
        System.out.println("appName = " + appName);
        System.out.println("appPort = " + appPort);

        try {
            ConsulClientOptions options = new ConsulClientOptions()
                    .setHost(consulHost)
                    .setPort(consulPort);
            ConsulClient client = ConsulClient.create(vertx, options);

            ServiceOptions serviceOptions = new ServiceOptions()
                    .setName(appName)
                    .setId(ServiceId)
                    .setAddress("127.0.0.1")
                    .setPort(appPort);

            client.registerService(serviceOptions)
                    .onSuccess(i -> System.out.println("Service registered with Consul: " + ServiceId))
                    .onFailure(err -> System.out.println("Failed to register service with Consul: " + err.getMessage()));

        }catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void destroy(@Observes ShutdownEvent event, Vertx vertx) {
        System.out.println("AuthorsLifeCycle: calling destroy");
        try {
            ConsulClientOptions options = new ConsulClientOptions()
                    .setHost(consulHost)
                    .setPort(consulPort);
            ConsulClient client = ConsulClient.create(vertx, options);

            client.deregisterService(ServiceId)
                    .onSuccess(i -> System.out.println("Service deregistered from Consul: " + ServiceId))
                    .onFailure(err -> System.out.println("Failed to deregister service with Consul: " + err.getMessage()));
        }catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
