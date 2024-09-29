# AES (Advanced Encryption Standard)
AES  is a symmetric encryption algorithm widely used for secure data transmission. In this project, I implemented both encryption and decryption processes using AES, ensuring confidentiality by converting plaintext into ciphertext and back into plaintext.

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

![AES Encryption Algorithms](https://xilinx.github.io/Vitis_Libraries/security/2019.2/_images/mixcolumns.png)

## Key Expantion
Key Expansion in AES generates a series of round keys from the original encryption key. This process involves the use of the AES S-box, rotation, and XOR operations to produce a new key for each round of encryption. The expanded keys are essential for driving the encryption and decryption in each round.

![](https://img.brainkart.com/imagebk9/HbLkjBr.jpg)

# AES IMPLEMENTATION

In this project, I chose an **Unfolded not pipelined** implementation, where all rounds of encryption or decryption are performed in parallel without iteration. This approach maximizes speed by reducing the need for looping or iteration at the cost of using more space.

**Advantages**: Significantly faster execution due to parallel processing of all rounds. **Disadvantages**: Requires more hardware resources, making it less space-efficient.

![Working strides of proposed generalized AES](https://www.researchgate.net/publication/362313045/figure/fig1/AS:11431281261510565@1721649554023/Working-strides-of-proposed-generalized-AES.png)

Decryption in AES reverses the encryption process, using the same expanded keys generated during key expansion. It includes modules like InvSubBytes, which reverses the byte substitution using the inverse S-box, InvShiftRows to restore the original row positions, and InvMixColumns to reverse the column mixing transformation. These operations work in reverse order compared to encryption, effectively recovering the original plaintext. We implement this decryption process as shown in the following image.

![AES Encryption/Decryption Flowchart | Download Scientific Diagram](https://www.researchgate.net/publication/221958203/figure/fig2/AS:339550586064915@1457966576426/AES-Encryption-Decryption-Flowchart.png)

