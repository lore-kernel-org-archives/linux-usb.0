Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550527;
	b=MoZGtozPzJxZHvmFGQZND0hLs3GYUcY8DJ37z5RLr3hx+VfBfrDxUBeZAYSTS3dur3/4
	 3Lmj7tYZuqYw7/gpRxGHJffPlWJKK7vfkugewC5XlIcePY/vs8I5sfzU/bA1FM3QNQWKh
	 iujnHvIeUEDM0p7qa+BaKJZ21TTG7LAKONxrRLPLSn41eYkZTrqwWLG4UeZ78PsM3fCcY
	 WXtVdctdNHAtoWULs8bfZ/W2kb5bjvw0WQs/2eYvX6Kx6zIoHET6DgkM8A7xJ41w0DLjy
	 wqDpOg0/yVKwTjKFnJF5TP+nUXoqzvFvKx4x5PTGyYID0r6/K7QdJ7wmiwuVOLVqE6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550527;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kXrAKTKoyM5xio5+NQ27PIEseG7w5BBqcbm7TB3+sPQ=;
	b=tN16NMSFJ/9Qb7AenVZQv/p3UESGUXdWChRyvYF/5eDUAx7Bt10l+LF4Wud2k+PPDuVa
	 si6yY/kyPrpqJLm1LcYkYRMvtbPWFYkQgO7tKvofN0JAsMwRZOiMFzz4nkD07FuJzk/Hr
	 Tyy20G1Uuj4FNuJphpLH61rnhrfALcv/q/qdRsAPQ0TjuFAhhpsPTAAWzg5HeXLeyYQei
	 tFmpdZ/Z8lyc+7fJIzOiUn9ThW7e3/gqU3jsrKz6jAorZSfzvgUs8onkqs/GFqGMBH321
	 vbChRhiL5MBka6YDIISLlekHQgdRhrAUdcUs1fkBiwz89DHqIAmHUT7cW2Gpd6WIaug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h/nV7wy1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjXYOKbw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533C5606A33F
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 533C5606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h/nV7wy1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjXYOKbw
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXLv13000341
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXrAKTKoyM5xio5+NQ27PIEseG7w5BBqcbm7TB3+sPQ=; b=h/nV7wy1SJGXgXHN
	EuxfE25TSOCIoDL/UIXjrBt3eNdKOtx5SYPV8+tdeM+RVBU8wddGeb2Y8ieWrcBM
	ghdeh8+fj3cSvmS42qHakSK+s6tUAPW3WqlD27+Qs05JjMAzDC70Toc9wAnPURqA
	XRgE5hz84tfTvE/93Kp53pFcSa5LWLmzhFgA/EY4eTLmvMWyVt8xAym8KiLqSrhc
	BKHJKe4zPPJHXv8EartjklKRMoG+fXIEVA4iOxct6Zm4FI3E961ZO+X1G6rKxE/o
	Ep/YEPvORx8fgz8LAgBIkjOh8D9uNsbl6FkwJWuJ6h6G6OvXtkfx/OFEj5W8I2Uj
	3JoYQA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5f00gmqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc450e6e1aso221799137.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 12:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550526; x=1796155326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXrAKTKoyM5xio5+NQ27PIEseG7w5BBqcbm7TB3+sPQ=;
        b=SjXYOKbw3pjdhnhu0SK8kg1FwEiSboPEz3MtyZjVjAEaeTRjeQVEqojV0rB/pxhqkn
         VbKXjtiV6WOfLc7BPAs68PUV7nN0bmJRquCRTI0b7UuC+8QfyeXVmb/xJk4gbsZQx2ZD
         9SjgK5jEmNG2Y5124CjhV8a0uI653IRNcouGTprpK9uGrBWCewc8mwUU1kh+3692VzJe
         8q7ZpqjO2VzbR6Ets7zcTXTV547ezbGaXNUJ3eEgAZNzHSMbTNv4moHYcHfwdXDnk7IX
         ktI/Km7zeZyauni9sp8xsaN6fEGI2J7x7mwxudBB7wHavVc5u4DjYI/iQggxFJ0oahRL
         UfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550526; x=1796155326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXrAKTKoyM5xio5+NQ27PIEseG7w5BBqcbm7TB3+sPQ=;
        b=FVe+HVUrmVhgad0JR2h3JVn8yJEMfuLmFlhuq2lduNTZSkJpaK9lqWIqEpGR2EHj+m
         AK5Krly/Qbi61IvOR/QiskvlGZBJ1xKalFw39TNam1Gtw30PslOrha+3CH6kTt0hvFZc
         FQWiNaeP8hGYpd5vdA97Ba86xm2Bw8y8UMPuhtawduiJa+Y59BlZ2dL649CV36665mZR
         AeCPuhqUcQUNhUNZDlOeQYJFwHXXdCTMkm+xhk9XapWurbtOy4/mIEb0ZqwM8RKWd/qZ
         tjnf1xtim99pFvOy7Htehtj3KFBaoDLSwWbEiDcqa5rUFeGp8XbYf4W6WUdcAp6gflOg
         r6WA==
X-Forwarded-Encrypted: i=1; AL+hErEl78boelBTQcnI+98itPJs4/WPznjKVepMinP6LreYYw7MmmDYlBhIoimT0V+5aGG+0ZikRXNybXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xtwb0ZHGceoev7G81HYVVI/UYasKYM1+LZU7Ppt+pSofQqs7r
	CPp8iXwLngq/30SsFRHhmiDo8J6Wn66I0RgDYpcAVPwIXtyBPmDOeGSNpD1okQW+Sxv0OS+M+gO
	snJodDMkxEEfRy2WJCXErKbNCnXs2X6C9EQYm0i6QIrlInOzhxDut4HrPFjOi5T0=
