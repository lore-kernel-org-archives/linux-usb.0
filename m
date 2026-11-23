Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458539;
	b=BOQ3BarVfoQOGhMUUs/85VlkrGwOsXD0/Ie42goq/rTn7iM/+YKajUWahSQKOC4j0NOZ
	 VM1FUA1K5j5ytf3aOGQ3r/HreC/fq6Vt3+YP1F5Tq+vrymxf1J94LjupT7x3SebV6pW0b
	 p8LzRWd6hjTWG9Hm/84nCHwcqaOzob1FT7RTgEvQ54+AMuVn0cBc1dLo7z0mzMYY4p9Ij
	 IqAvlW3g7bWrEypk6MTkdtXOcEHI/MYZj3f5wcbqEL6obZcFFc4Lu5EA8u7kkCPP4S07h
	 VyuHln0vKEA5QYD/jnuhgluKkXp3PMt0CdGZvbl2r1UK5VjVmIY2x0UnSZPhiAWIgzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sm66atK5a1c4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=;
	b=IzkSz4XewFjmGbQaw35S5TdnmeQF0BSM1glo8jDJN+cKxPAD9iGEoSZFGyemmg8ElSMt
	 md+11IYvC8EhXc/+VS0RUyhh3xb6k3BB/BHggYYZXgv5fg1iwkQP+sNLuNVAXoxQfAHn8
	 CH+NQXOkGjPG14LjB6oS94zLo19t2nktC1Ubp3YoI/hi6a+aaTIDfAt8XZcHpfXTIUwWW
	 7bRbzFeWHJ7OBKzxum+pUL5jxnpG0Dxsnp/mVVvMIJMgMosGe63XU6KMZCgy5i8ULobGB
	 fiW53HRaVRZSbzXZ518O6nWlq3EPBidlYpPG4eV3IjysEpqfxqPz1VbcMOLSofQ5e6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiNeKvG9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EGk2KU6r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116D960A2631
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 116D960A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiNeKvG9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EGk2KU6r
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGuOU2340286
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sm66atK5a1c
	4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=; b=KiNeKvG9EQ/jqrIVLDZML9PSqFd
	DNln8baOvDpLn3OJB8cmnRSbWdB76Y3WnUVYt7iT2v26U/LoPivaZJVSQkW2Vhmq
	x8+m5MHoWNRp9LL51wywzfrXMTUuMBL6+ECaYVwe9Aa/x+dKrdH6dCkaNnnrTqih
	JapZSD3wCa5ZEPuRj2Rcjc2uewnxQGWCuNeMTJatoZg49Tka9EVhT+ej3eqp+rRI
	P6kTw5AHzuP1+Lvp3/w5KjlTweYLT64qLI3fC//U+qPOw3vwITERqqnO5iS3QtRl
	G6Dyr7WppUu0eJtNnsdQRtkbNYe6qqNuzVQwq1eD7NemUWUNFJSsvxJBxSQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx322c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:28:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso5048696eec.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458538; x=1796063338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sm66atK5a1c4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=;
        b=EGk2KU6r5LIh2u7O7gspDdqBhQ1Ebauh3zYfmahEihwkVZGnoLEh0yDxMFyWnYdxvh
         V/Jhdv65eSLYPd8z5Zha90GmCy+6+2BsTNMD/ty1ni+2kBtDRV31qSDzMZTPEB682fZd
         A2obY7dMgScrh+D6v7aIBBdLLpcYGAsiaD4qF89Zqy4zM4XLAbhtSSIGU4HkC23Eqr8K
         4LIbVN+cZdxCN38e5k5uweHAO6/ccQInT9yJDMzQaD2czvo7+U+fCGjZd3GgD1xo/S9g
         7uirdMMDUMLN0ipJdPKMadHeXmGV/LQ+TUOTONlOQVD+B+LiYeS9QWGJ9yDXo4RxEAUj
         kFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458538; x=1796063338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sm66atK5a1c4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=;
        b=REOZOgAhrVJmmpLAFQBEYcuNh4LUw0llgmNrC6BQbaMId5bK9EoaDaYMYLK3Vg8vet
         dH4Du+XmbWT28w92xy+/wBF714A9W5rvwKCZyac4DSKe8s0pmapc2LGNKJEjwuHCb/9l
         GaSyqzz4ETOHtO1TbY6EWBUM52vAAKsWNsl8koxFiUFH4P2nYcrcv06VMzAB5EvNrXm7
         VkDBQUg/WvdmGzGH5fJg+xqzAvoYxuuSuJ/BG/u+GS6porH5Eben06g0IqljJfycF3hL
         RUQOKuecvB+Y/c/wJHiVnC4WMrRxqXUcIPvpTJCeui1kGEC/Miv5W9GfKlFsbw5HMhdP
         AMCg==
