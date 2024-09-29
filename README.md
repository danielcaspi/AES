# AES (Advanced Encryption Standard)
AES  is a symmetric encryption algorithm widely used for secure data transmission. In this project, I implemented both encryption and decryption processes using AES, ensuring confidentiality by converting plaintext into ciphertext and back into plaintext. key size 128bits.

# Basic modules
## Sub Bytes
The SubBytes step in AES is a non-linear byte substitution that uses an S-box to replace each byte of the state with its corresponding value. 

SBox table:
![image](https://github.com/user-attachments/assets/c8f10831-7c10-42f5-8ff2-5ea3693c4d66)


## Shift Rows
hiftRows is a step in AES where rows of the state matrix are cyclically shifted.




![קובץ:AES ShiftRows.jpg – ויקיפדיה](https://upload.wikimedia.org/wikipedia/commons/b/b6/AES_ShiftRows.jpg)

## Mix Columns
Mix Columns is an AES operation that mixes the data within each column of the state matrix by multiplying it with a fixed 4x4 matrix in the Galois Field.

![image](https://github.com/user-attachments/assets/69197632-4ab6-49f9-a679-0d942364f3e8)


## Key Expantion
Key Expansion in AES generates a series of round keys from the original encryption key. This process involves the use of the AES S-box, rotation, and XOR operations to produce a new key for each round of encryption. The expanded keys are essential for driving the encryption and decryption in each round.

![](https://img.brainkart.com/imagebk9/HbLkjBr.jpg)

# AES IMPLEMENTATION

In this project, I chose an **Unfolded not pipelined** implementation, where all rounds of encryption or decryption are performed in parallel without iteration. This approach maximizes speed by reducing the need for looping or iteration at the cost of using more space.

**Advantages**: Significantly faster execution due to parallel processing of all rounds.

**Disadvantages**: Requires more hardware resources, making it less space-efficient.

![image](https://github.com/user-attachments/assets/f53d84e2-044c-4712-9d8a-4ca42854f6c7)

## Decryption
Decryption in AES reverses the encryption process, using the same expanded keys generated during key expansion. It includes modules like InvSubBytes, which reverses the byte substitution using the inverse S-box, InvShiftRows to restore the original row positions, and InvMixColumns to reverse the column mixing transformation. These operations work in reverse order compared to encryption, effectively recovering the original plaintext. We implement this decryption process as shown in the following image.

![image](https://github.com/user-attachments/assets/00133cd9-3034-4e0f-81ab-1a5a1ffeb97e)

