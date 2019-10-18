package com.hibernate.dao;

import java.util.List;
import java.nio.channels.SeekableByteChannel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.ListIterator;

import javax.jws.soap.SOAPBinding.Use;
import javax.management.Query;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.hibernate.been.News;


public class NewDAO {

	Configuration configuration = new Configuration().configure();
	SessionFactory sessionFactory = configuration.buildSessionFactory();
	
	public List<News> getAllNew(){
		Transaction transaction = null;
		List<News> listNew = null;
		Session session = sessionFactory.openSession();	
		try {
			transaction = session.beginTransaction();
			listNew = session.createQuery("FROM News ORDER BY publisher desc").list();
			transaction.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return listNew;
	}
	
	
	public void addNew(News news) {
		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(news);
			transaction.commit();
			System.out.println("\n\n Add New Success \n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}
	}
	public News getNew(int id) {

	        Transaction transaction = null;
	        News news = null;
	        try {
	        	Session session = sessionFactory.openSession();
	            transaction = session.beginTransaction();
	            news = (News)session.get(News.class, id);
	            
	            transaction.commit();
	        } catch (Exception e) {
	            if (transaction != null) {
	                transaction.rollback();
	            }
	            e.printStackTrace();
	        }
	        return news;
	}
	
	// update information New
	public void updateNew(News news) {
			Transaction transaction = null;
			try {
				Session session = sessionFactory.openSession();
				transaction = session.beginTransaction();
				session.update(news);
				transaction.commit();
			}
			catch (Exception e) {
				// TODO: handle exception
				if(transaction !=null) {
					transaction.rollback();
				}
				e.printStackTrace();
			}
	}
	public void deleteNew(int id) {
			Transaction transaction = null;
			try {
				Session session = sessionFactory.openSession();
				transaction = session.beginTransaction();
				News news = (News) session.get(News.class,id);
				session.delete(news);
				transaction.commit();
				
			}
			catch (Exception e) {
				// TODO: handle exception
				if(transaction !=null) {
					transaction.rollback();
				}
				e.printStackTrace();
			}
	}
}