X-Gm-Gg: AZFdTZfAxUrrXqqRX5SVp3mOLEHQWyAbfGyMkGUxNxQQ8bC1rpTolQpiZ9MRQbs+XAE
	qE1ygiCPeklan/UKwvn5hRLj5yHHQ69IgWVJIYc6YFVuSlr820jl9DhqbcsxT+FPNj0S1uy+fjB
	7B3FPpWIBT90ZSRsDFQS8gYNPojbbGtzBH4SHS2/y/TCVPcngjQdZLZ+Y3pw8Kyjo5hNCQvqOCi
	KVXIslzIDYagPyARAfCLWTTGHlQqV/PFKCBVRWHrMzM14qABpjEJz9c020aeRsAQi7ildl2veBf
	UCS32h9S8YY33m6yloPzZt4kxLtWh807z/Dwgm676XfisfpAqYM8f5H3l3J7bSzirV38SpKxYfr
	AdpYoRg8WhO17Yl9bwIenP0lcdIJ8/sJR4g6FaUKS+VlqN/36TFaj6KZ+PAiBSa+DiVYfCJ7R0k
	pvMb2t9g8=
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr11460349e0c.4.1795550525455;
        Tue, 24 Nov 2026 12:02:05 -0800 (PST)
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr11460306e0c.4.1795550524926;
        Tue, 24 Nov 2026 12:02:04 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:03 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:37 +0100
Subject: [PATCH RFC DNM 08/15] thunderbolt: nhi: Add pre_switch_suspend
 hook
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-8-a9b45c69cd38@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2074;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=w2JBeR9pVQUt5n+Bi6UCt4e2sRq72QDCU1+mYKjh9Fc=;
 b=1ZJEU9y0SMY1cHPgacE5QRcg2RFK1C5T3lOj0EsuHjb3tspsLLFfsvGcEcm6vOxGUnoYmds7Q
 l4V6QgK24ySATiNkZnm4w24s3GDOT/qMj3xzNgD+0XUEznWnLvsHNfs
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-ORIG-GUID: C6LaA_8F72L2lPiG3cj8G2-ssI1BMofG
X-Proofpoint-GUID: C6LaA_8F72L2lPiG3cj8G2-ssI1BMofG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX26axBC/ERiV0
 osgghUAqfI99G9Qj5JC/aSODmVqqSJ8mEV+pHYwiEkhKkuZkXOOkPWaC7TMNbxi44lCD0ISm0IJ
 y0LtCnegIZEIYzilAQQ1s+q7luj4zjw=
X-Authority-Analysis: v=2.4 cv=JqtkP84C c=1 sm=1 tr=0 ts=6b05ed3e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wKcZSsCu4wochMfWqzUA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX3yFOuhsMtLnV
 aXWrqmlDSlO/G74sqokZOPyIBwK1nF1o5VvmeiCW9trTHQ6hwhprFDVSMBPgC4r5s14S7zqx1AF
 6ximHa9nv5/8+PrQiyYIXnafX+0S8gS9JcZjUIzx8bMYi4jNYoNP3WrSUllHMz9QquKPFkQK4LE
 SaMYY7BC1McVIYu90I2J7YzEyFpBGr5aM/htCdV4pKWOl/0EH7EwQ0qf0MGwd53f/nrdU0k84Mr
 WZvICitc47/8ykiUGv/4TkTDKafaw0/M9viwESSFnVdPcAQ/DbjLZzJGrKWVyq2xjghxFp9bJFx
 RkljUVDddYk2ZUrx5BVSAPZ1ElFFEnge6Ab1AcWYxib23c+dpmQONFcZ2KpuyRx318ebz+9xYdL
 0mFMIXTU0EYaF+giFCcOLHQ6O/7hzcV3vlqvx26uEgtNUyvW8nPWbRQbhohBWEaq4zW5FD9g/1e
 s3EhQH73qHpUGCzGkYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

The Qualcomm router firmware requires a three-way handshake during its
suspend routines as the OS writes the SLP bit to a connected device.

Add a hook right beforehand to allow synchronizing right as it happens.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.h    | 2 ++
 drivers/thunderbolt/switch.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 71f750451aacae6ca2f8cb37bd8ae7fc5a029818..9bafb84cf60adbdee1f1f083732719e951b88c20 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -53,6 +53,7 @@ extern const struct dev_pm_ops nhi_pm_ops;
  * @release_ring_irq: NHI specific interrupt release hook
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
+ * @post_switch_suspend: NHI specific hook to call before suspending a switch
  */
 struct tb_nhi_ops {
 	int (*init)(struct tb_nhi *nhi);
@@ -68,6 +69,7 @@ struct tb_nhi_ops {
 	void (*release_ring_irq)(struct tb_ring *ring);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
+	void (*pre_switch_suspend)(struct tb_nhi *nhi);
 };
 
 /*
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d22d8db8f89064b3ed9c2b8beb8d5f0398640f11..4908c8b0e580a500acf9cac000e66a25e2102d47 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3660,6 +3660,7 @@ int tb_switch_resume(struct tb_switch *sw, bool runtime)
  */
 void tb_switch_suspend(struct tb_switch *sw, bool runtime)
 {
+	struct tb_nhi *nhi = sw->tb->nhi;
 	unsigned int flags = 0;
 	struct tb_port *port;
 	int err;
@@ -3693,6 +3694,9 @@ void tb_switch_suspend(struct tb_switch *sw, bool runtime)
 
 	tb_switch_set_wake(sw, flags, runtime);
 
+	if (nhi->ops->pre_switch_suspend)
+		nhi->ops->pre_switch_suspend(nhi);
+
 	if (tb_switch_is_usb4(sw))
 		usb4_switch_set_sleep(sw);
 	else

-- 
2.55.0

