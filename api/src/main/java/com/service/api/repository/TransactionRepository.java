package com.service.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.service.api.entity.Transaction;

/**
 */
@Repository
public interface TransactionRepository extends JpaRepository<Transaction, String> {
	Transaction findById(Long transactionId);
	void deleteById(Long id);
	
}
