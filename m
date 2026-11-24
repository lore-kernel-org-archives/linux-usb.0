Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542430;
	b=Cipfu59IKS0KCcStzg7yXvOFpg3nKueWqDcOzTovQZFH1JKiW7zFhyukIe343cXtpMBw
	 Jlvcpmm7yBEJji+UCwC3GHcSouv6LuacxFqA+GACpA4QHFShf+j3XRRgroBYJvhMTtJg/
	 0po46eau3Ld9+DGjmwU3rzEytvy+VlHB7tUAjZSxmi+xgSucA1hTvyFtMvSwiNpWr5Pgb
	 qHqO6Hz3bTX7vcrFtRHdSdBsKUAZkB22N2CFQOioEuyzg7lUZnWCQJNnOUSDjjbAMBFYU
	 xKTOBCzvz+5hfscEx0qQLzgdPu7pYZXsQ5R4reAJYkWHeLp3vQ6eJcrnAsFk2aBUexQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=;
	b=2NtsI9RuNZTwogTo9g029tN1F7cfmGbxD4Ma7w68D63uIWbFjUHsKzYZnArS0CoQL3rS
	 xyLxA6CbSi4MtxR692te0TnzuqY7chyNS8aI6wO1DA44iGu5hHZwIUfXchxP7WY6+fkkJ
	 mC5+UdjZ3aFDxte30AL4ypb82t21mionN7+uJtNAVqyQyzo/Bwbp45gRlzS7jKu7OToeg
	 tMkfEF5z0rm3LvhPWNDLcuvScyC2bVPsQNuGP/HmuIZrkfliDCbQkpqp2rT0hEZhoFQe5
	 Fo2ZlULb/nk2L+2ECYJYKmB144DfFF/e8IpudBuww/VtKeVKxdlOeXf0FRZPgPaSs4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MNs6LN3/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZJsQ1Fo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B3A606A685
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 17:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B3A606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MNs6LN3/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZJsQ1Fo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLKJL3267113
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 17:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=; b=MNs6LN3/lG7+yYHD
	4I+pmw6gq5biWDVZybF3pSL5Y8yvHq8GMXNkJBViJJG0c7qhi4cpsFwKAI97TW4q
	sOtJM6FXnBa4LDnZiCrMIsN8Z5oeMsXQSyr6SfwrPmnvtmrLg59TvRAateI48O8+
	yIdHnDehRmNX8NzJKhFXKvZXJRCVOWmH5kgJCjVXN0R30gGEgiiRWXnxXIG6pSLl
	ImlpVHCjYXoESluFnKTAf6xfIvn0uq175VN4JxWfXZVwNFKpXb8+8jkfW8bcdkbz
	uK8dBe8JAb6vLv07jQNAZF7Ox4mg3c63iBHM0hDd6mKYsHfg0NiXHi5DKv8ixx3O
	BBH1LA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7sju0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 17:47:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806756ea40so2967533241.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 09:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542428; x=1796147228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=;
        b=bZJsQ1FoaVIgKZbBM51qzc6a3py4dYf+5W93a05HEwF051NprRArqZ+ow3K94l0dZ2
         KKL/MXtCuGapcHIUaylyVp6OAT2zUZ9fSPOUKeudD3LJB21LfigaPUNTJSH+v7K6m52n
         Gh8MrgNHgraewYEISTt7cAw2S5tn5tEn1ZIDO4wLkFizeU1V0X4qh0vr9gmSFrRHr+jD
         pdmcduhcWRQEc+IPU1EvU6Hny+1D4dpKm+F7Qyc+G5sHx/MGq05Wxuzfi0JovbkJ50Gr
         epqGedB25Y3tKt2FYERv+vv1l9YaUxq0rMpqWaF/Ehb1WSnLngvfHpT3P2Rzs+Scwv9l
         IQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542428; x=1796147228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=;
        b=xJoxYZkWr5SM0IlAbLHAzjY9B+gBEEPR7Vm2I3DQvJpODl8T0Kz8cS9cLZMmbTt2CP
         vwXeHkd72rm+DPFUNPQ84rEmAAEYxnK+dwbGli9xsQKItIEPRFumdJSbTlYnOxeeBqrz
         ZYTM56hAxyWYcH2E1mTbLcksyqhaLqUWhtI6wF8pU+c4uUPYiMt1xAsA/BVNFMv1JyBz
         oAkXt4HJj/l/N1S9diONxCX1LN3I7PVi8hweT5YDdi/rXSBf/6MXTFD+QCMLpQ+0Laqc
         OMQWgGpGt6BDeI9duT6nWIeayXNDEaOxVDZSP7z43JGxB3p9S0lppioGiCryWUuUkmeH
         4U6A==
