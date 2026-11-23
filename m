Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452192;
	b=1hoYvQybXLG+qeRwOl6Hraw5+DwkG1ya5FjpJviuy82lxDRHSUv9mgLKrIe+bHqCizm6
	 Ln1z1jhyltbuVhzu7JD6WdR5KYJVN0k5WU2Wg2Vw5ARaKJalWOeHVmgB9bKiEV7e83Do2
	 KdySXJdpz0TihkbVt85tNn/SXU0FfKCVnh7Dox/LDYhJRzPIacqJELa1Z241wV5cLbGfD
	 MVDmwFMcPsTfcp9O4DW3swAR1VXQw3q+G+qscywpyDL8mlP4Za7AB8X09ZV8sswvYM9Es
	 FZmWCrFAmydaMmXeqrVM4u5tN3gNbFOvWUeV4py9DhO+mM7UKAf5/IKi5ZKPYc5lEHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=;
	b=gBWxDhfsBsmb717YaGXVwUn4wIM7OJ7UiTk2EYYWGKSXoqGla6n3BWXhz2hcKcKrJAXq
	 +00tHPIN0mJf6+HyMu6f4GHjR463N2YYDfVnPGyzIm8shziqUHG9d0kVZkz9RJfbLDPws
	 odpeFmi4c1vM6ZTArKpQQNBuepmqk06QV4QGCVZ+aXHeEjH4S0j9fehJfc9e7faGwTXi4
	 Jc3lR2yiKA4glnWVty18uEZjNK6cvxztnCMTrlsXHmcyMA9Dc8kSo0iOmesr3Rck/nYNT
	 cjjL4ek9s8ML763l47Krnk5rAVem3bY8jKIpC7mrUQEGTtRQiFzzCtzJlTsyorO5/8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pBX8tEHG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KddR5pFX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F7B606A6A8
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F7B606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pBX8tEHG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KddR5pFX
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxMZ3730309
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=; b=pBX8tEHGMxt7t+Fe
	gOe9ZlhDZ69XL6O96myWKHan2DOxZEa1hwbApKly6Kw4Nzx4UC71qx3rAqbq5p3C
	XYcIix8Q88EhoUKFJYtpc0oTNaVW49cqViChMZzlBh/wr3IGtabxdf1Z3NRthC/y
	Gwy4x/i12cy2AG1AEkVLQ70hqQ5eE4hflHfL4RBoxxFFKXMTYN1IVE+AgbExaOOO
	pZXUebKCWFfx3GtYjh33n7dkQttKo2afODe/Yorp2Y78Ytf3aMhdhEdt3N9HUEbr
	UHb8n9gIltqmWtgXGMNeW6GiuidpgYr5L4ydzoDh/cqLr66lYLV38uJ1/nVYQME8
	FHSw0w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2efj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 16:43:10 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecc172164aso2713572e0c.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 08:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452190; x=1796056990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=;
        b=KddR5pFXbfdUI6xKrik9+go2urIS0DZKp+4y+V08W4XKa54bLtSIBAMEYaw1L0stII
         HdClsZlvUZEITG9w6QlwON56dcOI6t3U5g5VibV1IWSwI3tbn1IQZP3XW33aIHwDdfls
         7i2WbgyxF9jPIE3mPyvmyWGvBynNefjGWcyz9bTTgFdZciXCG+vfq9UU9N4JzaZmsx3Y
         qMfHXWp+SYURYrhAXvBu8WSDebpdI1A6IhdqdQzrWi62+dkCUh6LoR6xZ2KoS8fimJnK
         +iAiA8zl9RklAg1c4OdVe6s+5+xW113lfu0x6HPNgNZn4qFTe5CQIGAA5Kt+F+F9lMuh
         nuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452190; x=1796056990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=;
        b=VS+2VdcA4hmZ8ilJGsdCoS3Y07xkcyPcZF5/cxY++QjfXiCdNK2OtBJWWvGhFTtsGa
         74zlzbmmZjAFtrMn66Rzt7tgTACZUYubXSM28GBAx4KvP+NvaOZmYucA+MTEmTX5ukiP
         zhAMJ7Lp6M/Uc5M5Lzgkp9FRCMLQ91FjPxoQXsmMFtV0HDpDPXpX4pwy6ZG7Oxqku+US
         up+6gY1qj84MkapB3vQ5Ob8c9h+4BBbeK3KsvJKZKDrAJV9w8SfvvWqrugx4gt42H82O
         uJLWKsnYYudjDIWPnvZVB/pBSi95MV/fAGZz5n2nQG8cUycG7k2YyOf+pVPd3s+nxZsq
         TzBw==
