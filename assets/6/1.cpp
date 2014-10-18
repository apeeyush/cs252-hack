#include <iostream>

int minBuyer(int* lst, int n){
	int index = 0;
	int min_buyer = lst[0];
	for (int i=0; i< lst.size(); i++){
		int purchase = lst[i];
		index = (index + purchase)%n;

	}

}