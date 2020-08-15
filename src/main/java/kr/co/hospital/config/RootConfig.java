package kr.co.hospital.config;

import com.google.gson.Gson;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RootConfig {
    @Bean
    public Gson gson() {
        return new Gson();
    }

//    @Bean
//    public EnvironmentStringPBEConfig encryptorConfig() {
//        EnvironmentStringPBEConfig encryptorConfig = new EnvironmentStringPBEConfig();
//        encryptorConfig.setAlgorithm("PBEWithMD5AndDES");
//        encryptorConfig.setPassword("hospital");
//        return encryptorConfig;
//    }
//
//    @Bean
//    public StandardPBEStringEncryptor encryptor(EnvironmentStringPBEConfig encryptorConfig) {
//        StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
//        encryptor.setConfig(encryptorConfig);
//        return encryptor;
//    }
//
//    @Bean
//    public EncryptablePropertyPlaceholderConfigurer propertyConfigurer(StandardPBEStringEncryptor encryptor) {
//        Resource globalsResource = new DefaultResourceLoader().getResource("classpath:/static/properties/globals.properties");
//        Resource dbResource = new DefaultResourceLoader().getResource("classpath:/static/properties/dataSource.properties");
//
//        EncryptablePropertyPlaceholderConfigurer propertyConfigurer = new EncryptablePropertyPlaceholderConfigurer(encryptor);
//        // propertyConfigurer.setLocations(globalsResource, dbResource);
//
//        return propertyConfigurer;
//    }
}
