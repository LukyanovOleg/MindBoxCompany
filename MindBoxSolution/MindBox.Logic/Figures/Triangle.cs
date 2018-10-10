using System;

namespace MindBox.Logic.Figures
{
	public class Triangle : IFigura
	{
		public double SideA { get; private set; }

		public double SideB { get; private set; }

		public double SideC { get; private set; }

		public Triangle(double sideA, double sideB, double sideC)
		{
			if (sideA <= 0 || sideB <= 0 || sideC <= 0)
				throw new ArgumentException("Неверный аргумент");

			SideA = sideA;
			SideB = sideB;
			SideC = sideC;
		}

		public double CalcSquare()
		{
			var halfPerimetr = (SideA + SideB + SideC) / 2.0;

			var result = Math.Sqrt(halfPerimetr * (halfPerimetr - SideA) * (halfPerimetr - SideB) * (halfPerimetr - SideC));

			return result;
		}

		public bool IsRightangled
		{
			get
			{
				var sideAS = SideA * SideA;
				var sideBS = SideB * SideB;
				var sideCS = SideC * SideC;

				if (sideAS + sideBS == sideCS)
					return true;
				else if (sideAS + sideCS == sideBS)
					return true;
				else if (sideBS + sideCS == sideAS)
					return true;

				return false;
			}
		}

		public override string ToString()
		{
			return $"Треугольник со сторонами {SideA}, {SideB}, {SideC}";
		}
	}
}
