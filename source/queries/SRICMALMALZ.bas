SELECT TBISLER.ISADI, TBMALZKALS.URUNKODU, TBMALZKALS.ACIKLAMA, TBMALZKALS.BIRIMFIYAT, TBBIRIMS.BIRIMADI, TBPARABIRIMS.PARABIRIMI, TBMALZKALS.SOZLESMEMIKTARI
FROM TBPARABIRIMS INNER JOIN (TBISLER INNER JOIN (TBBIRIMS INNER JOIN TBMALZKALS ON TBBIRIMS.Kimlik = TBMALZKALS.BIRIM) ON TBISLER.Kimlik = TBMALZKALS.ISKODU) ON TBPARABIRIMS.Kimlik = TBMALZKALS.PARABIRIMI
WHERE (((TBPARABIRIMS.PARABIRIMI)=[paraBirim]) And ((IIf(IsNull(FORMS.FRMAIN.A��lan_Kutu62),'*',FORMS.FRMAIN.A��lan_Kutu62=TBMALZKALS.ISKODU))<>False));
