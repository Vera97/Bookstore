package myService;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import myBeans.Book;
import myBeans.BookOrder;
import myBeans.User;
/*
 * User鐨勪笟鍔￠�杈戝眰
 */
import myDao.UserDao;


public class UserService {
	private UserDao userDao = new UserDao();
	/*
	 * 鐧诲綍鍔熻兘
	 */
	public void Login(User user) throws SQLException, UserException{
		User u=userDao.finByEmailAndPsd(user.getEmail(), user.getPassword());
		System.out.println("service...."+user.getEmail()+"..."+user.getPassword());
		if(u!=null){
			return;
		}else{
			throw new UserException("请检查你的账号密码是否正确");
		}
	}
	public void Regist(User user) throws SQLException,UserException{
		User u=userDao.findByEmail(user.getEmail());
		if(u==null){
			userDao.addUser(user);
			
		}else{
			throw new UserException("该邮箱已被注册，请直接登陆");
		}
	}
	public List<Book> BookSearch(String keyword) throws SQLException, UserException{
		List<Book> books=userDao.findByKeywords(keyword);
		for(int i=0 ;i<books.size();i++){
		       System.out.println(books.get(i).toString());
		       }
		System.out.println("in userService......"+"book.size()"+books.size());
	    if(books.size()==0){	
	    	throw new UserException ("抱歉，查询不到您需要的图书");
	    }
		return books;
	}
	public List<BookOrder> SearchAllOrder(String uid) throws SQLException ,UserException{
	    List<BookOrder> bookorder=userDao.findAllBookorderByUserid(uid);
	    if(bookorder.size()==0){
	    	throw new UserException ("您还没有订单呢");
	    
	    }
	    
		return bookorder;
		
	}
	public List<BookOrder> SearchDoneOrder(String uid) throws SQLException ,UserException{
	    List<BookOrder> bookorder=userDao.findDoneBookorderByUserid(uid);
	    if(bookorder.size()==0){
	    	throw new UserException ("您还没有订单呢");
	    
	    }
	    
		return bookorder;
		
	}
	public List<BookOrder> SearchUndoneOrder(String uid) throws SQLException ,UserException{
	    List<BookOrder> bookorder=userDao.findUndoneBookorderByUserid(uid);
	    if(bookorder.size()==0){
	    	throw new UserException ("您还没有订单呢");
	    
	    }
	    
		return bookorder;
		
	}
	public List<Book> SearchAllBookByOrder(List<BookOrder> bookorder) throws SQLException ,UserException{
	    
	    
	    Book b;
	    List<Book> books = new ArrayList<Book>();
	    for(int i=0;i<bookorder.size();i++){
	    	b=userDao.findBookByBookid(bookorder.get(i).getBookid());
	    	
	    	books.add(b);
	    }
		return books;
		
	}
	public void addUnfinOrder(List<BookOrder> bookorder) throws SQLException{
		
		for(int i=0;i<bookorder.size();i++){
			
				userDao.addOrder(bookorder.get(i));
			
		}
	}
	public void setOrderDone(String uid,String date) throws SQLException{
		userDao.setOrderDone(uid, date);
	}
	
	public List finAllBook() throws SQLException{
		return userDao.findAllBook();
	}
	public List finBookByTag(String tag) throws SQLException {
		return userDao.findBookByTag(tag);
	}
	/*public List finOtherBookByTag(String tag1,String tag2,String tag3,String tag4,String tag5,String tag6) throws SQLException {
		
		return userDao.findBookByTag(tag1,tag2,tag3,tag4,tag5,tag6);
	}*/

}
