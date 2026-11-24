Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550537;
	b=inK1LjRGEpjO3Pd0kY9/kNwcTKkFw0mJdFLfVDCJsnBCpnqf3jRCKitA6MQfCyNBhOZv
	 bMtUzEHasXPNCecPez44v3jOWDNVWC9WhYHcmXhTI2EGvnZfuXEIzxizOtDG0MsMatS+q
	 aXnWlhEwtehLyASdjTcgdXxALguKvHLN8xUFBVMfx6JOnuinPQqx+o8z6DQL56LcXiRG0
	 SKr2f662vQuvYECE1NHMvr4DrulUNcNhtL9bvGVUULABvt+AH2EBhoGXMJMeixKNtopXT
	 59gkk/ApWLFVrL1QQOnOrbxdDzeNXD3Z4dVBLwfT4QELdRfeubH7V1w4bcGuGDmGt4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=;
	b=YhFrOHFm/xsEHfOfF70ISMLngfOVSnZqeMgk/3f4iV5NtaQKqdvUU8Haar4TzNEbU+YN
	 mVXSA59lmA+xN9yXSxseNWCCX5et5FSRy0RAgP7zo4or99IBhZpnndpApyEv+m9O2yukD
	 P1HJzHC3SKdNL9bXGXVHu4BeZ0iqeffVrvZzQokoZ/AY8Ex0Xlk6NhzxRXzWwrzxdJwEZ
	 G3A311OE8crtu0kJOPXpOADJ+JURYLi8SyMntEyEukdTk2rZC5h3oU70ZedshUnlKVkTB
	 aAAqcRiXJcpUZO7IlKqXvxI0Em5OOW+HRUcAFRt/pfudg12FSKIMcjTO5SS83G+ddzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IC4IN98a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7t3jS7E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3C7606A6B6
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3C7606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IC4IN98a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7t3jS7E
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJLDc21722541
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=; b=IC4IN98aD3qMMEOt
	0/ZBAR6kZlsNSyoJV2ql5TRgq5Aithhlw3NiXK80diUP4tatEE8W/L0FHZNqbzeW
	cvddkNTUUUx4H9QZ/ZYL7Xjnh/XxQoWYHs+q8UN+cK9a85cOGpt99ISk5ylzfgao
	MNEtC6y2kHRUu8Nfkj4yt2f/MzpQaPBHlX/e0kvKkdeIfYWGqOp77WO0WyLXv3X8
	05v3ELy4Rzcs40UYYP4oFubxOtgYGOdhzvamXDcn9I+jp/HNFXecoMDOoU4/xSJ6
	9C4oimlwryuUy6Ixw0QVRMVxXxa2zMUvV+ZK6N4VRmVH6FU/sPXSd4ZIcZMVf8YQ
	3ZhiAw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gns84t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386c4e8b81eso101219eec.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 12:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550534; x=1796155334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=;
        b=U7t3jS7ECoUcRGBjc2c9SMcEhoOh80+/bGEYe9U8dNeaw9LCJJyVEnrkM3sGnBF8Kc
         cBXQEgVAIJV2YnjpoyvqaPrranLHyo3xZ3O1XVjSWa0Achke629T6ZCxKVITENzr+KxV
         B2oNY9nalQ6uqTIxQRueQaA0Wf1H7Mt283nOFpqsRqPybyb+mbymnG7/rNtsNLKUBrd0
         2GW3hpN2g9n3bd+wdAXXR98ZqWucmFNJcNR99ZEKLawzKwnT8a/Hi4bMYYloB8Drve8+
         06b/FmQFuLuh2msPkUAt1Vd6MznK5c35XeU+XzA5Ql7nS50BqwXk5JGDl2Siumfv0Aeq
         4iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550534; x=1796155334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=;
        b=2OKgHdkW6hfSKoTRPIoLXO+AmIEiMoZaEjGHn4gScpIWaO7Ov1aXiEWhI8+lUjBQvZ
         Ujf9iZor+wlFUa6gpz75krwFBURb71smvsztvGTjet6o0tcTjcxceD0DPJs1iozd5QzM
         iOFBSMqXt/eLqE/6T9dkRQritvGS7hXdtuSkMVZ0zu4k5rY6kIwrUhgN7O505uft/Q17
         nMwytzbkRbIB/a95nDEDmpXoRQth7XgxJHpBGnW58JP8ZPcKMWUQWrYNPe/Pq7X+yLMy
         b8gTeScK/OOGgXEzHbDS0yM+VbdgSUjESl7Q/cJho3iIRV+UX0D+WntY9FgWwbebjnrO
         sNMw==
X-Forwarded-Encrypted: i=1; AL+hErFsPvYPOMkgB7yTBJIPIMisxrUR/RwG29RR6Bp5OCMmCAfNJn3QPcHUfmUNImmJl9mDbVoiidUz3lI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vkyC3TaDxZE0DIaaXP1mz6u3iMCjBgsAmtUXBdE0KpamScW2j
	zbRugvOmISce5l7IVOxScmOBE3TFbU0ZD9/QaNDshLGQnFp9LvpaOtGBm4quFvwfWqz/Ll3A/j0
	USE8AymYgz/wga9zezeM5vk7knulGUJlUy+3XCawyfuGbdu9GbcEMLzSbZ2/xXmU=
