/**
 * Copyright (c) 2023 arschedev
 */

/*
	. . . Command Line Arguments . . .
	<number of lines | "height" | "help">
		- number of lines: how many lines will be printed (default: INT_MAX)
		- "height": sets number of lines as your console buffer height
		- "help": prints this message

	. . . Information . . .
        - NGGYU (Never Gonna Give You Up)
        - Version 1.1.0
        - Source: https://github.com/arschedev/arschedev/tree/main/Projects/C++/NGGYU-the-Rickroll
*/

// Note: Windows only application

#include <cstdlib>
#include <climits>
#include <string>
#include <iostream>
#include <regex>
#include <ctime>
#include <Windows.h>
using std::string;
using std::cout;
using std::endl;
using std::regex_match;
using std::regex;
using std::srand;
using std::time;
using std::to_string;
using std::rand;

int randint(int max);

int main(int argc, char* argv[]) {
	// console size
	CONSOLE_SCREEN_BUFFER_INFO csbi;
	GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), &csbi);
	int c_width = csbi.dwSize.X;
	int c_height = csbi.dwSize.Y;

	// lines
	/* default */
	int lines = INT_MAX; // 2147483647

	// command line arguments
	if (argc >= 2) {
		string _help_ = ". . . Command Line Arguments . . .\n<number of lines | \"height\" | \"help\">\n\t- number of lines: how many lines will be printed (default: INT_MAX)\n\t- \"height\": sets number of lines as your console buffer height\n\t- \"help\": prints this message\n\n. . . Information . . .\n\t- NGGYU (Never Gonna Give You Up)\n\t- Version 1.1.0\n\t- Source: https://github.com/arschedev/arschedev/tree/main/Projects/C++/NGGYU-the-Rickroll\n";

		string input(argv[1]);

		if (input == "help") {
			cout << _help_ << endl;
			return 0;
		} else if (input == "height") {
			lines = c_height;
		} else if (regex_match(input, regex("[0-9]+"))) {
			lines = stoi(input);
		} else {
			cout << ". . . '" << input << "' is invalid argument . . .\n\n";
			cout << _help_ << endl;
			return 0;
		}
	}

	// random
	srand(time(NULL));

	// title & color
	system("title Get rickrolled :D . . . (https://github.com/arschedev/arschedev/tree/main/Projects/C++/NGGYU-the-Rickroll)");
	system("color 0a");

	// text & margins
	string text = " Never gonna give you up! Never gonna let you down! Never gonna run around and desert you! <3 ";
	int text_length = text.length();
	int margin = (c_width - text_length) / 2;

	// print
	for (int i = 0; i < lines; i++) {
		string margin_left, margin_right;
		for (int j = 0; j < margin; j++) {
			margin_left += to_string(randint(9));
			margin_right += to_string(randint(9));
		}
		cout << margin_left << text << margin_right;
		if (i < lines - 1) cout << endl; // goes \n after each line, but the last one
		Sleep(1);
	}

	// pause
	getchar();

	//
	return 0;
}

// utils
int randint(int max) {
	return rand() % (max + 1);
}
