package xyz.lingview.cloudnexus.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import xyz.lingview.cloudnexus.domain.Login;
import xyz.lingview.cloudnexus.domain.Register;

@Mapper
@Repository
public interface RegisterMapper {
    int selectUser(String username);
    int insertUser(Register register);

}
