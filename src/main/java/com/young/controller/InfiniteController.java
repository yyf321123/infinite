package com.young.controller;

import com.young.entity.Admin;
import com.young.entity.Book;
import com.young.entity.Collect;
import com.young.entity.User;
import com.young.service.AdminService;
import com.young.service.BookService;
import com.young.service.CollectService;
import com.young.service.UserService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class InfiniteController {

    @Autowired
    private BookService bookService;

    @Autowired
    private CollectService collectService;

    @Autowired
    private UserService userService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private HttpServletRequest request;

    // 主页（查询所有书籍以及模糊查询）
    @RequestMapping("/index")
    public String index(Model model, String type_id, String name){
        List<Book> list = bookService.queryBooks();

        if(type_id != null && type_id != ""){
            list = bookService.queryBookByType_id(Integer.parseInt(type_id));
        }
        if(name != null && name != ""){
            list = bookService.queryBookByName(name);
        }
        if(request.getSession().getAttribute("user_id") != null){
            List<User> list_user = userService.queryUsersById((Integer) request.getSession().getAttribute("user_id"));
            model.addAttribute("list_user",list_user);
        }
        model.addAttribute("list",list);
        return "index";
    }

    // 详情页（根据书籍id查询）
    @RequestMapping("/desc")
    public String desc(Model model, int id, Integer type_id){
        List<Book> list = bookService.queryBookById(id);
        List<Book> list2 = bookService.queryBookByType_id(type_id);
        if(request.getSession().getAttribute("user_id") != null){
            List<User> list_user = userService.queryUsersById((Integer) request.getSession().getAttribute("user_id"));
            model.addAttribute("list_user",list_user);
        }
        model.addAttribute("list",list);
        model.addAttribute("list2",list2);
        return "desc";
    }

    // 收藏页（通过用户id查询）
    @RequestMapping("/collect")
    public String collect(Model model, int user_id){
        List<Book> list = bookService.queryCollectBook(user_id);
        if(request.getSession().getAttribute("user_id") != null){
            List<User> list_user = userService.queryUsersById((Integer) request.getSession().getAttribute("user_id"));
            model.addAttribute("list_user",list_user);
        }
        model.addAttribute("list",list);
        return "collect";
    }

    // 添加到收藏夹（新增用户id以及书籍id到收藏表collect）
    @RequestMapping("/insertCollect")
    public String insertCollect(Model model, String user_id,  String id){
        List<Collect> list = collectService.queryCollects();

        int num = -1; // 判断书籍是否存在 存在 1  不存在  0
        if(user_id != null && id != null){
            for(int i = 0; i < list.size(); i++){
                if(list.get(i).getCollect_user().equals(user_id) && list.get(i).getCollect_book().equals(id)){
                    num = 1;
                    model.addAttribute("booksAlreadyExist","这本书已经收藏过了");
                    return "desc";
                } else{
                    num = 0;
                }
            }
        }

        if(num == 0){
            int count = collectService.insertCollect(user_id,id);
            if(count > 0){
                return "redirect:index";
            }
            return "";
        }
        return null;
    }

    // 取消收藏
    @RequestMapping("/deleteCollect")
    public String deleteCollect(int collect_id){
        int count = collectService.deleteCollect(collect_id);
        if(count > 0){
            return "redirect:index";
        }
        return null;
    }

    // 登录页（查询所有用户--->比对账号和密码）
    @RequestMapping("/login")
    public String login(Model model, int user_id, String user_password){
        List<User> list = userService.queryUsers();
//        List<Admin> list_admin = adminService.queryAdmin();

        /*// 判断管理员账号 正确：count_admin=1 不正确：count_admin=0
        int count_admin = 0;
        for(int i = 0; i < list_admin.size(); i++){
            if(list_admin.get(i).getId()==user_id && list_admin.get(i).getPwd().equals(user_password)){
                count_admin = 1;
                break;
            } else {
                count_admin = 0;
            }
        }*/

        // 判断输入的账号密码是否正确 正确：count=1 不正确：count=0
        int count = 0;
        for(int i = 0; i < list.size(); i++){
            if(list.get(i).getUser_id()==user_id && list.get(i).getUser_password().equals(user_password)){
                count = 1;
                break;
            } else{
                count = 0;
            }
        }
        if(count == 1){
            // Session会话(将用户id存入session会话中)
            request.getSession().setAttribute("user_id",user_id);
            // 登录成功 跳转到主页
            System.out.println("登录成功！！");
            System.out.println("session:"+request.getSession().getAttribute("user_id"));
            return "redirect:index";
        }/* else if(count_admin == 1){
            // Session会话(将用户id存入session会话中)
            request.getSession().setAttribute("user_id",user_id);
            // 登录成功 跳转到后台主页
            return "redirect:http://123.56.167.172:8232/infinite-backstage/index";
        }*/
        else {
            // 登录失败 弹窗提示
            model.addAttribute("alert","alert(\"账号或密码错误，请重新输入\");");
            System.out.println("登录失败！！");
            return "login";
        }
    }

    // 找回密码（通过id查询-->对比密保--->验证成功后提供修改密码功能）
    @RequestMapping("/find")
    public String find(Model model, int user_id, String user_protection){
        List<User> list = userService.queryUsers();
        // 判断输入的账号密保是否正确 正确：count=1 不正确：count=0
        int count = 0;
        for(int i = 0; i < list.size(); i++){
            if(list.get(i).getUser_id()==user_id && list.get(i).getUser_protection().equals(user_protection)){
                count = 1;
                System.out.println("账号"+list.get(i).getUser_id());
                System.out.println("密保"+list.get(i).getUser_protection());
                break;
            } else{
                count = 0;
            }
        }
        if(count == 1){
            // 验证成功 修改密码
            // 跳转到修改密码页面
            return "update";
        } else{
            // 验证失败 弹窗提示
            model.addAttribute("alert","alert(\"账号或密保错误，请重新输入\");");
            return "find";
        }
    }

    // 忘记密码--->验证密保--->修改密码
    @RequestMapping("/update")
    public String update(Model model, int user_id, String user_password1, String user_password2){

        List<User> list = userService.queryUsers();

        // 判断
        int num = 0; // 未匹配次数
        for(int i=0;i<list.size();i++) {
            // 判断账号
            if(list.get(i).getUser_id() == user_id) {
                // 判断两次输入的密码是否相同
                if(user_password1.equals(user_password2)) {
                    userService.updatePassword(user_id, user_password2);
                    return "forward:/pages/login.jsp";
                }
                else {
                    model.addAttribute("passwordError", "两次输入的密码不相同，请重新输入！！！");
                    return "forward:/pages/update.jsp";
                }
            }
            else {
                num++;
            }
        }
        if(num == list.size()) {
            if(user_id != 0) {
                model.addAttribute("accountNotFound", "账号不存在，请重新输入！！！");
                return "forward:/pages/update.jsp";
            }
        }
        return null;
    }

    // 个人中心页
    @RequestMapping("/center")
    public String center(Model model){
        List<User> list = userService.queryUsersById((int) request.getSession().getAttribute("user_id"));
        model.addAttribute("list",list);
        return "center";
    }

    // 退出登录（使session失效）
    @RequestMapping("/quit")
    public String quit(){
        request.getSession().invalidate();
        return "forward:/pages/login.jsp";
    }

    // 注册
    @RequestMapping("/signup")
    public String signup(Model model, User user){
        int count = userService.insertUser(user);
        if(count > 0){
            // 获取用户注册的id（id为自增）
            List<User> userList = userService.queryUsers();
            int size = -1;
            int userId = 0;
            if(userList != null){
                size = userList.size() - 1;
                userId = userList.get(size).getUser_id();
            }
            model.addAttribute("userId",userId);
            return "login";
        }
        return null;
    }

    // 通过id查询用户信息
    @RequestMapping("/queryUsersByIdForUpdateUsers")
    public String queryUsersByIdForUpdateUsers(Model model){
        List<User> list = userService.queryUsersById((int) request.getSession().getAttribute("user_id"));
        model.addAttribute("list",list);
        return "updateUser";
    }

    // 修改个人资料
    @RequestMapping("/updateUser")
    public String updateUser(User user, MultipartFile file) throws IOException {
        if(file != null && !file.isEmpty()){
            // 加载得到文件信息
            String fileName = file.getOriginalFilename(); // 获取原始文件名
            byte[] bytes = file.getBytes();
            // 设置上传文件存储路径
            String filePath = request.getSession().getServletContext().getRealPath("/")+"img/"+fileName;
            System.out.println(filePath);

            // 将图片上传到服务器根目录
            File savaFile = new File(filePath);
            FileUtils.writeByteArrayToFile(savaFile,bytes);

            // 设置数据表中图片的路径
            String img_path = "img/"+fileName;
            int user_id = (int) request.getSession().getAttribute("user_id");
            user.setUser_pic(img_path);
            user.setUser_id(user_id);
        }
        int count = userService.updateUser(user);
        if(count > 0){
            return "redirect:center";
        }
        return null;
    }

    // 修改密码和密保
    @RequestMapping("/updatePwd")
    public String updatePwd(Model model, String user_password, String user_protection,
                            String user_password2, String user_protection2){

        List<User> list = userService.queryUsersById((int) request.getSession().getAttribute("user_id"));

        // 判断
        int num = 0; // 未匹配次数
        for(int i=0;i<list.size();i++) {
            // 判断密码
            if(list.get(i).getUser_password().equals(user_password)) {
                // 判断密保
                if(list.get(i).getUser_protection().equals(user_protection)) {
                    userService.updatePwd((int) request.getSession().getAttribute("user_id"),user_password2,user_protection2);
                    model.addAttribute("reLogin", "修改成功，请重新登录！！！");
                    return "updatePwd";
                }
                else {
                    model.addAttribute("protectionError", "原密保错误，请重新输入！！！");
                    return "updatePwd";
                }
            }
            else {
                num++;
            }
        }
        if(num == list.size()) {
            if(user_password != null && user_password != "") {
                model.addAttribute("passwordError", "原密码错误，请重新输入！！！");
                return "updatePwd";
            }
        }
        return null;
    }


}
