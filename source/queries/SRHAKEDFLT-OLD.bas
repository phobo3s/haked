SELECT TBHAKED.ISADI, TBHAKED.HAKEDISNO, B.TBMETRAJ.MIKTAR, B.A.BIRIMADI, B.A.ACIKLAMA, B.A.BIRIMFIYAT, [MIKTAR]*[A.BIRIMFIYAT] AS FIYAT
FROM TBHAKED INNER JOIN (SELECT TBMETRAJ.HAKEDISKOD, TBMETRAJ.MIKTAR, A.BIRIMADI, A.ACIKLAMA, A.BIRIMFIYAT, [MIKTAR]*[A.BIRIMFIYAT] AS FIYAT FROM TBMETRAJ INNER JOIN (SELECT TBIMALATKALS.Kimlik, ACIKLAMA, BIRIMADI, BIRIMFIYAT FROM TBIMALATKALS INNER JOIN TBBIRIMS ON TBBIRIMS.Kimlik = TBIMALATKALS.BIRIM)  AS A ON TBMETRAJ.IMALATKAL = A.Kimlik)  AS B ON TBHAKED.Kimlik = B.HAKEDISKOD
WHERE (((IIf(IsNull([FORMS].[FRMAIN].[A��lan_Kutu62]),'*',[FORMS].[FRMAIN].[A��lan_Kutu62]=[TBHAKED].[ISADI]))<>False) AND ((IIf(IsNull([FORMS].[FRMAIN].[A��lan_Kutu78]),'*',[TBHAKED].[HAKEDISNO]=[FORMS].[FRMAIN].[A��lan_Kutu78]))<>False));
