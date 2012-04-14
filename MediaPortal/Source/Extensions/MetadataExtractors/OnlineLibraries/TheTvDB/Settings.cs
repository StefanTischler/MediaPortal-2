﻿#region Copyright (C) 2007-2012 Team MediaPortal

/*
    Copyright (C) 2007-2012 Team MediaPortal
    http://www.team-mediaportal.com

    This file is part of MediaPortal 2

    MediaPortal 2 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    MediaPortal 2 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with MediaPortal 2. If not, see <http://www.gnu.org/licenses/>.
*/

#endregion

using System;
using System.IO;
using System.Xml.Serialization;

namespace MediaPortal.Extensions.OnlineLibraries.TheTvDB
{
  internal static class Settings
  {
    public static TE Load<TE>(string fileName)
    {
      try
      {
        XmlSerializer serializer = new XmlSerializer(typeof(TE));
        using (FileStream fileStream = new FileStream(fileName, FileMode.Open))
          return (TE)serializer.Deserialize(fileStream);
      }
      catch (Exception)
      {
        return default(TE);
      }
    }
    public static void Save<TE>(string fileName, TE settingsObject)
    {
      try
      {
        XmlSerializer serializer = new XmlSerializer(typeof(TE));
        using (FileStream fileStream = new FileStream(fileName, FileMode.Create))
          serializer.Serialize(fileStream, settingsObject);
      }
      catch (Exception)
      {
      }
    }
  }
}