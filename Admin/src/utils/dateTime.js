import moment from "moment";

export const DATE_TIME_FORMAT = "YYYY/MM/DD - hh:mm:ss";

export const DateTime = (date, format = DATE_TIME_FORMAT) => {
    return moment(date).format(format);
}