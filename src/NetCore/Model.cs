using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NetCore
{
  public class Model
  {
    public Model()
    {
    }

    public bool ReplySame(bool value)
    {
      return value;
    }

    public bool ReplyInverted(bool value)
    {
      return !value;
    }
  }
}
