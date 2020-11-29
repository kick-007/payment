package com.service.api.controller;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.node.BigIntegerNode;
import com.service.api.entity.Account;
import com.service.api.entity.Transaction;
import com.service.api.model.TransactionVM;
import com.service.api.repository.AccountRepository;
import com.service.api.repository.TransactionRepository;


/**
 */
@RestController
@CrossOrigin("*")
@RequestMapping("/custom/transactions")
public class TransactionCustomResource {
	
	@Autowired
	private TransactionRepository transactionRepository;
	@Autowired
	private AccountRepository accountRepository;
	
	@PostMapping("/")
	public ResponseEntity<String> addTransaction(@RequestBody TransactionVM transactionVM) throws Exception {	
		//TODO : Business Logics
		Account transferFrom = accountRepository.findByAccNo(transactionVM.getFromAcc()); 
		Account transferTo = accountRepository.findByAccNo(transactionVM.getToAcc()); 
		Transaction transaction = new Transaction();
		if(transferFrom == null) {
			return ResponseEntity.badRequest().body("Invalid Source Account Details");
		}
		if(transferTo == null) {
			return ResponseEntity.badRequest().body("Invalid Destination Account Details");
		}
		if(transferFrom.getAmount().intValue() < Integer.valueOf(transactionVM.getAmount()))  {
			return ResponseEntity.badRequest().body("Insufficient Account Balance!");
		}
		transaction.setAmount(BigInteger.valueOf(Integer.valueOf(transactionVM.getAmount())));
		transaction.setCurrencyType(transactionVM.getCurrencyType());
		transaction.setFromAcc(transferFrom);
		transaction.setToAcc(transferTo);
		transaction.setDate(transactionVM.getDate());
		transaction.setStatus("INPROGRESS");
		
		transactionRepository.save(transaction);
		transferFrom.setAmount(BigInteger.valueOf(transferFrom.getAmount().intValue() - transaction.getAmount().intValue()));
		transferTo.setAmount(BigInteger.valueOf(transferTo.getAmount().intValue() + transaction.getAmount().intValue()));
		accountRepository.save(transferFrom);
		accountRepository.save(transferTo);
		
		transaction.setStatus("SUCCESSFUL");
		transactionRepository.save(transaction);

		return ResponseEntity.ok().build();
	}
	

	
	
	
}
