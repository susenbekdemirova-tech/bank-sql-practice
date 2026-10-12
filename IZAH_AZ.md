# Layihənin Azərbaycan dilində izahı

Bu, süni məlumatlarla hazırlanmış tədris layihəsidir. Kod AI köməyi ilə hazırlanıb. Onu yükləmək mövzunu artıq bildiyin demək deyil: sorğuları işlət, nəticələri müqayisə et və məşqləri yerinə yetir.

## Cədvəllər
Customers — müştərilər. CustomerID hər müştərinin unikal nömrəsidir.
Accounts — hesablar. CustomerID hesabın hansı müştəriyə aid olduğunu göstərir.
Invoices — ödənilməli məbləğlər. AccountID onları hesaba bağlayır.
Payments — faktiki ödənişlər. InvoiceID ödənişin hansı sənədə aid olduğunu göstərir.
Burada borc = sənəddəki məbləğ − edilən ödənişlərin cəmi. Bu hesab balansı deyil.

## Əsas anlayışlar
PRIMARY KEY: hər sətri unikal tanıdır; eyni nömrə təkrarlana bilməz.
FOREIGN KEY: başqa cədvəldə mövcud olan sətrə istinad edir.
JOIN: uyğun məlumatları birləşdirir.
LEFT JOIN: ödənişi olmayan sənədləri də nəticədə saxlayır.
SUM: məbləğləri toplayır.
GROUP BY: hər sənəd və ya müştəri üzrə qruplaşdırır.
COALESCE: ödəniş tapılmayanda NULL əvəzinə 0 istifadə edir.
HAVING: qruplaşdırmadan sonra yalnız borcu 0-dan böyük olan müştəriləri saxlayır.

## Nəticəni özün hesabla
Customer A üçün iki sənəd var: 300 + 200 = 500 AZN. Ödənişlər: 100 + 200 + 50 = 350 AZN. Qalan borc: 150 AZN.
Customer B: 400 − 400 = 0 AZN.
Customer C: 150 − 0 = 150 AZN.

## Niyə ödənişləri əvvəlcə qruplaşdırırıq?
1001 nömrəli sənədin iki ödənişi var. Birbaşa birləşdirmə onun 300 AZN məbləğini iki sətirdə göstərər. Sonra həmin məbləği toplamaq yanlış 600 AZN verər. Buna görə əvvəl ödənişləri InvoiceID üzrə toplayırıq, sonra hər sənədi bir yekun ödəniş sətrinə bağlayırıq.

## Müsahibədə izah
“SQL biliklərimi tətbiq etmək üçün AI köməyi ilə kiçik tədris bazası hazırlamışam. Müştəri, hesab, sənəd və ödəniş cədvəllərini əlaqələndirərək borc hesabatı çıxarmağı öyrənirəm.”
Məşqləri tamamladıqdan sonra etdiyin dəyişiklikləri də konkret izah et. Hələ işlətmədiyin kodu müstəqil hazırladığın və test etdiyin iş kimi təqdim etmə.
