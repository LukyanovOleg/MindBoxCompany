using System;

namespace MindBox.Logic.Figures
{
	public class Square : IFigura
	{
		public double Side { get; private set; }

		public Square(double side)
		{
			if (side <= 0)
				throw new ArgumentException("Неверный аргумент");

			Side = side;
		}

		public double CalcSquare()
		{
			var result = Side * Side;

			return result;
		}

		public override string ToString()
		{
			return $"Квадрат со стороной {Side}";
		}
	}
}
