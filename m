Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6CA3AFB06
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786522766; cv=none; b=uK7ApJC3KeqN9o84cPl1rnFH2In1XJiTkz5SDPG6uiY/NNZNgvze6A0r/Jxjm7ThIkSa0cwxLiEi0vZw+SBsrTAy9NHEg+kfgNbfy+1hno8N1y18DGMr+vih+URA+t7Sx+yZtlfze6XbQsSJKuoDq/CPbIkXwcUrySgLKz7OXcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786522766; c=relaxed/simple;
	bh=z9MnMQspr7pHxSREdgr9qgGI4U9g3l1vlz9eG6AcHiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q39QpUtp822WrehJmcpwmCVtl1SQXi2cMrkizbP8ykxyFyUV7eTRfpk469KeGVq94qS9fdEyqr+iQZvSIGCe25Pg484/MRqtt15qlXqVmrsZOO/5gLxlP+Al5KuAsDURTSaBFEQmL20mw0zUZaxOhsd4mODDlTCEqyUm19QaHSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mi7pTKX4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxOYm8xh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mi7pTKX4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxOYm8xh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62L7L3288513
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 08:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cK0UgLKdPpY
	KRWf/TrsMoJaQjrikK0H8qeWdKHTd7II=; b=mi7pTKX4FkliG7dGs/4mw6KAQEr
	0GdULkTJ1kG2HRuU2URdLpHUmaYLZXbnSbfnQCEBAx67hxEhSAJN/ko1caBIu1Ng
	k7gNjj+532HgTOwXb4pZzTR6zXLA4dLobqqfDOPGJZ4RBOrzW3f/3SNTqc3YEJUL
	3+PVOPO2Q0/o2tH5QDj/h3GlJAxuz8cT5M6nkJy70dfl7Bw4Qv2rASDPDdRCwqLq
	P9ckfP5HMSOwAE7Uulws7EBV4z8udLsGB7V4/jOMZcL2eKpv7RkbYOehjU6AvIA+
	NbMR87zTogFXO4GPOyTuOaKXORNdVAV+B6CaHPVBN/liNzjJxfQwtLm5U4Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049ev6hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 08:19:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so14616851cf.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 01:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786522762; x=1787127562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK0UgLKdPpYKRWf/TrsMoJaQjrikK0H8qeWdKHTd7II=;
        b=YxOYm8xhTL2AwXw9qHKtHKoZ8nQ2NeUGHF+82quKB+W4qZaeeYvRkhDxUTHQw6Y3Qo
         MqUWQBlcIV6KJEDUMkp000PgOpULZM0P3dtC3TSXHzITZzFkypzkq8MPbSg8Qz/PGLup
         YQL3GSYzG9WdFQyyNhFefTT6i+PK+3L3aS8k/1F7QrOPO+WLWjGamLtWlN/UtVcTimXi
         ZiIAGkLOiqE678Oqf4HPmLbtj6t5xsgm9ShSiOcCqJVGz0D4aIKWJ7n19UEfx4nNs7v/
         YEgmTllgz9Fw97EhiPQV+Ij/9ci1PizLf1La3fBEwxuOVE7KG7ahKZWTfxAYeLl0aa/E
         SzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786522762; x=1787127562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cK0UgLKdPpYKRWf/TrsMoJaQjrikK0H8qeWdKHTd7II=;
        b=dTx/TxIKDccNY4j7F/wbY0CgLGuaFgYvzImLWSyaefcYVLGVf0FaD7nFMPiitRKW5p
         vlIb+b9cc7doY4VYmYiTYJjJgbsGkyAFsGgdcXOEOolhMoOLNtMoTYDM6CcqwkYj0ClH
         D6i7lS5PuM7dcPrPyScmaolNkYBHrp9XEQAmfMzFaeOWw5V4HhMLK505X6IoJbbb3W9c
         RgBejeDPznbYibeYs2aWZN9YNdNecJMq4vvrzCIH5CYJ2hZ/KAi5v/0H9HxgRhEUCfWg
         PVouDEOj9iEp9eBKT+6WHKd0+fiu5Unakf8/gmy5c5MMZ7ChYGErTrKryDHSi0D3XE3K
         Q3/A==
X-Forwarded-Encrypted: i=1; AHgh+RpXSruvXuR2mf+t+tuf+1fVxUx4eAzJ33KvNt2cLeovpUXnn+tfCzYUV+FS/NWFBZxIbkhhW4/EOg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzMBsSAsE9RPOavsu+93XSkf9edKfm9UcNz9PvQzW83aRCVepR
	VLskNb5BTCgO7TgW9clswRl4YgamDtferPbHzSIJ1xkYGDcz78Fo1CiTx2Ld/NjPzWNMCkLvxY2
	FLA4yjx/yW/ZnfuXUMVHfF8b7z5oICCtYHePJkDH3Sr7kOfVLR4z1yR/7PIc+MN0=
