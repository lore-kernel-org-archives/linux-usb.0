Received: from aib29agb123.bom1.oracleemaildelivery.com (aib29agb123.bom1.oracleemaildelivery.com [192.29.172.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8637A14AD20
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.29.172.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775462880; cv=none; b=eKsHeeEOy35I760gbeKkWvM4UIF3q2dNpRLmNpD5ppdouiaC7Cm8wfw9m/gDEah1M9OpFE681B5+4ukmn2xmN82YqWDnoSZi0jJr3xIiZAPRTxCr7WUBsu91issN0ZusRE+F1fa9/i5OX8VoqEhZubQ+7426R3Ted17jKw31qAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775462880; c=relaxed/simple;
	bh=DOGNxOuGnChhZQLwlrQLOpL2pK7O5LofYIVDLE+YYWc=;
	h=From:To:Subject:Date:Message-id:MIME-version:Content-type; b=NPV1dEL+om4hGP9qYJztaOFW+im3HQyk20QbT5fZafkNAVpYpmDCJuW4P6KyMd2mIL7NfSIup8zgQnFeeF3O+gSQnkHJ+ZiAsBhvM5/taZPKEr02Tg/nByTdTyBuyLLmATtNm0u2vnI9ahrSkuQEv1cXaLJH49+m3R8k6+GCNLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linknsell.com; spf=pass smtp.mailfrom=bom1.rp.oracleemaildelivery.com; dkim=pass (2048-bit key) header.d=linknsell.com header.i=@linknsell.com header.b=eizwQ2qZ; dkim=pass (2048-bit key) header.d=bom1.rp.oracleemaildelivery.com header.i=@bom1.rp.oracleemaildelivery.com header.b=ItOtQH73; arc=none smtp.client-ip=192.29.172.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linknsell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bom1.rp.oracleemaildelivery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linknsell.com header.i=@linknsell.com header.b="eizwQ2qZ";
	dkim=pass (2048-bit key) header.d=bom1.rp.oracleemaildelivery.com header.i=@bom1.rp.oracleemaildelivery.com header.b="ItOtQH73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=smtp.linknsell.com.20250508;
 d=linknsell.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=DOGNxOuGnChhZQLwlrQLOpL2pK7O5LofYIVDLE+YYWc=;
 b=eizwQ2qZCYWlaMP7aOejWZczxV1xKovonoOUEcDj76CN3VErSaB6kXV+/otCtFqpjIMDOyqeUKvK
   T5Z2CxVBOxFQBR9xr9JaNA2q4hheAt6QuHgQRgQz2AlQ3eGwBBSJAtMsr2HDr/iZOKyyEDRnNG89
   Ajyp9crzKHGI9y1WxKXm72qdHouSUhUGLA5PlEgVHHayY+vIUkgyOsJaw02c8xyuOVUT4+9xKuMr
   aIRGi1U0XaqBp4APgcldoYBpjCp5qbEvGLnW+bIc8UGESZRMHgopwJ6Q9SVlPmSZY4CGamnd0mhv
   /8E5kClprHycdXSP84Jjbl+HED2p5ThbkZqUvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-bom-20200207;
 d=bom1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=DOGNxOuGnChhZQLwlrQLOpL2pK7O5LofYIVDLE+YYWc=;
 b=ItOtQH73pvJETYtPqNUalKZvO3JveU/UZRWK/ckHQ1EVegWQ/y8nT2PAr2qA0X5YUtXD+nPfGt7D
   oOv9QJRidBQqPjjj5NWp3PPT8wmrCd8pn1qtuJ0QBBhdRzvom/i/df6+rRRNr2wY41HUuzCDaK5w
   ky0CYZmpfFa3sYlb8RyDP2OsMG93Q9Lm3HSxWGL3Um9Kf1gRd6Hm95otiQxMMjt67Cza2LQVSUI5
   Ppdu6qJAiS73N7Of74mc7S1rfscne5/+naeJPwlgJVa1nuk3Um9PHRaIgrT9RP17oLGHI1iCSG8H
   2xafpnjEIV5rfCkwOw124dWhnNbEsKTOTf1rEA==
Received: by omta-ad1-fd1-402-ap-mumbai-1.omtaad1.vcndpbom.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TD200JKBBX8ZR80@omta-ad1-fd1-402-ap-mumbai-1.omtaad1.vcndpbom.oraclevcn.com> for
 linux-usb@vger.kernel.org; Mon, 06 Apr 2026 08:07:56 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Reply-to: jisunlee@gmilweb.com
From: Jisun Lee <NoReply@linknsell.com>
To: linux-usb@vger.kernel.org
Subject: I need your help
Date: 6 Apr 2026 09:07:52 +0100
Message-id: <20260406075048.1FA52CE4B8E53E41@linknsell.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-version: 1.0
Content-type: text/plain;	charset="utf-8"
Content-transfer-encoding: quoted-printable
Reporting-Meta:
 AAFZ4Qxoyrv5K+2lYPZC9Mh2LCb8XPU7SkRF9j5w46KRuwxTYk0FUeFx2TevgHPv
 TnL/HTAqCHykhcMUTrC+SXL6V6yQSjsidAnODLuMf4UdfP3iaBRHT4mBFJxDtdGz
 Iwe2K+7EO8zMAgQEjcAnvHqu5xq6PNWyZpuoNubEGAq7t2xn4ld5RQzvMaYkzk03
 PsQYcPTeQ/RCxMBYGC+m+E4N5hm1Mn+gT4kd2Dvkzeu4ZQymYYNiRYdpx/uC6Bxt
 rEcOEodun67cHy/EDkvIg50VWaNiem7apywXgAs1b3PIO7No/IEsss8BATP6exBG
 cBZxusfo9K9Lk3TaaJqC4/SJzE0vg4ECOzsRKnwSENok63vCh1yeBOkHZ8R3ZXEe
 rZfFrNW3EB2DzUrrp+7bLcrIJ68HXIcPFz+892eqUkpHWua2Vj1uKLhXMSPNHP1t
 xM/gaUjb6c7bBmNg/gkUHwYrzRbNQRf2iIdHxyX7T0qvk60fA2IUeIF5eA==

Dear Beloved

My ex Husband Song Lee refuse to pay our divorce settlement
funds. =E2=80=8BI need your help to recover Assets from the bank for=20
healthcare and child support
=E2=80=8Bpurposes, diagnosed with (bladder cancer).

=E2=80=8BI need your advise and support

=E2=80=8BThank You
Jisun Lee
