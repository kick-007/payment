import { Component, Inject } from '@angular/core';
import { MatDialogRef, MatDialog, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Transaction } from '../transaction/transaction.model';
import { TransactionService } from '../transaction/transaction.service';

@Component({
  selector: 'app-add-transaction',
  templateUrl: './add-transaction.component.html',
  styleUrls: ['./add-transaction.component.scss']
})
export class AddTransactionComponent{
  transaction: any;
  constructor(
    @Inject(MAT_DIALOG_DATA) private data: any,
    private transactionService: TransactionService,
    private dialogRef: MatDialogRef<AddTransactionComponent>) {
        console.log(data);
        this.transaction = {
          toAcc : '',
          fromAcc : '',
          amount : '',
          date : '',
          currencyType : ''
        };
    }

  close(): void {
    this.dialogRef.close(false);
  }

  addTransaction() {
    this.transaction.toAcc = this.transaction.toAcc.toUpperCase();
    this.transaction.fromAcc = this.transaction.fromAcc.toUpperCase();
    this.transactionService.addTransaction(this.transaction).subscribe((res: any) => {
      this.dialogRef.close(true);
    }, (res: any) => {
      alert(res.error);
    });
  }

}
