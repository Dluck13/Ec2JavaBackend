import java.math.BigDecimal;

import java.text.DateFormat;

import javax.persistence.Query;

import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Entities.ReimbursementEntity;
import java.util.List;

public class ReimbursementMain {

	public static void main(String[] args) {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		System.out.println("begin transaction");

		ReimbursementEntity addNewReim = new ReimbursementEntity(0,2, 4, 1, DateFormat.getDateInstance(), BigDecimal.ZERO, "hotel",
				"expedia");

		session.save(addNewReim);
		System.out.println("reimbursement saved");

		transaction.commit();
		System.out.println("reimbursment committed");

		session.close();
		System.out.println("closed");
	}

//--------------------------------------------------------------------------------------------------

	{
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		ReimbursementEntity deleteReim = new ReimbursementEntity(7, 2, 4, 1, DateFormat.getDateInstance(), BigDecimal.ZERO, "hotel",
				"expedia");

		session.delete(deleteReim);
		System.out.println("reimbursement deleted");

		transaction.commit();
		System.out.println("reimbursment committed");

		session.close();
		System.out.println("closed");
	}

	// -------------------------------------------------------------------------------------------------

	{
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		ReimbursementEntity updateReim = new ReimbursementEntity(7, 2, 4, 1, DateFormat.getDateInstance(), BigDecimal.ZERO, "travel",
				"expedia");

		session.update(updateReim);
		System.out.println("reimbursement deleted");

		transaction.commit();
		System.out.println("reimbursment committed");

		session.close();
		System.out.println("closed");
	}

	// -----------------------------------------------------------------------------------------------
	{
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		ReimbursementEntity saveReim = new ReimbursementEntity(7, 2, 4, 1, DateFormat.getDateInstance(), BigDecimal.ZERO, "travel",
				"expedia");

		session.save(saveReim);
		System.out.println("reimbursement deleted");

		transaction.commit();
		System.out.println("reimbursment committed");

		session.close();
		System.out.println("closed");
	}

	// -------------------------------------------------------------------------------------------
	{
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		ReimbursementEntity fetchedReim = session.find(ReimbursementEntity.class, 2);
		System.out.println(fetchedReim);

		transaction.commit();
		System.out.println(fetchedReim);

		session.close();
		System.out.println("closed");

		HibernateUtil.shutdown();
	}

	{

		{
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();

			String hqlQuery = "FROM ReimbursementEntity";
			Query query = session.createQuery(hqlQuery);
			List<ReimbursementEntity> allReimburements = query.getResultList();

			allReimburements.forEach((reimbursement) -> System.out.println(reimbursement));

			transaction.commit();
			System.out.println("commited");

			session.close();
			System.out.println("closed");

			HibernateUtil.shutdown();
		}

	}
}

	
	
	
	




