<script>
setCal()

function getTime() {
var now = new Date()
var hour = now.getHours()
var minute = now.getMinutes()
now = null
var ampm = "" 

if (hour >= 12) {
hour -= 12
ampm = "PM"
} else
ampm = "AM"
hour = (hour == 0) ? 12 : hour

if (minute < 10)
minute = "0" + minute // do not parse this number!

return hour + ":" + minute + " " + ampm
}

function leapYear(year) {
if (year % 4 == 0) // basic rule
return true // is leap year
return false // is not leap year
}

function getDays(month, year) {
var ar = new Array(12)
ar[0] = 31 // January
ar[1] = (leapYear(year)) ? 29 : 28 // February
ar[2] = 31 // March
ar[3] = 30 // April
ar[4] = 31 // May
ar[5] = 30 // June
ar[6] = 31 // July
ar[7] = 31 // August
ar[8] = 30 // September
ar[9] = 31 // October
ar[10] = 30 // November
ar[11] = 31 // December

return ar[month]
}

function getMonthName(month) {
var ar = new Array(12)
ar[0] = "January"
ar[1] = "February"
ar[2] = "March"
ar[3] = "April"
ar[4] = "May"
ar[5] = "June"
ar[6] = "July"
ar[7] = "August"
ar[8] = "September"
ar[9] = "October"
ar[10] = "November"
ar[11] = "December"

return ar[month]
}

function setCal() {
var now = new Date()
var year = now.getYear()
if (year < 1000)
year+=1900
var month = now.getMonth()
var monthName = getMonthName(month)
var date = now.getDate()
now = null

var firstDayInstance = new Date(year, month, 1)
var firstDay = firstDayInstance.getDay()
firstDayInstance = null

var days = getDays(month, year)

drawCal(firstDay + 1, days, date, monthName, year)
}

function drawCal(firstDay, lastDate, date, monthName, year) {
var headerHeight = 50 // height of the table's header cell
var border = 2 // 3D height of table's border
var cellspacing = 4 // width of table's border
var headerColor = "midnightblue" // color of table's header
var headerSize = "+3" // size of tables header font
var colWidth = 30 // width of columns in table
var dayCellHeight = 15 // height of cells containing days of the week
var dayColor = "darkblue" // color of font representing week days
var cellHeight = 20 // height of cells representing dates in the calendar
var todayColor = "red" // color specifying today's date in the calendar
var timeColor = "purple" // color of font representing current time

var text = "" // initialize accumulative variable to empty string
text += '<CENTER>'
text += '<TABLE BORDER=' + border + ' CELLSPACING=' + cellspacing + '>' // table settings
text += '<TH COLSPAN=7 HEIGHT=' + headerHeight + '>' // create table header cell
text += '<FONT COLOR="' + headerColor + '" SIZE=' + headerSize + '>' // set font for table header
text += monthName + ' ' + year 
text += '</FONT>' // close table header's font settings
text += '</TH>' // close header cell

var openCol = '<TD WIDTH=' + colWidth + ' HEIGHT=' + dayCellHeight + '>'
openCol += '<FONT COLOR="' + dayColor + '">'
var closeCol = '</FONT></TD>'

var weekDay = new Array(7)
weekDay[0] = "Sun"
weekDay[1] = "Mon"
weekDay[2] = "Tues"
weekDay[3] = "Wed"
weekDay[4] = "Thu"
weekDay[5] = "Fri"
weekDay[6] = "Sat"

text += '<TR ALIGN="center" VALIGN="center">'
for (var dayNum = 0; dayNum < 7; ++dayNum) {
text += openCol + weekDay[dayNum] + closeCol 
}
text += '</TR>'

var digit = 1
var curCell = 1

for (var row = 1; row <= Math.ceil((lastDate + firstDay - 1) / 7); ++row) {
text += '<TR ALIGN="right" VALIGN="top">'
for (var col = 1; col <= 7; ++col) {
if (digit > lastDate)
break
if (curCell < firstDay) {
text += '<TD></TD>';
curCell++
} else {
if (digit == date) { // current cell represent today's date
text += '<TD HEIGHT=' + cellHeight + '>'
text += '<FONT COLOR="' + todayColor + '">'
text += digit
text += '</FONT><BR>'
text += '<FONT COLOR="' + timeColor + '" SIZE=2>'
text += '<CENTER>' + getTime() + '</CENTER>'
text += '</FONT>'
text += '</TD>'
} else
text += '<TD HEIGHT=' + cellHeight + '>' + digit + '</TD>'
digit++
}
}
text += '</TR>'
}

text += '</TABLE>'
text += '</CENTER>'

document.write(text) 
}
</script>


		