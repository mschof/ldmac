// Compile: g++ -std=c++0x -g -O2 -march=native -mtune=native ldmac.cpp -o ldmac -lcrypto -lm

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <iostream>
#include <sstream>
#include <fstream>
#include <iomanip>
#include "gift/encrypt.c"

typedef unsigned char uchar;
typedef unsigned int uint32;
typedef unsigned long long int uint64;

std::string to_string(void* source, uint32 num_bytes) {
  uchar* pointer = (uchar*)source;
  std::ostringstream string_stream;
  for(uint32 i = 0; i < num_bytes; i++) {
    string_stream << std::setfill('0') << std::setw(2) << std::hex << (uint32)(pointer[num_bytes - i - 1]);
  }
  std::string ret_string = string_stream.str();
  return ret_string;
}

// Accepts only messages where num_message_bytes % 8 = 0
int ldmac_gift_64_2(uchar* message, uint32 num_message_bytes, uchar* initial_state, uchar* key, uchar* tag) {
  uint32 num_block_bytes = 8;
  uint32 t = 2;

  if(num_message_bytes % num_block_bytes != 0) {
    std::cout << "Error: num_message_bytes % num_block_bytes != 0" << std::endl;
    return 1;
  }

  // Hard-coded
  uchar key_1[num_block_bytes*t];
  uchar key_2[num_block_bytes*t];
  uchar temp[num_block_bytes*t];
  memcpy(key_1, key, num_block_bytes*t);
  memcpy(key_2, key + num_block_bytes, num_block_bytes);
  memcpy(key_2 + num_block_bytes, key, num_block_bytes);
  memset(temp, 0x0, num_block_bytes*t);

  // Process message
  uint32 num_message_blocks = num_message_bytes / num_block_bytes;

  // First message block
  for(uint32 j = 0; j < t; j++) {
    *((uint64*)(tag + (j*num_block_bytes))) = *((uint64*)(initial_state + (j*num_block_bytes))) ^ *((uint64*)message);
  }

  // Process blocks
  for(uint32 i = 1; i < num_message_blocks; i++) {
    // Process branches
    for(uint32 j = 0; j < t; j++) {
      gift64_perm_ecb(temp + (j*num_block_bytes), tag + (j*num_block_bytes), num_block_bytes);
      *((uint64*)(tag + (j*num_block_bytes))) = *((uint64*)(temp + (j*num_block_bytes))) ^ *((uint64*)(message + (i*num_block_bytes)));
    }
  }

  gift64_encrypt_ecb(temp, tag, num_block_bytes, key_1);
  gift64_encrypt_ecb(temp + num_block_bytes, tag + num_block_bytes, num_block_bytes, key_2);
  memcpy(tag, temp, num_block_bytes*t);
  
  return 0;
}



int main(int argc, char** argv) {

  uint32 state_size = 16;
  uint32 message_size = 16;
  uchar message[message_size];
  uchar initial_state[state_size];
  uchar key[state_size];
  uchar tag[state_size];

  // 1
  memset(message, 0x0, message_size);
  memset(initial_state, 0x12, state_size / 2);
  memset(initial_state + state_size / 2, 0x34, state_size / 2);
  memset(key, 0xAB, state_size);
  memset(tag, 0x0, state_size);
  std::cout << "Initial state:" << std::endl;
  std::cout << to_string(initial_state, state_size) << std::endl;
  std::cout << "Message:" << std::endl;
  std::cout << to_string(message, message_size) << std::endl;
  std::cout << "Key:" << std::endl;
  std::cout << to_string(key, state_size) << std::endl;
  ldmac_gift_64_2(message, message_size, initial_state, key, tag);
  std::cout << "Tag:" << std::endl;
  std::cout << to_string(tag, state_size) << std::endl;

  // 2
  memset(message, 0x42, message_size);
  memset(initial_state, 0x12, state_size / 2);
  memset(initial_state + state_size / 2, 0x34, state_size / 2);
  memset(key, 0xAB, state_size);
  memset(tag, 0x0, state_size);
  std::cout << "Initial state:" << std::endl;
  std::cout << to_string(initial_state, state_size) << std::endl;
  std::cout << "Message:" << std::endl;
  std::cout << to_string(message, message_size) << std::endl;
  std::cout << "Key:" << std::endl;
  std::cout << to_string(key, state_size) << std::endl;
  ldmac_gift_64_2(message, message_size, initial_state, key, tag);
  std::cout << "Tag:" << std::endl;
  std::cout << to_string(tag, state_size) << std::endl;

  // 3
  memset(message, 0xFF, message_size);
  memset(initial_state, 0x12, state_size / 2);
  memset(initial_state + state_size / 2, 0x34, state_size / 2);
  memset(key, 0xAB, state_size);
  memset(tag, 0x0, state_size);
  std::cout << "Initial state:" << std::endl;
  std::cout << to_string(initial_state, state_size) << std::endl;
  std::cout << "Message:" << std::endl;
  std::cout << to_string(message, message_size) << std::endl;
  std::cout << "Key:" << std::endl;
  std::cout << to_string(key, state_size) << std::endl;
  ldmac_gift_64_2(message, message_size, initial_state, key, tag);
  std::cout << "Tag:" << std::endl;
  std::cout << to_string(tag, state_size) << std::endl;

  return 0;
}
