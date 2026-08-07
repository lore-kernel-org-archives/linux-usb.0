Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1850945DF72
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089296; cv=none; b=HXsCQ1JfqY/YEkum4+vhP7dqV70OTVIOtpkMBWJujNkKIJJTlsMYNyxk9xgDeuXmwUtIldcIsiBv2ong5zEyuoS0zytl6eab8rndjxXZlzKsgMLnZh2qXfo/E5e6LQnLtz9x/esJGkKQLECzWJ1s5rZvk9XTnx0QPvsO2o59Mas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089296; c=relaxed/simple;
	bh=wwo472MpYKrzIegYBW/PRjOXknak69e5bRO33p341UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTLFHwK6lUkTG7CMZSMXEGVJCcFjWstSw7Z+OPZf1dyQIt/w9LQLAZcNbtP3tusjSiTSfzCRmMzZziUYQ9V5sehXXiAT05+5JBMxNX7qxlgDewN44poQfOhdVVNnZiGnigdauHiT1WML1DYsGtUkAnS4rbI9byhrFyl4DT3MoYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2APl7oJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUwKWABw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2APl7oJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUwKWABw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GnF23251904
	for <linux-usb@vger.kernel.org>; Fri, 7 Aug 2026 07:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FKLNjrfMsxn
	a/TQXGLnWhhml8NVmpvt+nOpvaf9vKaU=; b=L2APl7oJ6dFwxbnhGdW41BbatDw
	Y+LuL6Kex+bcNmj/VexjsACFAVZnWqBNdU93HgLZW2w/jQkSqVMdP88hgF9ryNOU
	QBYFMT2S+Vp01GAumXOZZy7cgyuYiVkM0cPSdgR/DQZSi+WGJ2UAyKEYzViWE/tH
	wn3M7CLe2Rxa8e3wobV+cQfc8+A9ck9eNI59MnVybjrTmVeuj/MVzhmROkycuzWT
	cmLVTTmrvxWebA7KDYnCC/d+ESF+0iqlIUzR5TQH7cLo3CF1H4qUej4er8grbKnJ
	ySppcM0WGti/Kf9lFezF3BU+Jif8RyLf8/H5vIbyGJdzVtldkA7Y7QX+Qpg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6k2x0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 07:54:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so30772901cf.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 00:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786089288; x=1786694088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKLNjrfMsxna/TQXGLnWhhml8NVmpvt+nOpvaf9vKaU=;
        b=IUwKWABwaCiPD0Nk2ILzNHFnUZs2QOX/rK3AvgIq8UdScje+y9jgTLy6w4ECUTrOAb
         UdPPpiPckB1f9/rWM9kGSuoXfPsGs3WOXmlYwkHsoLXD0aTChWEsE6oTKr/tcNM5jEix
         W/Ph0IZy8Qp7AgJp+AQeQBMd0GWoDbHD6FIOP10YxJKDiE7VvcAmHz9yujTZCc5iIBNY
         KGL7DMtVvaEhlRgkLRFgDoTlQ0bSxu9O9f1E60PDHZdZQTa5B7dxyRRCT7J3vqbDEo44
         RDgRaW3PcFXxp2SWpz0foMQu0X6a0KFJ4rB+3SY1hZjLL3Uf+VjdLjjsoXKPcY9K5LfK
         G/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089288; x=1786694088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKLNjrfMsxna/TQXGLnWhhml8NVmpvt+nOpvaf9vKaU=;
        b=spZnojypNsVX084i07n56JLoa5N26smXmn7+8u8Qwg/YHugtFHm7N1v6nLeprmmTki
         bFGAlLXnoOflcrORFx+1pkVZYsQCoH7kzR7Qohvuen6PTIvmqXS4ILNpRmDd4rUCjKJ0
         bM3TI7vAVy7BaeGIxiIqoRdOc2/jMcCxgg4vPsGgnyx3M9Ww6bzuF+VSq9HW/W3tWJLj
         pDDvXKy6DgbwcRRWm20KAV3BKsdrA7zUzO75T3dz1hizU22//vHDJ32i4cPoBkdxLZIq
         eXmbfl3PyKzXYs6lHZyHTWPJh1OMwIecpNpBzA/swnqkBOf/6fuNGHHb5QkwbRSfCryf
         BTKA==
X-Forwarded-Encrypted: i=1; AHgh+RqubxqLMQgXIQ6QQGMWNvq2px0KNdMsjhNF5FNAMPpHYMk0kYSGdRdpnNzDO7YKAzYSWL7Ojp6Ec08=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEz0CEI6EOypfDez0N+5TyQoC4OIY/O/GBizRmoKiN/544CWHn
	uy3dXjZakpJJorpo2/1f6QXpWv+lWQnrMzrTl29OQ87ECSE3jBNyTA73/qq0G8IN17glslBDgU4
	xV7RDBS6twtHItv/wvaT3DwrIrBd3KuSwpS9gcSjgjHj38WF9pF1V7yHRafXFCkc=
