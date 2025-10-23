package xyz.lingview.cloudnexus.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import xyz.lingview.cloudnexus.domain.Login;

@Mapper
@Repository
public interface LoginMapper {
    Login loginUser(Login login);
}
