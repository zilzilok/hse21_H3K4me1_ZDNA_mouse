# [Проект по майнору "Биоинформатика" ВШЭ](http://wiki.cs.hse.ru/%D0%9C%D0%B0%D0%B9%D0%BD%D0%BE%D1%80_%D0%91%D0%B8%D0%BE%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%82%D0%B8%D0%BA%D0%B0_2_%D0%B3%D0%BE%D0%B4)
## Сафин Тагир Наилевич, 2 группа


|   Организм  |   Стр. ДНК   | Тип клеток | Гистоновая метка |    файл 1   |    файл 2   |
|:-----------:|:------------:|:----------:|:----------------:|:-----------:|:-----------:|
| mouse(mm10) | ZDNA_mouse_1 |   ES-E14   |      H3K4me1     | [ENCFF158GBZ](https://www.encodeproject.org/files/ENCFF158GBZ/) | [ENCFF147SYC](https://www.encodeproject.org/files/ENCFF147SYC/) |

### Анализ пиков гистоновой метки

**Скачиваем файлы ChIP-seq экспериментов из ENCODE (пики гистоновой метки).**

- ENCFF158GBZ
```bash
wget https://www.encodeproject.org/files/ENCFF158GBZ/@@download/ENCFF158GBZ.bed.gz
zcat ENCFF158GBZ.bed.gz | cut -f1-5 > H3K4me1_ES-E14.ENCFF158GBZ.mm10.bed
```
- ENCFF147SYC
```bash
wget https://www.encodeproject.org/files/ENCFF147SYC/@@download/ENCFF147SYC.bed.gz
zcat ENCFF147SYC.bed.gz | cut -f1-5 > H3K4me1_ES-E14.ENCFF147SYC.mm10.bed
```

**Строим гистограмму длин участков для каждого эксперимента.**

![](results/len_hist/len_hist.H3K4me1_ES-E14.ENCFF147SYC.mm10.png)
![](results/len_hist/len_hist.H3K4me1_ES-E14.ENCFF158GBZ.mm10.png)

**Среди ChIP-seq пиков для нужной версии генома (hg19 для человека и mm10 для мыши) выкидываем слишком длинные пики (>= 1000)**

init ENCFF147SYC             |  fitered ENCFF147SYC
:-------------------------:|:-------------------------:
![](results/filter_peaks/filter_peaks.H3K4me1_ES-E14.ENCFF158GBZ.mm10.init.hist.png)  |  ![](results/filter_peaks/filter_peaks.H3K4me1_ES-E14.ENCFF158GBZ.mm10.filtered.hist.png)

init ENCFF147SYC             |  fitered ENCFF147SYC
:-------------------------:|:-------------------------:
![](results/filter_peaks/filter_peaks.H3K4me1_ES-E14.ENCFF147SYC.mm10.init.hist.png)  |  ![](results/filter_peaks/filter_peaks.H3K4me1_ES-E14.ENCFF147SYC.mm10.filtered.hist.png)

