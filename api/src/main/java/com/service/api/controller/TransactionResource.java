package com.service.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.service.api.entity.Transaction;
import com.service.api.repository.TransactionRepository;


/**
 */
@RestController
@CrossOrigin("*")
@RequestMapping("/transactions")
public class TransactionResource {
	
	@Autowired
	private TransactionRepository transactionRepository;


	@GetMapping("/")
	public ResponseEntity<List<Transaction>> getTransactions() {
		return ResponseEntity.ok().body(transactionRepository.findAll());
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Transaction> getTransactionById(@PathVariable("id") Long transactionId) {
		return ResponseEntity.ok().body(transactionRepository.findById(transactionId));
	}
	
	@PostMapping("/")
	public ResponseEntity<Transaction> addTransaction(@RequestBody Transaction transaction) {	
		//TODO : Business Logics
		
		return ResponseEntity.ok().body(transactionRepository.save(transaction));
	}
	
	@PutMapping("/{transID}")
	public ResponseEntity<Transaction> updateTransaction(@PathVariable("transID") Long transactionId, @RequestBody Transaction transaction) {	
		//TODO : Business Logics
		return ResponseEntity.ok().body(transactionRepository.save(transaction));
	}
	
	@DeleteMapping("/{transId}")
	public ResponseEntity<Transaction> deleteTransaction(@PathVariable("transId") Long id) {	
		//TODO : Business Logics
		transactionRepository.deleteById(id);
		return ResponseEntity.ok().build();
	}
	
	
	
}
