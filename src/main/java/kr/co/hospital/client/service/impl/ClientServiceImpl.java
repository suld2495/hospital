package kr.co.hospital.client.service.impl;

import kr.co.hospital.client.service.ClientService;
import kr.co.hospital.mapper.ClientMapper;
import org.springframework.stereotype.Service;

@Service
public class ClientServiceImpl implements ClientService {
    private ClientMapper clientMapper;

    public ClientServiceImpl(ClientMapper clientMapper) {
        this.clientMapper = clientMapper;
    }
}
