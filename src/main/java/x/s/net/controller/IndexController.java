package x.s.net.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by lenovo on 2016/11/18.
 */
@Controller
public class IndexController {

    @RequestMapping(value = "hello" )
    public String index() {
        return "hello";
    }
}
