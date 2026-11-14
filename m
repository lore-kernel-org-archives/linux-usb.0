Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670768;
	b=uAEN4FzX/EMvq9jvZLZGcKgRm/EFNo5MedWnh4drxdzKJ0nWWaM2mE2aWQA2VE88oAWu
	 fp+JO6+OmOpzDFatfEI8XNMX5uoo+gMxyCHYbP6gKQqCdrlB5yRIByBySSu148seE3dGQ
	 LlIJj1ER+Kh5NeP3+sEetElkUjtPyoU/iGh0h3sd9UPIatQDQ83NMQPL6igzwyRVKpTHp
	 alvsXsu5k1LUEdI5q22jktTshmq2VOfPAC5KrEVaj0YNdcY1ry+TEWHyMsg0q5+6NCkkl
	 XPPvhseyInr01oxaRgYz7/iNL3o7zcvLIhDxhpilTVTOHJnazA1x8ERyDNNPiajgouw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SWyi/ZODTru34xfLJVEvqhlK68Hp/OcA3GQnx4mgLAg=;
	b=j0dE3UTiVTSFxntQ14kD1QQdzLH2w18jeKL+IXaTteQlLc0+3Zz1im/Oz4DvcyVMjWwf
	 ZDOnjP4Y/b76yBZQnVl/JmDz/gSGfpJSXL5gadGZ/vSPFthP9nXNxDSkuRL6rYUtd4uYv
	 5bU3+jta4zz+QT79Lp8vqopow0dwqTr7O0GZt3rvFhSL3JVXlZMS02kDhkdcqOR2yHe1A
	 ZOGQ//pQ9GJFSxB3Zfz71a1rrUxYz6dLKOxOEp0sFuD3TN69tBHZsn6FVqjoVwzLy/uC9
	 7rYvU7o8CUXDf46uyHKHDx+uKwwT9w1j1yn4pGbhBlY0NPebHSeeg6/wreCyGq0T2tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LnuDwwMJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+yAc+SY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB450606A334
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB450606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LnuDwwMJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+yAc+SY
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDk5rr2517870
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWyi/ZODTru34xfLJVEvqhlK68Hp/OcA3GQnx4mgLAg=; b=LnuDwwMJ0nP3Gowz
	V5D8a7egBvEcXU/Xt1BSCA8qfWxHxtfYFc15egPSGFvX945dm+8bTgUk20rhOTm/
	rXXrHfgQV6xFwVqxp7l34YjVqyVo8+V05F0CyMvxybE8EllHV9CEIrjqYD8ObI4q
	1Qb2DLH0H0Zp5Hz7dzdnMid6bNxdf1fbJYlIx0M6+AucQwGCxTowqoMI5RLsg/qc
	kJLwzvPWbtDqQPnMdaMsslOIdvn6i2/KCIQqQgq9AadDQKuYdGqPZlC/osw/jkb3
	NLIsYQjiP7KsnSviwnLR2qQcjp+40NfYf/7f2p8oE8fJKdIDQ9JpOim5hinCSaD+
	6BtlnQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmc930a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:39:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ef0fe2914so38287486d6.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 07:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670766; x=1795275566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWyi/ZODTru34xfLJVEvqhlK68Hp/OcA3GQnx4mgLAg=;
        b=Q+yAc+SYYEe+IEInY5O9V5ySCG8cHb72BTuP2ostcloBTbLcb8E7kQNMzPxHK4pM6Z
         X0ryVwJBGgCr6+I0PR7SxIQ8MysLknvbJrB4RqkUerpbS0eup+MZvy+Kk3Koce/I2z08
         4sS1hEG+aKs94FSifvlymChDXP3YNFM8vpTpUB1lz6Zm9vb+otxdBVFgEFu3h0i5oTx6
         rTWoG8iHi6AjJbo5gtVgI7BH1C4vo7xfTVuYz0eMREIyr553OiqzE3ZFwNg6b7ibNpfB
         EmYnvjVYtoDOExGSpd4bdn4Mfa5jg2qgb/Fvtpi9c3t7H3G7cquKhvAouHZXTZgSTiua
         BMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670766; x=1795275566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWyi/ZODTru34xfLJVEvqhlK68Hp/OcA3GQnx4mgLAg=;
        b=CNmyVZLzUzwbH00xhPn6uAWWIpEevCtCiFERauG8HZwsoB9/NZh2xDYjB722u0kQO/
         oHk3/yyKYbTTY2G49zw7swQBPGIfI4GgjIlrTKIBlIN5TIg5t3tDGps6qHHBt82LIZSR
         lQigIC06oZk9piA5FfOF04j0UxeecLjfM+U27wzWeIEFx99BoXgHRQjVksBUF9Px/N+m
         DJqntbZ6KCqNgfFcgQGlkXa87p0vSAMXBn7abz2LzljUAQpo8Z8US9gBKbCfW2e6WAo8
         sFHRMe7F8lFo/qMKE/+flgTxkY5jopqRctSHH8lPyiTuZHjP4hy2erxy+pqNvpDYqJmo
         OiJQ==
X-Forwarded-Encrypted: i=1; AL+hErFF5Apw12eWPKNdKc93GbHRT1HB/f3coteLKFj9fVxs+KScoHxbjL/6ae92Y9ELHvgxXVw6637vUAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GI/2/xUQPwgZ4ZrV8sgHzOTdDnsENggu5aB4g2egskP7WaUD8
	ND2zFjG+JxnjUrSa+FOJYIj+B/tmE0BBoH4b/S/MKXmG50bpmRybZ0AuAvON+rgmx+FY95n0owA
	IvJX396Uo50dAFQIh0nBzEVmgrF4vjqrf1sJzGMoCtW3w6M+EUYyiVD2xz/RvZ/8=
