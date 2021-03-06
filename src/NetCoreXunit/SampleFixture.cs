﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;

namespace NetCoreXunit
{
  public class SampleFixture
  {
    [Fact]
    public void PassingTest()
    {
      Assert.Equal(4, Add(2, 2));
    }

    [Fact(Skip = "Hardcoded to fail")]
    public void FailingTest()
    {
      Assert.Equal(5, Add(2, 2));
    }

    int Add(int x, int y)
    {
      return x + y;
    }
  }
}