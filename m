Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B633CC9E9
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089295; cv=none; b=KuMTFsncdCeHm1d3VlQJCfZKUgoNOHm2CVwowsm9BoevMtpk2e58/likRI6CJJWcxTwWcESrAUwNZxx95Hr+ifwXo2yMWjFFddVQQkkbFkKZ/SftDBkmxHMcrQ+mREpSHdVgNuPF4gATU6dnWQHXDHyFCxblRTSzU4oY9cDMJKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089295; c=relaxed/simple;
	bh=LzUQ9z3EwZDrx7+JCmwkMDCei7rXNlUz4faMOKZ3xRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxPBHWa+JMDs7LYUAsPdfg/OmzoWXAS0vpUwueXDK1pR42mFOE256F9VxAg8ro8l30rRlSU25FMnvuXDCMwCXI/7Bcg1C0EhuQSGKVobAeapByjaJqFFiQiZtGcpDAeflDOmzGm3R2cKMSv4+qVxTK0NGMkulKNF0Jj8TL6gFsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnlz7Pkx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ksZd+ii4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnlz7Pkx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ksZd+ii4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777o4HX3533325
	for <linux-usb@vger.kernel.org>; Fri, 7 Aug 2026 07:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I1vquG2INCl
	NGexvMcrCNwSmjSx5T93OBZMPmuBrtpg=; b=hnlz7PkxnRG6sJWyX60rjjOl3bD
	lIGl2CwOrKKa7qZlD847q5tNTOAPro1bOG43twu0h3r9z9gYsFry0F1oul91Ylmh
	YLMz0pPo9FTpUpoep6ScyMcD8W5PPG1L6ac7v2/oss5+qNd2/fUyVZ+SKE+Fjm7l
	hiWzyWFVoou1u4joYWZecXDbO+qXgFSF1OQc/D7jf4Eiq3T3u04j3S+8Hz7rm0fj
	9/6CQFoGNaGkWs3hng4GLKS33+GZzXd+gvMXJ1fs0jn+6xmIrhhzAb2SixXz0qF3
	ggmXtdWBq1kZhPhB+WgjJ1z0AnFvptpfKGJTYwKvXw4a6b8NIby62y/pZww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fu01j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 07:54:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so32751781cf.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 00:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786089286; x=1786694086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1vquG2INClNGexvMcrCNwSmjSx5T93OBZMPmuBrtpg=;
        b=ksZd+ii4LI0XrBU6HkITJKUx1si+0MEkN0csXa2049l5QQiYG/OoodCosXswreYb9M
         NSwlL1mb2z8tFZSuQPe0taqldo2MsyNiE9GLIOBP5iXGaRSR9QuLcdcIejgsVcQu3Cr+
         IxcU7BzHhfR5A1NiKkhWKoYIfihUdcYs1w1sOAFeOeqgnu7u6e6fO8VAC2vXtJZ3FISl
         6bbL8vnO0mjEIx1eQQDJlg4z02qMwYGqTnfwTJzjCtpF/3OPOQxx6v8Ji7ywTtLw339d
         Hz6Z1JZ526cavH29xb41B3vKy8jXBLmYiXnCXl3eS3JEzucogyoETBk+wWmqZqKoqnVP
         cdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089286; x=1786694086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1vquG2INClNGexvMcrCNwSmjSx5T93OBZMPmuBrtpg=;
        b=cV6rGxLCn7ULpuNywo0v1WKB1WWfxcquMF4MyZ3fnA03Mjwt+ZC7lb4fSAwnmOf9Cu
         u9L4Xqr6u5zwNWHl1SLUZYk7KQx1HxC5lB0JTQQZzqoYdRbdnLe7lBzi0DOierO6UQow
         jZfpbKpo1REpNHmbPpxATsFb2KYQKdvnuEDmyp5zdSooj/SVYmwsomXdXY4WgTmIy3el
         AbbSGoqPFtR/OSRFnLaK6rPVykTEWoUeldNKBmkanSAVNip3ns+gj/k3MVUKlKlgYFwv
         9z9KaHO3dyZVZv3U6KWcqp96IZNEBlWJ7JwJABu3rroq26rnmqljiccZPcrvnlkY2iKG
         bmjA==
X-Forwarded-Encrypted: i=1; AHgh+RqM/MtI/sc8o2ENx5C+bB8GKzgBbj/WwkeueMx0U2iJ/4SkyMotAwsx/sW9jcremu89YaQ+b5Y2Y1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrUI7VKFI6NgWiT0a5lIUO5OOTs3Xr7RsIjCgF0N8B6NK3YYyT
	ujxfWcHh2haVcNDbiSbWE+45SXThTv2GDqmz4fq16ujUVJwDXhXeu5KSrLyQHaEx6iD/ruDOirW
	amZYfeTHNU+U8C/1TA7Qq9VZHvo9LTeInsLcy0P377vaOcA59fLqDNcNfYtG7qzs=