X-Gm-Gg: AYBFou3C8mDvg/DHccE82HGbyBeTDOITSjoodHHdEQGPgI3cIpNq616cwOYVyAtnQhv
	iTNRK5lAis63vRludNMpLtpALV9LCrBazwvVrp34V7IFMXcVWSJR9xEkvr9VcS/Q9CxCY+mxUhp
	S2So6PYVHShYaKS0yCdyHdFar+GGsZenRyqx0FNbeh4T2uo3gFbgmM6FOGniLhDYeDZQEWLxuFY
	UGx+R4uKCIUhlbfyOSxhaTdb0niR3KVv98CTVQcSCmlAv+pePlMBDn9nvxOLv+bgfydVbCJn5+q
	xtvwi0lhnmp7+bVoPilHj2ZNQvVDRuzSru5pVKVxHG8IuGRujGohbVZWuGd0T4YPIphid6HH++0
	qUqamxhGWiB/b2QKDcn0LbPcOzqQG2q3e8RUMyPvhNEgZ2nj+K+infJNRsLyk9nH3cNG12FpIfm
	b+Czt/EBDWYsUc
X-Received: by 2002:a05:620a:a98f:20b0:949:6530:8170 with SMTP id af79cd13be357-94965309f73mr235195285a.16.1794670766045;
        Sat, 14 Nov 2026 07:39:26 -0800 (PST)
X-Received: by 2002:a05:620a:a98f:20b0:949:6530:8170 with SMTP id af79cd13be357-94965309f73mr235192085a.16.1794670765567;
        Sat, 14 Nov 2026 07:39:25 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:24 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:05 +0100
Subject: [PATCH 2/4] usb: misc: qcom_eud: set the TCSR check register
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
Message-Id: <20261114-qcm2290-eud-v1-2-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX5WAI4K0h0EpS
 Ex04mgbx9yXMzzCyAosuruHHoQPabSWRKO/hv9FXdFxBpfQlLCl1OTD8uIvZDjzG+1o8qE0LlK3
 KGkbbW7u0zJbH3X7vD62NoPThh9HVrM=
X-Proofpoint-ORIG-GUID: LxO3oxYfE2xWaci5vysVcrImYTWkdie9
X-Proofpoint-GUID: LxO3oxYfE2xWaci5vysVcrImYTWkdie9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfXxG8IZf1cMksh
 isb1CsgmWQaR+kwdpAKbnBDu161GG8heUf4JQvQ2z5Lhvx3v4+wnSLlINMJ/40YYUJbSVDbpiEk
 sBtH++Vx+gm8d8KGUpu9NBZUEzQp9uYvuQ46wZ1EkDkKt3VOhDJOz3+oVu6I2+T1+zS1NwBh24l
 Q7xUlJYEXoNwG8xSUD98tCCd1eTz8+O5nHAXOB0aXfWTAvLa3lC394Be9471DQ2SO1xAi2NL4Fn
 kDnUcuMPpDYs2zT2FXfEopF2WbdvkC8pAU4f6Rdq7vStfC1dXxFb0CmjKAN8j+ymYQvab9JSQ9k
 Fc9DFz5ChWuwPVoj5YxwZowGJam05cy1wf36zgSuTu7MwmEIwRjiCPGhf2+PHAslWBYa6KgEKuf
 n+qwKXP98FueJHAvv28AI+mO1qrlSyeJw/AIZaN+Q43sqlnPmbqsj98gPOe5Mhm87ibJdWKc9A0
 mxAwgSccxorkAYE0qEw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af880af cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ECuajReLB9cn1KhF9ZsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

On QCM2290 the EUD mode manager ignores EUD_EN2 unless the TCSR
register TCSR_APSS_SPARE_REG1 is set first. The boot firmware does
exactly that when it enables the EUD itself (TCSR_APSS_SPARE_REG1 = 1,
then EUD_EN2 = 1), but only when the device's debug policy asks for
it. Otherwise EUD_EN2 is accepted, the driver reports success, and the
EUD stays in bypass.

Take the register from an optional third reg entry and, like EUD_EN2,
write it through qcom_scm_io_writel(), right before EUD_EN2 on enable
and back to 0 after the disable. Whether the writes are allowed stays
the secure firmware's decision: QTEE accepts both when secure boot is
off or debug is not disabled; TF-A accepts TCSR_APSS_SPARE_REG1 always
and EUD_EN2 in debug builds only.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 73f9fac22e19..217f6c1791f0 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -36,6 +36,7 @@ struct eud_chip {
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
 	phys_addr_t			mode_mgr;
+	phys_addr_t			tcsr_check;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
@@ -46,6 +47,16 @@ static int enable_eud(struct eud_chip *priv)
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
 	if (ret)
 		return ret;
@@ -65,6 +76,9 @@ static int disable_eud(struct eud_chip *priv)
 	if (ret)
 		return ret;
 
+	if (priv->tcsr_check)
+		qcom_scm_io_writel(priv->tcsr_check, 0);
+
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
 	return 0;
 }
@@ -218,6 +232,11 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	/* Optional TCSR check register, written through the secure IO SMC */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
+	if (res)
+		chip->tcsr_check = res->start;
+
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;

-- 
2.53.0

