/**
 * Copyright (c) 2022 arschedev
 */

// Learning C++: Day 3
#include "string2.hpp"
#include <algorithm>
#include <cmath>
#include <iostream>
#include <regex>
#include <string>
#include <vector>
using std::cout;
using std::endl;
using std::getline;
using std::regex;
using std::regex_match;
using std::regex_replace;
using std::remove;
using std::sqrt;
using std::stod;
using std::string;
using std::to_string;
using std::vector;

void greet();
void start();
void clrscr();
void cout_v(vector<string> v);
void fix_v(vector<string> *v);

const regex NUMBER_REGEX = regex("-?\\d+(\\.\\d+)?");

int main()
{
  // title
  greet();

  // repeater
  bool dev = false;
  for (;;)
  {
    // >
    start();

    // input
    string input;
    getline(std::cin, input);
    input = str2::trim(input);

    // parse
    vector<string> inputs;

    // -> ""
    if (input == str2::EMPTY_STR)
    {
      continue;
    }
    // -> pattern
    else if (str2::includes(input, " ") || str2::includes(input, ","))
    {
      string inputf;
      if (!str2::includes(input, ","))
      {
        inputf = regex_replace(input, regex("\\s+"), ",");
      }
      else
      {
        inputf = input;
      }
      inputs = str2::split(inputf, ',');
      for (int i = 0; i < inputs.size(); i++)
      {
        inputs[i] = regex_replace(inputs[i], regex("\\s+"), str2::EMPTY_STR);
      }
      fix_v(&inputs);
      if (dev)
        cout_v(inputs);
    }
    // -> [a]x^2=0
    else if (regex_match(input, NUMBER_REGEX))
    {
      inputs = {input};
    }
    // -> command
    else
    {
      // help
      if (input == "help")
      {
        cout << "\n help: <a, b, c?> <a b c?> <command>\n Type \"commands\" for commands\n";
      }
      // cmds/commands
      else if (input == "cmds" || input == "commands")
      {
        cout << "\n commands: help, cmds/commands, cls/clear, info, exit, dev\n";
      }
      // cls/clear
      else if (input == "cls" || input == "clear")
      {
        clrscr();
        greet();
      }
      // info
      else if (input == "info")
      {
        cout << "\n info: version 0.1.0 by arschedev (https://github.com/arschedev)\n";
      }
      // exit
      else if (input == "exit")
      {
        cout << endl;
        break;
      }
      // dev
      else if (input == "dev")
      {
        cout << "\n dev mode enabled\n";
        dev = true;
      }
      //-
      else
      {
        cout << "\n\n! Invalid command or input data !\n\n";
      }

      continue;
    }

    // variables
    bool inputs_valid;
    for (string x : inputs)
    {
      inputs_valid = (regex_match(x, NUMBER_REGEX));
      if (inputs_valid)
        continue;
      else
        break;
    }
    if (!inputs_valid)
    {
      cout << "\n\n! Invalid input data !\n\n";
    }
    else
    {
      double a, b, c;
      try
      {
        // string to double
        a = stod(inputs[0]),
        b = (inputs.size() > 1) ? stod(inputs[1]) : 0.0,
        c = (inputs.size() > 2) ? stod(inputs[2]) : 0.0;
      }
      catch (...)
      {
        cout << "\n\n! Calculation error occurred !\n\n";
        continue;
      }

      // math
      double D = (b * b - 4 * a * c);
      string r1, r2;
      if (D < 0)
      {
        r1 = r2 = "No solution. Discriminant < 0";
      }
      else
      {
        double D_sqrt = sqrt(D);
        r1 = to_string((-b + D_sqrt) / (2 * a)),
        r2 = to_string((-b - D_sqrt) / (2 * a));
      }

      // output
      cout << endl;
      cout << " D: " << D << endl;
      cout << " x1: " << r1 << endl;
      cout << " x2: " << r2 << endl;
      cout << endl;
    }

    // repeat
  }

  return 0;
}

void greet()
{
  cout << "\n ===========\n - QUADEQUS\n  Quadratic\n   Equation\n     Solver\n ===========\n\n Type \"help\" for help\n";
}

void start()
{
  cout << " > ";
}

void clrscr()
{
  // CSI[2J - clear screen, CSI[H - move cursor to start position
  cout << "\x1B[2J\x1B[H";
}

void cout_v(vector<string> v)
{
  for (string x : v)
  {
    cout << "<" << x << ">";
  }
  cout << endl;
}

void fix_v(vector<string> *v)
{
  v->erase(remove(v->begin(), v->end(), str2::EMPTY_STR), v->end());
}