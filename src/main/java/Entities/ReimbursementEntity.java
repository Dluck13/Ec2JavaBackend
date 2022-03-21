package Entities;

import java.math.BigDecimal;
import java.text.DateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="reimbursements")
public class ReimbursementEntity {
	@Id
	@Column
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int reimbursement_id = 0;
	@Column(name="employee_id")
	private int employeeId = 0;
	@Column(name="status_id")
	private int statustId = 0;
	@Column(name="type_id")
	private int typeId = 0;
	@Column(name="date_of_transaction")
	private DateFormat dateOfTransaction = DateFormat.getDateInstance();
	@Column(name="amount")
	private BigDecimal amount = BigDecimal.ZERO;
	@Column(name="details")
	private String details = "";
	@Column(name="merchant")
	private String merchant = "";
	
	public ReimbursementEntity() {
		
	}

	public ReimbursementEntity(int reimbursement_id, int employeeId, int satustId, int typeId, DateFormat dateOfTransaction,
			BigDecimal amount, String details, String merchant) {
		super();
		this.reimbursement_id = reimbursement_id;
		this.employeeId = employeeId;
		this.statustId = satustId;
		this.typeId = typeId;
		this.dateOfTransaction = dateOfTransaction;
		this.amount = amount;
		this.details = details;
		this.merchant = merchant;
	}

	public int getReimbursementId() {
		return reimbursement_id;
	}

	public void setReimbursementId(int reimbursementId) {
		this.reimbursement_id = reimbursementId;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public int getSatustId() {
		return statustId;
	}

	public void setSatustId(int satustId) {
		this.statustId = satustId;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public DateFormat getDateOfTransaction() {
		return dateOfTransaction;
	}

	public void setDateOfTransaction(DateFormat dateOfTransaction) {
		this.dateOfTransaction = dateOfTransaction;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getMerchant() {
		return merchant;
	}

	public void setMerchant(String merchant) {
		this.merchant = merchant;
	}

	@Override
	public String toString() {
		return "ReimbursementEntity [reimbursementId=" + reimbursement_id + ", employeeId=" + employeeId + ", satustId="
				+ statustId + ", typeId=" + typeId + ", dateOfTransaction=" + dateOfTransaction + ", amount=" + amount
				+ ", details=" + details + ", merchant=" + merchant + "]";
	}
	
	
	
	

}