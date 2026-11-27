Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757005;
	b=vF3HOJ95DxUMFPsnhVsGA3rHWbDfyUbNXz8tV35b6WueVbp4hCis+HJ93HhNVSr6KAJk
	 arOH+jMkNLKVGEQm9UOHhxUACAUNUi/Wxs4VN+SelOaCivxuVkH7ObDNd8TvYYkuqYZxB
	 9OGlRpBPcn7uUxp3btz1HlICUvmSldrjlU1k69zbh4FkrL94ZyhL9Ym5vRO+tIVivvy9R
	 eGVoymLDIzk0ZggYlLLMJP2UQ/A1MbQAL6Gxtju5a9JGmXNsTBxCfFRnv8PruSqlySIzE
	 0PT1WboOEVwzeGxavct4uEIP1DpMzMKJKpGvaRVZcBVcoz2oRy+AMX5X0VN/GdTprXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/XAwtv75GKNEZYxgqkQFPqgLoDnSvFQIMmv9pMpO9mI=;
	b=B0KOY9e1uIPXzMhcQSc5v6GJskObhESKQFpVwUvF0u5SmbO3Y5YM1dWCIdlKJg0HwvGt
	 e4zQ8vxrwpnu4NxNsORmZ7ICQ+/4vYkWuRTa9Jy1oaRxt+IUHCMVWm8GekR3PG9r4BLJw
	 D/55yOE5H0ymXntEGatdaAquVkgsGq2/6j+j9DeOUY4o1XUWy8I1Vb/svHaUaJ7nMaxc7
	 PDzWh1joWPH3dEapGKKzryMoYwuLKeY4Z7fpDfbKb5MyPjVWVTvquwFQ/adK+wpvT+tzg
	 pOXCyQS5ADscJpytfOUT+xlVsjNY0lB0x7ryYxBPzGFHUHvSQ72/yTOpN7PMnGt5pzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSMywDds;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0kQ+vFe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE1E606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE1E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSMywDds;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0kQ+vFe
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR55S6K2831519
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XAwtv75GKNEZYxgqkQFPqgLoDnSvFQIMmv9pMpO9mI=; b=fSMywDdsFqHHk+s+
	tW1dUgExFcdPWhGl3TOHnpiLiaJjXkMp+656MdMvikbgHq/Bs7aKdOicsTIOzoj9
	bSMcot11ua/l1kFR8YvTE2YlHQYm9ZZlEGwbLvcE6amK0IbKkLqNo16KEeqpdSme
	D+AcCApsLBLwgukcf1Pas/NdjWr8qakM16+R317dEaqKKDMgnfZxR4tG5XqV1QSO
	6M/IQq7rnJ9KU1nF4mp+fO37015edF0JO0zPivCKFBTI6HZSybfV7zoe0mCbHkBc
	bmbYkHwGKnrCGMAF8F8A80kkTjXXirmomJ82MNyUPURRaeR9qhBZJzgLX50Cuy85
	cHIDTg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh81tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:23:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b494fe37e8so1019972a91.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 21:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795757003; x=1796361803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XAwtv75GKNEZYxgqkQFPqgLoDnSvFQIMmv9pMpO9mI=;
        b=M0kQ+vFeTyVuwua7aOkSlYjpufjk/6+XGlnV0mCfIqrpscl/lVpUC0i00+S3rBgco7
         NIQuuzubsInut627tkP9fHPzo0v6WvLcX678OTIG0ug70TYrsJryg47xO0H6QW6QXWvR
         xjOvTVTPfr9G9olAmPoo7GQkAjjpU28zkC0A+9DAJqR2BxoInsbteInr0lUMNsO4M7SX
         7ELXQHRl5fupeEM64tTz9Yq1RTh/H6KhRqbkAKoYuLWviVjYwcpwYAlLrkVOusA3EL5t
         3JWVVHCj4LfGV71M567uD9zxAKi2MgTKbievYJEnUUZr4GuRsIhfcIOkNt7fqEkdrXk+
         alTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757003; x=1796361803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XAwtv75GKNEZYxgqkQFPqgLoDnSvFQIMmv9pMpO9mI=;
        b=oSjKX6Xx21zuwAll9K6+PKQOz9b3lxL9KL3cQRimWzrkBp+JkY9+It/6cYMW+oR7XY
         pHz6kStmQjTE8mmfoS+cNVsFHPHTWYKQwvs3YkEf9OcFWnvIoB8yAVvohb56YkbMyEEM
         NmmMUWlKTDOGmUq9Ft5Q9b8ZexQ0+uzQDFzQKy8ZDmOuxUr4xVeibwr8E+tPGDIA6NTs
         4gfAElzfw7EhZSQpJyiFk6fe6UFzqJUY/q3NIBU5Z/wpKOaSEak5JIhlhs8uzfSa2GKI
         3yJYw0w/nUoBsOApFpLdsnaim1/p+BgC4vqaf0+iJZyrlQ6EZ/ldbIntajKcSwPcdRCZ
         bBUA==
X-Forwarded-Encrypted: i=1; AL+hErGMpOhn4unAUkFnHTYMl21Bik9dqXlu7TZ+1jHFWMJR9Vs8XWoRyWlUvzRzPXTDWNwy2Vl0IRfwlSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+cEJTJogO23yBwELB39m8DCDlhasF7FFG7SajoM1yCCfNGf0p
	PXEiWUfp8wQsRxDh47OYZZsul1WFjl0r3VZZ6X3G2j/B0eJwnZKc/jA3qFufRUfBUkik7QYaXBe
	f7iSGo2VrVfYARuV0BLqhSdsBWcl3Y22SnHXsqBxg/EhH603HQfNqVhn0UoQBZZs=
