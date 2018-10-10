using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MindBox.Logic.Figures;

namespace MindBoxUnitTest
{
	[TestClass]
	public class UnitTestFigure
	{
		[TestMethod]
		public void TestCircleSquare()
		{
			//arrange
			IFigura circle = new Circle(10);

			//act
			var square = circle.CalcSquare();
			var rounded = Math.Round(square, 2);

			//assert
			Assert.AreEqual(rounded, 314.16);
		}

		[TestMethod]
		public void TestTringleSquare()
		{
			//arrange
			IFigura triangle = new Triangle(3,4,5);

			//act
			var square = triangle.CalcSquare();
			var rounded = Math.Round(square, 2);

			//assert
			Assert.AreEqual(rounded, 6);

		}

		[TestMethod]
		public void TestSquareSquare()
		{
			//arrange
			IFigura squareF = new Square(10);

			//act
			var square = squareF.CalcSquare();
			var rounded = Math.Round(square, 2);

			//assert
			Assert.AreEqual(rounded, 100);

		}

		[TestMethod]
		public void TestException()
		{ 
			//assert
			Assert.ThrowsException<ArgumentException>(() => new Circle(0));

			Assert.ThrowsException<ArgumentException>(() => new Triangle(-1,2,3));

			Assert.ThrowsException<ArgumentException>(() => new Square(-12.3));
		}

		[TestMethod]
		public void TestTriangleRectangled()
		{
			//arrange
			Triangle triangleR = new Triangle(3, 4, 5);
			Triangle triangleUR = new Triangle(3, 4, 6);

			//assert
			Assert.IsTrue(triangleR.IsRightangled);

			//assert
			Assert.IsFalse(triangleUR.IsRightangled);
		}
	}
}