X-Forwarded-Encrypted: i=1; AL+hErEvROeplZGpckPRM0kWOL9sq2mdwmkdfIZ5Ppdki+Oy8zzvEJfIumoZXe79XcLIxR6H6M4yZg8NcSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RkccNSvqRvazFEJFSafvcpkFTqTbTYgCzhz7bIZ0qWSYKHKTu
	QO2AqU1F+K4mmlnwjXAvGllECeIeZ833IUGbhpe14JSrIy+dT0naZBUZeKqVrEfbbqB0+IPgqHP
	XZBieTP3bsK9AhyL1yitnxewaCv9AiRIZhXZng1uxIiUT9U+P1KtvTAATc4MfIPU=
X-Gm-Gg: AZFdTZc8iUxHOWoDNYVxknXtuJVvQhxf2xyT5uTbBKqYMuz7GoJxfckchf8cuhpgUYh
	u9XVUUkSFOb8OENzq+TWxvbV/0DqLRa5nr3tnY9okOK+xOTtIKtZHiH9E2oa+BbMZ/2kQsdnxrO
	iSgTBBUeeoT5INsbBZEITdVJkuVU9NuJX0WTGqggt6WSOT7ncGX8WgWE5L9F3nB7NKpkvbAyPOk
	LRPujZHY0gsLHcex0EIdAp7Sj0ZF+xtfpd//cNVMxkOnS0FEXCUgkg2E39f0I+g9AUaInW9dEpK
	sZ65pd1l9rak5Y1DauuHK7bi8LtXYtSkq84UpfU72NjzsKb2OqejefO620Y1VamSTNerw4EV/Zw
	zxuI/OpWbjs0hnam//VgpfbAVsP4jQhKtAp8SWvZgwSqMarvDhpBTHpTsnFyn8cn5gK721P3m66
	xeeIG7czcOd9lidpQZ9LGQ3UwG/A==
X-Received: by 2002:a05:7301:6181:10b0:386:b2ac:1f17 with SMTP id 5a478bee46e88-386b2ac2832mr3423229eec.7.1795458537728;
        Mon, 23 Nov 2026 10:28:57 -0800 (PST)
X-Received: by 2002:a05:7301:6181:10b0:386:b2ac:1f17 with SMTP id 5a478bee46e88-386b2ac2832mr3423204eec.7.1795458537235;
        Mon, 23 Nov 2026 10:28:57 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:56 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 7/7] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Mon, 23 Nov 2026 10:28:47 -0800
Message-Id: <20261123182847.143892-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b0485ea cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dOwNoGVJVf10FbPJOZQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 1EuMCyXjzE_Z-IKcULOBv_T7pVrUReQf
X-Proofpoint-GUID: 1EuMCyXjzE_Z-IKcULOBv_T7pVrUReQf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX1/ZJ0TalrQ3k
 +Lf8XGIU/jqoh5lcCe6PMeilHvKCH01BC5wG984lUSVR/PtDWZdECvtQd7/1Y4WyMn2JgIKMh02
 VI0IQsRsSyv+BaapP52m7Ep3xd+qIUY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX5eBcpfg6k6ym
 oc1XFpZ+wQj9O8g/kse/fdsnSixMYxbWc3JsyNVgHs6kRsPCzf9nM5Ve3ptW4Pn60RXe/0vgwUu
 zdbAvM7u3Bo8Ob2/z5kmJS+3FtFE4KmNMdp0FPQAkBQuk90t2/8nQcz+KAk6mFH1CHkBDzpQ5Gy
 2Rtjkck3TWJ75whVb+K0Sp+V9iXdg/1DWwC6Dcyb48vYp7Gdsagv9WYpwLmN5D7RAIzynJTy06R
 z1iVjuW3rX8R4uskqj15oW7z5vSbPdwaF/DIvddcR/av/paGwzI9tjmgp8ZMKUW2e8pY4f7NGrB
 vXbCt299GgYhxRhWHcPlwoOKaB6YAu+RCd2ZAAbP+MLSZxD3U5KPiNZx1RV8kFC0ujJ5/6Mn3O3
 siSAJC1XVIEw5BgodUZVvq9946fkcoSISYXg8s2jKZDIaQqwmL0sqokMhEHMlyrhjtKDrpjG/pJ
 U5GspqXih8P5CC6YEKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230073

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index b434b0447613..eba2ace4f3a1 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -313,10 +313,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	path = chip->paths[chip->port_idx];
 
 	if (chip->enabled && path->curr_role == USB_ROLE_DEVICE) {
+		/*
+		 * EUD virtual attach/detach event handling for low power debugging:
+		 *
+		 * When EUD is enabled in debug mode, the device remains physically
+		 * connected to the PC throughout the debug session, keeping the USB
+		 * controller active. This prevents testing of low power scenarios that
+		 * require USB disconnection.
+		 *
+		 * EUD solves this by providing virtual USB attach/detach events while
+		 * maintaining the physical connection. These events are triggered from
+		 * the Host PC via the enumerated EUD control interface and delivered
+		 * to the EUD driver as interrupts.
+		 *
+		 * These notifications are forwarded to the USB controller through role
+		 * switch framework.
+		 */
 		if (chip->usb_attached)
 			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 		else
-			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 		if (ret)
 			dev_err(chip->dev, "failed to set role switch\n");
 	}
-- 
2.34.1

