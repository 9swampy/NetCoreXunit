using NetCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;
using FluentAssertions;

namespace NetCoreXunitB
{
  public class ModelFixtureB
  {
    [Fact]
    public void GivenInvertingLogicWhenInvertCalledThenShouldInvertResponse()
    {
      var sut = new Model();
      bool expected = (new Random().Next() % 2) == 1;

      sut.ReplyInverted(!expected).Should().Be(expected);
    }

    [Fact]
    public void GivenDirectLogicWhenReplySameCalledThenShouldReplySame()
    {
      var sut = new Model();
      bool expected = (new Random().Next() % 2) == 1;
      sut.ReplySame(expected).Should().Be(expected);
    }
  }
}
