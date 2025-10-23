package xyz.lingview.cloudnexus.dto.response;

import lombok.Data;

@Data
public class UserStatusResponseDTO {
    private boolean loggedIn;
    private String username;
    private String message;
}