X-Gm-Gg: AR+sD13sdbgxQAqpkwPkrmvggyl2wUwciYrlFBVa4KlO1TASXZbRZ88KY8OG3qwSOVA
	B02QTrFwajHsEDHGux3crlw8noHjGfN09syULqi4TGjDhDMgSKRNR2OCAvTZEY88/p+Ny5s7Kt2
	3AswKBME4MsbadvXmYj16tlK+7GfhKjgxQKrK8a9lr70Fmd2majzmRv22nxLQabcdyEIngyxNUn
	LKoubB5cHfCPTujr8JNDYyTOL5mhtGbYy5Sup2Pn89i0no09gb5Ca7GH7Guo1J7AW2i3noEBo+j
	qDqtVniNInRhLcAUaoWv44YjP4Amnn3g5eUo7QBLivYGCITH1BKaEUf4aRVhPm5zlGfHD5V4MtL
	zQR2a7UNQs5M8q72zq9hP5U1RluYNiC4=
X-Received: by 2002:ac8:5e0c:0:b0:527:43a:2f31 with SMTP id d75a77b69052e-52ce5fbf924mr202454931cf.15.1786089287803;
        Fri, 07 Aug 2026 00:54:47 -0700 (PDT)
X-Received: by 2002:ac8:5e0c:0:b0:527:43a:2f31 with SMTP id d75a77b69052e-52ce5fbf924mr202454641cf.15.1786089287339;
        Fri, 07 Aug 2026 00:54:47 -0700 (PDT)
Received: from QCOM-WFsSr66Fqw.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cfddbbsm20020666b.61.2026.08.07.00.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:54:46 -0700 (PDT)
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
Subject: [PATCH 2/4] usb: gadget: dummy_hcd: fix false overflow on bounded IN
Date: Fri,  7 Aug 2026 09:54:36 +0200
Message-ID: <20260807075438.5566-3-igor.skalkin@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RpX16imK c=1 sm=1 tr=0 ts=6a758f48 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0NqdgQKyT0F8-VDAim8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: NDr7Xvfs6GUzf5hD5Oc-5rYz3jA6HuBj
X-Proofpoint-GUID: NDr7Xvfs6GUzf5hD5Oc-5rYz3jA6HuBj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NyBTYWx0ZWRfX74UoKlGHSB26
 cgJyjTFrkQso5IxqHxYcDEaugxoSUUF1x1x+zprJ5ih1adwDtXgbXPuu7WyxZ38IWGsbH6MpkRK
 joj+9hLhwAef4SNSMWYJDTkzhqHHZSPr835T9+6066FOge7LK/7BonZat1iP9rnGCBh2z8emlkF
 rhut+XbHhUbV4m28Mc36t45AWg2xWm7lxMWUojAU3lEfN/nu9iVxhV9z1wf4liTxgqk0ktRr7V2
 BOBo7QNoGiLwg6ejtEbSPU5L+Ae1x/4yziSLutgfBncG8MdaWkN1gFU80qj2avWGa+wpYtC96DG
 XROo9BELNLHIgSc8jOiq7inzEuvh2TDSQBoL73P01WLbon6RRFJ81DmmwoBwnOlBz9EV5tcFVe+
 QhqOIx1MxhWt8cV65xe/HHWLhOvLMlB8Qjzd/OfaVJkerr5LkDO7/8ywhTEq9s+GQ5n4CvWFLxN
 O+uw6apmuNvExC+wpAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NyBTYWx0ZWRfX1fLPUhoNFPWc
 XZFHIH6g1+4M+OSNhNkmkngLP1hUsdkDHFQT5yb7zVNbDXpXJ2pax6w21rbva5gY17AauHJQ8TK
 WR95+hv4uOJ2pe6CV1UaY1SODH8b2Fg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070057

In transfer(), the IN short-packet path reports -EOVERFLOW when
dev_len > host_len.

For IN transfers this is a valid bounded completion: the host asked for
host_len bytes and the transfer is limited by the host buffer. It is not
an overflow condition.

Treat bounded IN short completion as success.

This fixes spurious failures in usbtest bulk IN varying-length cases.

Assisted-by: OpenCode:claude-sonnet-5
Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 29f671c7b319..5384806347ab 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1486,11 +1486,13 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 				req->req.status = 0;
 				*status = 0;
 			} else if (to_host) {
+				/*
+				 * Host requested fewer bytes than the gadget
+				 * request currently has pending. This is a
+				 * normal bounded IN transfer, not overflow.
+				 */
 				req->req.status = 0;
-				if (dev_len > host_len)
-					*status = -EOVERFLOW;
-				else
-					*status = 0;
+				*status = 0;
 			} else {
 				*status = 0;
 				if (host_len > dev_len)
-- 
2.49.0

