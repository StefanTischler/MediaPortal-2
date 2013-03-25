#region Copyright (C) 2007-2013 Team MediaPortal

/*
    Copyright (C) 2007-2013 Team MediaPortal
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

using System.Runtime.Serialization;

namespace MediaPortal.Extensions.OnlineLibraries.Libraries.MovieDbV3.Data
{
  //{
  //      "backdrop_path": "/mOTtuakUTb1qY6jG6lzMfjdhLwc.jpg",
  //      "id": 10,
  //      "name": "Star Wars Collection",
  //      "poster_path": "/6rddZZpxMQkGlpQYVVxb2LdQRI3.jpg"
  //  },
  [DataContract]
  public class MovieCollection
  {
    [DataMember(Name = "id")]
    public int Id { get; set; }

    [DataMember(Name = "name")]
    public string Name { get; set; }

    [DataMember(Name = "backdrop_path")]
    public string BackdropPath { get; set; }

    [DataMember(Name = "poster_path")]
    public string PosterPath { get; set; }

    public override string ToString()
    {
      return Name;
    }
  }
}