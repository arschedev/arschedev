/**
 * Copyright (c) 2022 arschedev
 */

#include <regex>
#include <sstream>
#include <string>
#include <vector>

namespace str2
{
  /**
   * EMPTY_STR
   */
  const std::string EMPTY_STR;

  /**
   * trim()
   */
  std::string trim(std::string string)
  {
    // trim left
    string = std::regex_replace(string, std::regex("^\\s+"), EMPTY_STR);
    // trim right
    string = std::regex_replace(string, std::regex("\\s+$"), EMPTY_STR);

    return string;
  }

  /**
   * split()
   */
  std::vector<std::string> split(std::string string, char delimiter)
  {
    std::vector<std::string> substrings;

    std::stringstream ss(string);
    while (ss.good())
    {
      std::string substring;
      std::getline(ss, substring, delimiter);
      substrings.push_back(substring);
    }

    return substrings;
  }

  /**
   * includes()
   */
  bool includes(std::string string, std::string substring)
  {
    return string.find(substring) != std::string::npos;
  }
}