X-Forwarded-Encrypted: i=1; AL+hErFXHOTqH0zcz0SuOpZyKrEFt93c1m4bbRCCRSR8ZyHqSydUbeDwZqgEsOxLll0hAOxGgITL25L/OzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WG07b5XX0cJ3AHywWft+WMET29ECDPffS+heYspvcfUwT32YQ
	/rd24yaVHAcGWaY9ac7Z5PjdU4J9EuUvtxWT30RFJFTDDCjUHJBgJIrU7HqM4ODzUvy669aZAwu
	XRdRlQp9HeLMF/ubrflx+p9x8pELvKIC8Tmi+cemHVgx7TJ+f04qYufnzAEGFCL7OqgoOKlc=
X-Gm-Gg: AZFdTZdcvw2OFbk0Oi41pkNVntLHIAsh56bWoGw5CHHKTtphLxQ5zdODj2+UI+eH5vA
	ept/v4IFqxSEUdCfLlhnV6qdr+pLDyZ02/Q/86cOUuCjpn6xzlDV3UeQBYWSa3FmFc9IKlc1l7Z
	8W9+HbFknToTaHnCvSf07ljeELnBXIpYUD0vBZ4zdJMfkJX/AOs9GmPhg16D1lAUJMvNKSAqUny
	ss8QLkLPSByBYNvhTXfZrGpqFTCxyvLF5Uad5iAFM0gqvRrYzOyOh98/zgGsMB8+naWlvAF0DQb
	m/AOa+Li5wk0ZFF8uKMu7KK7p86CHE2Tri1JihVH4o1Ic+Ot8k+M0fLgneP63+I3FG3twHSuUWT
	bJPfRmsPrwOHHET3+f7AkM8jPlEvDLebdXrY8EPBPNquGrxKIXDRmSSE5NoraXNbl+IyMFVLRph
	BJvDBHSj+Rs0xQ
X-Received: by 2002:a05:6122:893:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ee8af4d132mr9297797e0c.13.1795542427614;
        Tue, 24 Nov 2026 09:47:07 -0800 (PST)
X-Received: by 2002:a05:6122:893:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ee8af4d132mr9297784e0c.13.1795542427090;
        Tue, 24 Nov 2026 09:47:07 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm7396418a12.20.2026.11.24.09.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:47:06 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:46:51 +0100
Subject: [PATCH v3 2/2] usb: misc: qcom_eud: set the TCSR check register
 before enabling on QCM2290
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
Message-Id: <20261124-qcm2290-eud-v3-2-4f31aef8c1c3@oss.qualcomm.com>
References: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX7sqTo/NfxQpW
 KDNQ/TcpAb0yoI+WbZBC/9DN0CUT+XKCxKn7zbG7L0z8wBCAls5zEV9mrG2c8s1pWgJqz2XhV1w
 mrlOOs9+1XMoZAvvQnzA13s0XQtU8AU=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05cd9c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RGBH_sVsAxb1F4UfViYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX0VMAA042ilgO
 AbsUOApTdhigmj1lhzn07stOqBX3eFGQ9Y93GwknDNuKV3XSvYpUPW4PmpwAK6Qz1MrKL4SfQjG
 QUVwLVBSGtIeQnXpeIiWZr6KgAxORG/FlpmgHxWqWGGnOsjbCETjCU5ED6EMykA1+RuHfp3rlbq
 rilmofT0mZfRby9Kpd3Nx5s0xCgNgzDJ5cib4DN5/tMDMdq0dEKhx/1lu5ec+bFpr+FK5dfHqlb
 tdkkKZcEB6Gw2V1ocxrC6E9zjpfBWiK/F0zmjM2kXfznXNXFROml+9KOeNZJ6s/wmnISn9qmPnw
 RUhklAj2AOJxwfkUj5DnimGpkprHv0OONudJt99F/lVRCJoaJBn8MXmXXrYhdIGawkbiuE/1sVU
 CRg1WcTUrMZ1ZQpT3RbA2ip2lhplO908NWjjXeHCY4yILrifPyfUazyIA6eeVIK/+rBZQNhFPPx
 4BQmWmLn0ZjGBKxDvMQ==
