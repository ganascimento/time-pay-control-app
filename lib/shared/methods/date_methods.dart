class DateMethods {
	String getDayText(DateTime date) {
		switch (date.month) {
			case 1:
				return 'Janeiro de ${date.year}';
				break;
			case 2:
				return 'Fevereiro de ${date.year}';
				break;
			case 3:
				return 'Março de ${date.year}';
				break;
			case 4:
				return 'Abril de ${date.year}';
				break;
			case 5:
				return 'Maio de ${date.year}';
				break;
			case 6:
				return 'Junho de ${date.year}';
				break;
			case 7:
				return 'Julho de ${date.year}';
				break;
			case 8:
				return 'Agosto de ${date.year}';
				break;
			case 9:
				return 'Setembro de ${date.year}';
				break;
			case 10:
				return 'Outubro de ${date.year}';
				break;
			case 11:
				return 'Novembro de ${date.year}';
				break;
			case 12:
				return 'Dezembro de ${date.year}';
				break;
			default:
				return '';
		}
	}

	String getMonthShortText(int weekday) {
		switch (weekday) {
			case 1:
				return 'Seg';
				break;
			case 2:
				return 'Ter';
				break;
			case 3:
				return 'Qua';
				break;
			case 4:
				return 'Qui';
				break;
			case 5:
				return 'Sex';
				break;
			case 6:
				return 'Sab';
				break;
			case 7:
				return 'Dom';
				break;
			default:
				return '';
		}
	}
}