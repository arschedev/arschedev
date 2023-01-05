/**
 * Copyright (c) 2023 arschedev
 */

#include <regex>
#include <sstream>
#include <string>
#include <vector>

namespace str2
{
  /**
   * @brief Empty string constant
   */
  const std::string EMPTY_STR;

  /**
   * @brief Returns given string trimmed at the edges
   *
   * @param string
   * @return std::string
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
   * @brief Returns given string splitted by char delimiter
   *
   * @param string
   * @param delim
   * @return std::vector of std::string`s
   */
  std::vector<std::string> split(std::string string, char delim)
  {
    std::vector<std::string> substrings;

    std::stringstream ss(string);
    while (ss.good())
    {
      std::string substring;
      std::getline(ss, substring, delim);
      substrings.push_back(substring);
    }

    return substrings;
  }

  /**
   * @brief Returns whether the string includes a substring
   *
   * @param string
   * @param substring
   * @return true
   * @return false
   */
  bool includes(std::string string, std::string substring)
  {
    return string.find(substring) != std::string::npos;
  }
}