X-Proofpoint-ORIG-GUID: TkVTAtpRy1nhRwAEfua8G--k0bcPJLWu
X-Proofpoint-GUID: TkVTAtpRy1nhRwAEfua8G--k0bcPJLWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240069

On QCM2290 the EUD mode manager ignores EUD_EN2 unless the TCSR
register TCSR_APSS_SPARE_REG1 is set first. Without it EUD_EN2 is
accepted, the driver reports success, and the EUD stays in bypass.

The boot firmware sets that register itself (TCSR_APSS_SPARE_REG1 = 1,
then EUD_EN2 = 1), but only when the device's debug policy asks for the
EUD.

Take the register from the optional "qcom,tcsr-reg" property and write
it through qcom_scm_io_writel(), like EUD_EN2:

- on enable, set it right before EUD_EN2, and clear it again if EUD_EN2
  is refused;
- on disable, clear it after EUD_EN2.

Whether the writes are allowed stays the secure firmware's decision.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 55 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 6743a1c7d717..30ca6ad564bf 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -36,6 +37,7 @@ struct eud_chip {
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
 	phys_addr_t			mode_mgr;
+	phys_addr_t			tcsr_check;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
@@ -46,9 +48,23 @@ static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
 
+	/*
+	 * On QCM2290 the boot firmware sets the TCSR check register before
+	 * EUD_EN2; without it the mode manager ignores the enable.
+	 */
+	if (priv->tcsr_check) {
+		ret = qcom_scm_io_writel(priv->tcsr_check, 1);
+		if (ret)
+			return ret;
+	}
+
 	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
-	if (ret)
+	if (ret) {
+		/* The enable was refused: do not leave the check register set */
+		if (priv->tcsr_check)
+			qcom_scm_io_writel(priv->tcsr_check, 0);
 		return ret;
+	}
 
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
@@ -65,6 +81,9 @@ static int disable_eud(struct eud_chip *priv)
 	if (ret)
 		return ret;
 
+	if (priv->tcsr_check)
+		qcom_scm_io_writel(priv->tcsr_check, 0);
+
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
 	return 0;
 }
@@ -190,6 +209,36 @@ static void eud_role_switch_release(void *data)
 	usb_role_switch_put(chip->role_sw);
 }
 
+/*
+ * Optional TCSR check register, given as a TCSR syscon phandle and an offset.
+ * It is written through the secure IO SMC, so only its address is needed.
+ */
+static int eud_find_tcsr_check(struct eud_chip *chip)
+{
+	struct device_node *np = chip->dev->of_node;
+	struct of_phandle_args args;
+	struct resource res;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(np, "qcom,tcsr-reg", 1, 0, &args);
+	if (ret == -ENOENT)
+		return 0;
+	if (ret)
+		return ret;
+
+	ret = of_address_to_resource(args.np, 0, &res);
+	of_node_put(args.np);
+	if (ret)
+		return ret;
+
+	if (args.args[0] > resource_size(&res) - sizeof(u32))
+		return -EINVAL;
+
+	chip->tcsr_check = res.start + args.args[0];
+
+	return 0;
+}
+
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
@@ -220,6 +269,10 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	ret = eud_find_tcsr_check(chip);
+	if (ret)
+		return ret;
+
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;

-- 
2.53.0

