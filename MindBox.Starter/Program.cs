using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MindBox.Logic.Figures;

namespace MindBox.Starter
{
	class Program
	{
		static void Main(string[] args)
		{

			IFigura figureT = new Triangle(3, 5, 4);
			IFigura figureC = new Circle(2);
			IFigura figureS = new Square(4);

			var list = new List<IFigura> { figureC, figureT, figureS };
			list.ForEach(f => Console.WriteLine($"{f} имеет площадь {f.CalcSquare().ToString("F")}"));

			Console.WriteLine();

			Console.WriteLine(((Triangle)figureT).IsRightangled);

			Console.ReadKey();
		}
	}
}