X-Gm-Gg: AZFdTZeZhpHU2s3bxSRUG6JOj01eOThIS6Y+4A2weRterUAc5HbpW/So0Ax+n0FQMoW
	V16TOZfKuNqo1WAIRGr7LOTxxxUCwpen++YTouX40b/YjfqoOVG5troWhp7Us0rbEZeigoZe/lW
	W3DocIgKV3EolCDx989TOHev0FE4fmFSOsAjc30aMZ7l6mMr6k09EzhbQeZwlFjuF4K3ktuHtRT
	cI5xTacIkndqeW7CBAQ1f6wv1wf944tWamjOfrEz7Rt3+OQblxx8Nqskt/cL/zFBibDxZlR+cDh
	gtGRellhMWstoMbGg7J4pB9WLpckXbSQ+yB8IVxFc6bcrwed+6xF0u6UvhPSN9OT14Y6m5S/0se
	2hQGxY8ELFSBwlLkWOWLb3TLsQVwtXDidmYW2CywqE8dMu8KKKtoycDy5+42QI/FoCSr9PKUfEx
	vcQYA68EYx0ZV0Roh11lCOXjeLlp4lB60CjJRDnm6WFnu1MeSst9gnoT64LCcyS5mpLFejPI2+P
	5sFCJ4jRE7JRhiYexuz7sCXqIPy
X-Received: by 2002:a17:90b:39a3:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b41c91f7b1mr38330322a91.4.1795757002965;
        Thu, 26 Nov 2026 21:23:22 -0800 (PST)
X-Received: by 2002:a17:90b:39a3:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3b41c91f7b1mr38330281a91.4.1795757002478;
        Thu, 26 Nov 2026 21:23:22 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm38637787a91.14.2026.11.26.21.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:23:22 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:53:01 +0530
Subject: [PATCH v2 2/2] usb: typec: mux: gpio-sbu: Enable optional vcc
 supply
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
Message-Id: <20261127-eliza_evk_display-v2-2-e4223634aa2c@oss.qualcomm.com>
References: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795756988; l=1883;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=TAGiU7OPP0DmiRW1r6NgAjRh9iFMp42fKygt8T8dPBo=;
 b=LGI/AGvn48gKNMsc6mTiekzKj+lOk6i5FrXL8+Y4t1yZ8r1j2EQIvZDZbDpr6FzaYY82U4pXy
 pUc/IjzEXkqDTXfqWRfEa2Wn/SpimdIF/T68TwksNH5el5ntZvdtZGR
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfX2/KGv8NjDJ/S
 h2N+WLBWn1lnIj/y8RowP/KyUy7Px1LWRuv3tzTk+SQMnddQgah8hHD2fcSgfiek208PvmntfbS
 VHYRipCWDkbl8tsWwipzmVyzgUVHTcDsG/RzP9wQ0cWYic77PKRACBSUH8J5D1YTzW62dO/sG6r
 9OJNCbMYBezYPUiSGp7Uon/062YMjKFX9Fn3Tf0JICHE9QFz/1fcJLVjey3KJJVG6yMDN5PhE2p
 iaFUABbvucvOWZVB3VSZMjN1PuPt/S1t7XRSI7nJrYcTJL9U8zztqUKHvr01NyIqeFXGUWSwY/Q
 YSvXvSCt1kEnyPs72S+CzAuts5cq0c2CSoUPThExY7txfRnhkshhpDhXO62oqXcObbXpOZfsQyU
 qabQXJBh5DODhzknyzzz+rQ8yg20/3tOmQUHOxv8Bj77CcHfybZzshLSnrnQ3/D4a2o0KypFm2v
 idrHWhWuHvU/8gKP84Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMSBTYWx0ZWRfXxuXL07+PQSRX
 8vauELXJ/4lg2ZrbxLZiB0hX/uKF/bPQrjed8J19Cdr/W5HURO2ZWnDnvz78ARigRgsfY/AUzpx
 4R3wvWaENMOxgaOaX5Nzaio0+I5Um7s=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b0913cc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8W6NrlJ52h3mw0VdyTcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qfHoMZmsbQirex6I0Kc0N-vCfBUKpq2Z
X-Proofpoint-ORIG-GUID: qfHoMZmsbQirex6I0Kc0N-vCfBUKpq2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270021

Some GPIO-controlled SBU muxes need their supply to be enabled before
the AUX path can be switched reliably. One such platform is Qualcomm
Eliza EVK, which uses an onsemi FSUSB43L10X mux.

Enable an optional vcc regulator during probe so boards that describe a
vcc-supply can power the mux before registering the Type-C switch and
mux devices. Keep existing designs without a vcc-supply property working
by treating the missing optional supply as success.

Return probe errors other than the absent optional supply so deferred
probe and regulator failures are still reported.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/usb/typec/mux/gpio-sbu-mux.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
index 8a8aa7470df4..7aad3f738a5a 100644
--- a/drivers/usb/typec/mux/gpio-sbu-mux.c
+++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
@@ -8,6 +8,7 @@
 #include <linux/mutex.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 
@@ -104,6 +105,7 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
 	struct typec_mux_desc mux_desc = { };
 	struct device *dev = &pdev->dev;
 	struct gpio_sbu_mux *sbu_mux;
+	int ret;
 
 	sbu_mux = devm_kzalloc_obj(dev, *sbu_mux);
 	if (!sbu_mux)
@@ -111,6 +113,10 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
 
 	mutex_init(&sbu_mux->lock);
 
+	ret = devm_regulator_get_enable_optional(dev, "vcc");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable vcc supply\n");
+
 	sbu_mux->enable_gpio = devm_gpiod_get_optional(dev, "enable",
 						       GPIOD_OUT_LOW);
 	if (IS_ERR(sbu_mux->enable_gpio))

-- 
2.34.1