X-Gm-Gg: AZFdTZe4loaOsz5sG9wwe+DT5dgZMOKTpyWUc3nv9Y0qYMCXMVvS6WA61IdsnsHqVWh
	04OuD+NRswKJKWb1VlMqtL6lUydds/i0CMXia2jfcbIObxp+JcsRjjTzMjiM50sz0v/IcjUyrsd
	A6DTD1LqbZ6tCWMM4PrIx0EuFsZOv5jwHRMm65PJ2IJQpkavu0CJC/M9Kuie4wtlo/esqJEKje5
	yfYGjHQBjliJCc2FKkn3X+Lb0eVNtKdwkX78pGFMN/RGV9a8/NpCVx3GE7PQDmem0EBAgh+y2d3
	2eHqlFwZaDtLrTNpfZ7HfxXElWY5XbmU7yG0zULFwZXXUc1MBIVEwWUs++GHpxx+x+6KRRrmtsH
	EUZr4LkR7ahIhv9SXxEM5qw2Ryy0gqMtrPyMgMyhyRGLvknitNB4yL9V90OmyFfzyVxhq8xTwVV
	cE8t5lxbk=
X-Received: by 2002:a05:701b:4554:10b0:1b5:4596:8371 with SMTP id a92af1059eb24-1b5566e72c7mr23181178c88.0.1795550534105;
        Tue, 24 Nov 2026 12:02:14 -0800 (PST)
X-Received: by 2002:a05:701b:4554:10b0:1b5:4596:8371 with SMTP id a92af1059eb24-1b5566e72c7mr23181120c88.0.1795550533379;
        Tue, 24 Nov 2026 12:02:13 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:40 +0100
Subject: [PATCH RFC DNM 11/15] thunderbolt: Raise TB_TIMEOUT to 500 ms
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-11-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=771;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=QbBiyvqAcfQWLt33cWM1d6MRIS/efAtBYRH5kpUuajs=;
 b=ceEoSnWOSQpTKTmrasnJ/E5U6w+u/Bzq7S/DCRvL5JzUoYBrFt5Cr/GlkYw1Cau+1LS5gz3BQ
 g5SlBy2yDnSCde294+DUgMW50aPABreI95lPJgrBaNZOLzRqhodnx8M
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-GUID: 4LXXJa91j-bWVQVYF9Yu9jWAAclt4NTA
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b05ed47 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=S55nwNfuHOdlGrVOgPkA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXzhKsxz2AtqSY
 pz91KIbACIqujqLt4B7wTnYfligMjBpfl43um+WrflRJZYSbe+8S9yxqle5O3HE2F9jkaTIFjPd
 XiBonQMzXg+ae9ZumipTHzT+F86CGPo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX84EFVWjIW+fs
 wPT51q0GwyRRvJh13u5EPMw9xEOl2xuNmxOcjmC+810bDsBwo4OdAm6MYLLrVqSagsg+MlDAhjb
 rg9EVGMEoNFuW+pq8QrC+OoUEYjG8Md5P3yMPUxo4PkiDqUgMdFdGw2dkathvKFwpEo/XCoLm9o
 iOaggPpDAXMfv9r7ZFkkDvBlha2dnDd56zrYYxPMz2yxS5GwwkMM9YrpnPbVXq8RT3XQXcnhYhP
 DWHRGmKkyppuDE12F5zMfKgxk4jkalPwgZWR/Ad6WAHePpxEUqWwGqVCAgMXPr4/AqtUSxZfUIl
 Mwxf2+l5aj0E5rDjubdv0lOLeOzJYvl4r5r+/46SjgUoos84p8F17TavOKGVqzpjcAJ+V4A+fhV
 oRa790+7jv+U8ljrgIwLR73aG1g8T4jfHPN2GXLLZwqTlNgzOQA8ATEmRwkEbSiASiEwf1FzKPy
 YwIYMflQbiGaVKnSQBQ==
X-Proofpoint-ORIG-GUID: 4LXXJa91j-bWVQVYF9Yu9jWAAclt4NTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

Routers with firmware-managed link training (e.g. Qualcomm) can take
well over 100 ms to answer config requests while a link is coming up.
Increase the timeout to facilitate that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/tb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 418ad0a61a5de84717d7653c3516faca2a3db2ec..7594bc24c443fc27af651dd22c2db4b6e5acd696 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -16,7 +16,7 @@
 #include "tb_regs.h"
 #include "tunnel.h"
 
-#define TB_TIMEOUT		100	/* ms */
+#define TB_TIMEOUT		500	/* ms */
 #define TB_RELEASE_BW_TIMEOUT	10000	/* ms */
 
 /*

-- 
2.55.0

