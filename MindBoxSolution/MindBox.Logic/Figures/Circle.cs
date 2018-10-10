using System;

namespace MindBox.Logic.Figures
{
	public class Circle : IFigura
	{
		public double Radius { get; private set; }

		public Circle(double radius)
		{
			if (radius <= 0)
				throw new ArgumentException("Неверный аргумент");

			Radius = radius;
		}

		public double CalcSquare()
		{
			var result = Math.PI * Radius * Radius;

			return result;
		}

		public override string ToString()
		{
			return $"Круг с радиусом {Radius}";
		}
	}
}
