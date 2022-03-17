package Service;

import java.util.LinkedList;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import DAO.FinanceManagerDao;
import POJO.Employee;
import POJO.Reimbursement;

public class FinanceManagerService {

	private final static Logger log = LogManager.getLogger(FinanceManagerService.class);
	
	public static LinkedList<Reimbursement> getPendingReimbursements()
	{
		
		try {
			return FinanceManagerDao.getPendingReimbursements();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.warn(e.getMessage());
			return new LinkedList<Reimbursement>();
		}
		
	}
	public static LinkedList<Reimbursement> getCompletedReimbursements()
	{
		
		try {
			return FinanceManagerDao.getCompletedReimbursements();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.warn(e.getMessage());
			return new LinkedList<Reimbursement>();
		}
		
	}
	public static LinkedList<Reimbursement> getAllReimbursements()
	{
		
		try {
			return FinanceManagerDao.getAllReimbursements();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.warn(e.getMessage());
			return new LinkedList<Reimbursement>();
		}
		
	}
	public static LinkedList<Reimbursement> getEmployeeReimbursements(int employee)
	{
		
		try {
			return FinanceManagerDao.getEmployeeReimbursements(employee);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.warn(e.getMessage());
			return new LinkedList<Reimbursement>();
		}
		
	}
	public static LinkedList<Employee> getAllEmployees()
	{
		
		try {
			return FinanceManagerDao.getAllEmployees();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.warn(e.getMessage());
			
			return new LinkedList<Employee>();
		}
		
	}
	public static Reimbursement updateReimbursement(Reimbursement rUpdate) {
		try {
			return FinanceManagerDao.updateReimbursement(rUpdate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.warn(e.getMessage());
			return new Reimbursement();
		}
	}
	
}