X-Forwarded-Encrypted: i=1; AL+hErEensTI8Ktk1ulanfMKudL4CZs7a+E93UJYYa8Q3FKGl/gT5qGgVQuAWqhSZED6aOtWeuX/j7Y3J3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O6jssNyFjo1KpS2dP5Rhm/nVGM1ll5wVTXLQoHRhuzZ7cncK4
	zlrkD0qAZvfV8Tz+0dclcBLYCpjzK7+LycKZY0xQjYhsYiA6qvFcF+wWKL/+QGNnnlO8+t3/BXu
	Rdd8akpRHYY7Xn+p6fsx2hjJgWoerzqYMr93LLUWxid6KjcjjR6v0n8vpgZrNKco=
X-Gm-Gg: AZFdTZe6UgF83mxGgUJvy+9td2gy4FZMxpXGResZPct7xCuq0hBwESc3YVIkHWx/DsO
	jICzjXhJxzu0v86rcguMWkGZ54NxMDist6JfT+FBrmSgQmG/n3VV8L0da9w/us/FkoJ2ymjGipW
	K7nZI+jFxUX/vv+SySZYzR5QxafbUF8wAkYq11NLrfx3/i4I6qJLf/s4QDZnCb3LWW2D5EDK9FD
	AIAP4wN2w7jy1qhC/6feCYP29ICUmyk/8d5FMTovmpAibfKP1N9OnBvNmBFd/X68uvnuskVhQHe
	pNsAO2FxQKN5A3hXtLcmXxnK6ISXApMU559u1K6TlYQRN9C2WlUtU+7NZeryPEGAtXb4+F8wqd0
	bWfgxw1AoNzaTOzqFjlwpM29/Qe33L7CnQKEsbVgYdTH71SF1a8l1GFaqTz4TpFAUGZ4F0211Ux
	l5Ca7iLuDIboYH
X-Received: by 2002:a05:6122:616e:b0:5ec:4653:2431 with SMTP id 71dfb90a1353d-5ee8af08643mr6845745e0c.15.1795452189643;
        Mon, 23 Nov 2026 08:43:09 -0800 (PST)
X-Received: by 2002:a05:6122:616e:b0:5ec:4653:2431 with SMTP id 71dfb90a1353d-5ee8af08643mr6845683e0c.15.1795452188978;
        Mon, 23 Nov 2026 08:43:08 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:08 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:58 +0100
Subject: [PATCH v2 3/5] usb: misc: qcom_eud: set the TCSR check register
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
Message-Id: <20261123-qcm2290-eud-v2-3-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: O0IPoFpOEdCpB-mex2bYOFNXe97l6beu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX0A0VssYg3G/X
 xJzTfDHCUJH6C8ouyVlWfLnGQlGqEZQ1Erkua3CPtqG0WqPzhEMl4Gg/yicmhn7mpCRqRIfuYBv
 aDS6lJfqtvmlVXHyhz75DmD7WpNDwM+84v1Rh8iV5aSZx8Q/Ru6Nym9uSaDi11qvNf30kDihos0
 7xFMC7WMpAWnX5R8bvUjXtj6ZyqSOdXHrh3HGbxpvUevPF3MTrx3Kg1MHWNF30IuftLfrSk9nB5
 oqmXm/gNlhZbmX+S3HYOu2JHdR0t371B9pmuvWbif63S3NMx3/yzXOdBRryYQ1hSwZLKnGD/CR1
 pUqeCt7DoaxXBQa4V0gDwjzEf0P5VqZtTShhbeN/BQ7rvgTnb23pYRNTpGHSD7hPPv1+xN45i49
 WdvnA9amA4pnujRLnkz+mEqmBACGh2W36cUPAvSLVc2PPAd9qMag1DEWB7VVWs0QcyjmBUsUQ+Q
 hpUHIKxi1zTh8001mgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX7wKEAc2q2QGm
 vxzTIGTz7ZLEo5chQdBzfd6/RJ9R06o1j7C0HnpzLYVMzDnkGTTaDAz/lUB0rkhjEXOoyIizhtH
 QPWqDGy710gwfWlx3OzW7zYv5U5m3/s=
X-Proofpoint-GUID: O0IPoFpOEdCpB-mex2bYOFNXe97l6beu
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b046d1e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RGBH_sVsAxb1F4UfViYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230066

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

