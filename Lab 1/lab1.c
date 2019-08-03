void TwosComplement(const int input[8], int output[8]){ //changing sign of binary number
	int i, first_found;
	first_found = 0;
	for (i = 0; i < 8; i++){
		if (input[i] == 0 && first_found == 0){ //checking if the bit is 0 and if the first bit was not found yet
			output[i] = 0;
		}
		else if(input[i] == 0 && first_found == 1){ //checking if the bit is 0 and the first bit was found
			output[i] = 1;
		}
		else if(input[i] == 1 && first_found == 0){ //checking if the bit is 1 and the first bit was not found
			output[i] = 1;
			first_found = 1;
		}	
		else if(input[i] == 1 && first_found == 1){ //checking if the bit is 1 and the first bit was found
			output[i] = 0;
		}
	}
}

float Bin2Dec(const int bin[8]){ //changing from binary to decimal
	int i;
	float polynomial = 0;
	for (i = 6; i >= 0; i--){ //running through all the bits except the most significant bit
		polynomial = 2*polynomial + bin[i];
	}
	if (bin[7] == 1){
		polynomial = polynomial - 128; //if the number is negative, will make the most significant bit value negative
	}
	return polynomial/128;
}

void Dec2Bin(const float x, int bin[8]){ //changing from decimal to binary
	int n;
	float value;
	value = 128* fabs(x); //making the float an absolute value
	
	n = (int) value;
	if (n != 127 && (value - n) >= 0.5){ //to take care of rounding
		n++;
	}
	for (int i = 0; i < 8; i++){ //running through the bits
		bin[i] = n%2;
		n = n/2;
	}
	if (x < 0){ //checks if the float value is negative
		TwosComplement(bin,bin); //runs the TwosComplement Program
	}
	return;
}