X-Gm-Gg: AR+sD13pdFduL3xIflEj8Z0agzP6Sj9GVCk1C+pn41R0EcZZANil9bIvXWQsb5dnuJh
	CzrrWFTE7RnPne27bjZQHKjnklUMhMVtRIGZmPloI452HRQsmOkfT6UNiscDu1L+AyahxLSlhnU
	6ywrbr27xrCcw5E4/gh820QCXU+1tv3bGOI9Bd+yAInNzDbVPP9wfoB8JMhK+LhWlF+gFhj9jGr
	JSTDNDQnUc1hPX5ZZnlA3VuhgeKtrtfiPt2+Z0OqrF91ezul9Di21YRPfSkFr76V7X74zmd7XES
	c6LkIULg6cNrglKHpB4ku+HXy6q7rwC2pvDJMFouhrQHM4FHPLhM1z20NMix6g3hIbz1J12M6jw
	CSBgYE10LAvkb2qUqgCz8dBH++Zv0qCU=
X-Received: by 2002:ac8:5915:0:b0:51c:1a17:eba4 with SMTP id d75a77b69052e-52d647ec290mr26629501cf.24.1786522761993;
        Wed, 12 Aug 2026 01:19:21 -0700 (PDT)
X-Received: by 2002:ac8:5915:0:b0:51c:1a17:eba4 with SMTP id d75a77b69052e-52d647ec290mr26629201cf.24.1786522761600;
        Wed, 12 Aug 2026 01:19:21 -0700 (PDT)
Received: from QCOM-WFsSr66Fqw.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20f059195asm63327366b.0.2026.08.12.01.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:19:20 -0700 (PDT)
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Seungjin Bae <eeodqql09@gmail.com>,
        Kees Cook <kees@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sebastian Urban <surban@surban.net>, Felipe Balbi <balbi@ti.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Subject: [PATCH v2 1/2] usb: gadget: dummy_hcd: fix SuperSpeed ep0 maxpacket
Date: Wed, 12 Aug 2026 10:19:09 +0200
Message-ID: <20260812081910.6821-2-igor.skalkin@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812081910.6821-1-igor.skalkin@oss.qualcomm.com>
References: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
 <20260812081910.6821-1-igor.skalkin@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NSBTYWx0ZWRfX6t97UNJ2hP1V
 CPGCH2UQNnv6IGL/sQBaQdbmdQo6J0F2CyZKlYs4QwLkXkfrmIDGU+mlgDKOYnxogMjYvgSoMi1
 jdKY1ZE3LcslNwVB/jHB+Hac4+/aQbM=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7c2c8a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=9LMInSQd5oSPQDHo0H8A:9 a=ZXulRonScM0A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: r9YmImTsUUh41bAaFaAtAAr8SgRhKvdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NSBTYWx0ZWRfXxsSNv4wFKGcL
 oPwew9fhpwDt+/BkJc4RePaeojKXAFSXdqf8Cje1PpZyM5ej/l9nFBdItK0nsAQjtgrT+QgP0MS
 vhD07lpi2gdSDRjU/TGwi499iLaioChrBtYq7oISCrtsH6F0VqGr1JWClZGvjfpns32znuOD5K9
 83axP2CtUvO1SUouCDqeWp0CfbCnz/phPT75Pcg+QoOIKQAq6i71qyMNcuVB0hWf32x/LDBYqt/
 NnZ/yKNF0qXrjurE6XgxNWOJWPL7Sz8UPOCDBfb8lBJdCh51XBCrCP8y0/Or4XxnNUMQEk4FcPv
 E84LT45EyYuImGtWb3vxsPYm1YImTqCNjQizUxdQ+OVEPRC8EGlwTjt8ErRHfNr6H5AKZKf5CKL
 38TdsPyygQZRJ8W41svWqM+f0AuaxdNE1zbaZwvnfJpJKgIX0aDLnBQfPNWPJJBBCspNWpdsmTI
 +P5TDvF4/+CBg82XRdA==
X-Proofpoint-GUID: r9YmImTsUUh41bAaFaAtAAr8SgRhKvdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120065

For USB_SPEED_SUPER, dummy_hcd sets ep0 maxpacket to 9.
That is incorrect for SuperSpeed ep0 and breaks short packet handling
in control transfer tests.

Set ep0 maxpacket to 512 for SuperSpeed.

Fixes: 1cd8fd2887e1 ("usb: gadget: dummy_hcd: add SuperSpeed support")
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index f47903461ed5..29f671c7b319 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -896,7 +896,7 @@ static int dummy_set_selfpowered(struct usb_gadget *_gadget, int value)
 static void dummy_udc_update_ep0(struct dummy *dum)
 {
 	if (dum->gadget.speed == USB_SPEED_SUPER)
-		dum->ep[0].ep.maxpacket = 9;
+		dum->ep[0].ep.maxpacket = 512;
 	else
 		dum->ep[0].ep.maxpacket = 64;
 }
-- 
2.49.0