X-Gm-Gg: AR+sD13zF3DkoKm0zOeUWqK4+sa+TE/5qmvL/WUdFKNAS/JQBOFCcpz8OVbr+3s5r2y
	FRuCzme1B2yFBlaFK1OEPDdGPunbIWlaX6pHFEqOQJRU6+WItR+HwaeJyNnvtuyPNDhrSOYsPAd
	1fcVWyXZ7EHgVfpdBUocF28OM2pznrNf3FDobhLB3D5Uwe6slR+ou1DEld20txDSnFkxa6zTN/N
	n3pUBWkrcEAfQEmjGJu9/fPqrFa0riDeZJIGiKANZwNoGzHSOnqiWfL+ke/61QQOqSrJl3ixG/p
	ovpGBKTV7OuV14FbOwDlTo1wjHIwijrCORb5Bls6NFJj3DSEDRUZOmXekLrDqhDouVU+zK3U/qy
	yJ+2cV6EV6hS/UakiQIDHn1NJ9bs6GNk=
X-Received: by 2002:a05:622a:994:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52ce61015cemr216436771cf.20.1786089286134;
        Fri, 07 Aug 2026 00:54:46 -0700 (PDT)
X-Received: by 2002:a05:622a:994:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52ce61015cemr216436601cf.20.1786089285784;
        Fri, 07 Aug 2026 00:54:45 -0700 (PDT)
Received: from QCOM-WFsSr66Fqw.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cfddbbsm20020666b.61.2026.08.07.00.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:54:44 -0700 (PDT)
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@ti.com>,
        Tatyana Brokhman <tlinder@codeaurora.org>, Kees Cook <kees@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sebastian Urban <surban@surban.net>,
        Seungjin Bae <eeodqql09@gmail.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Subject: [PATCH 1/4] usb: gadget: dummy_hcd: fix SuperSpeed ep0 maxpacket
Date: Fri,  7 Aug 2026 09:54:35 +0200
Message-ID: <20260807075438.5566-2-igor.skalkin@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
References: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NyBTYWx0ZWRfX3d1b8mLGYl3e
 wmqQ/JiuN69tjsqO35KMaMRFcZ1zWG+PhA55UdQ0GQ9mfreNQo6g2Mkr/40alIoQcDt7eIC4Ezd
 he8DGDBKdiNTbA0JXUM9QXPtsIXEUxMLPpnOeU2CiZMqu3dUBNOH7Se5X+YMWhGn6A/XFgKcfte
 3pljUhYOfR9Q/uK+kH/7BWSja8i/AJCfx2HGi4sDXx4LMHtvVb3nZwn/ciLrE8/hcbOgjaygxqx
 +bVAab9PU3Hrr0C/ATzeeCLiCBDHMDkE2b5yVO6X3FQEDjItoJ7hUn6LTxJQroZFtCrYX4JAibJ
 vmlVHZWlqqQgK3SCll28WcVQXXSvCob4zugnutss13C4Saiw7p4qVfiPSTN9nRti7o1zNag47a4
 jpi9nsoFJjo4ACSwEBH3cAktI8F1AmICNZfh9Z9m0u19SR8n1V8m+wpb5JLdRZZk+8RvTnSV9d8
 Ka82l9O5TM/9oxLyldQ==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a758f46 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=9LMInSQd5oSPQDHo0H8A:9 a=ZXulRonScM0A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: KauNQqdlA42RC1dMP5FEbKXieUYneqvX
X-Proofpoint-GUID: KauNQqdlA42RC1dMP5FEbKXieUYneqvX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NyBTYWx0ZWRfX7MTVJHAu0hTr
 DskSuJMATHpITnlfPeNMeTwTHcARzgIJUKPR3uKwTqvNXaMic/Rjy0ARe3ZfGUF9yICgvmrlf5p
 KV1PmA0RDoWQB74WptLaXFK0/kYgWrU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070057

For USB_SPEED_SUPER, dummy_hcd sets ep0 maxpacket to 9.
That is incorrect for SuperSpeed ep0 and breaks short packet handling
in control transfer tests.

Set ep0 maxpacket to 512 for SuperSpeed.

Fixes: 1cd8fd2887e1 ("usb: gadget: dummy_hcd: add SuperSpeed support")
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

