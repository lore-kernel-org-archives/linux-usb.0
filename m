Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F159335067
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786322586; cv=none; b=oL6trBhjSIIOUByOyz14lRZrjjcaKfdyGe+W+2O+awla9SPN9Nq8zE3EK4hIIEud396VllFpLmj7NpiKGLmEghGAvgps32UwmhLWw3/FMHJww3sw/cyfweqMVsIkbFai0RrNo+XfqSn+NOH6XKHYkww5dhlG3HRFqLi7h/dB8js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786322586; c=relaxed/simple;
	bh=gRmm0BDYx8mRh1Z6PZ5OQs0m2tqsgYby6M5EsFFhaE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lyah60aV1ICqtHlPwBwR3DcAoKVAX/dbnm+qTrxJJt/mJ1kOZtGo5Rpiy4yXb45SP+vqYsu9Ws2ks6C3OP0HoquwSbx527iVdvLYm0grTEC62i2leSuWpw04v9q+B0CsE38GzhRstmU6jOEAwZKhNX//yS7ZvQp8GPYL9vsdnyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JS0pBUME; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGr9ZRYH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JS0pBUME";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGr9ZRYH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L7mtx3436725
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HP8SJyAhLKviGYtSjEGWriX7L/IXdYTKdJPgALu6Feo=; b=JS0pBUMEGKa3r1gG
	zzvPXX0ESmaD6DyO14Dz300N0rUtNbCvk49AFvHOZakzSaGRnCyciykcneIQe+zg
	I3gP/o5djriiJaSgpqulBwg234RabmqyV3bOjLucXJaNh++m0s50rVKBOcg0Hvdm
	NTPk1icR/Y1LRS1wbwnLUYKhF4cZwBvFz8IRo1UQFetY5QuMGKwOI1Fx5Xd9djP0
	uz9lyFXBMplD51rssIkqIwmqq+JtIyifnNVD+ZTePm2u6vRKP0x2athRy083AvDh
	JU5HbB2K16SelRCMToaOubXUBltp/yVv64QwujN3iUJ4fIKix7Qf7OrZUKhvRfRs
	icqynA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwr9kqe5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 00:43:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so148565685a.1
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2026 17:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786322583; x=1786927383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HP8SJyAhLKviGYtSjEGWriX7L/IXdYTKdJPgALu6Feo=;
        b=AGr9ZRYHg0YVzc4lK45+PsrJ4PAYxcEZkB5toLODe43dyLh/u829s1hh7nPrw4v8s/
         h4CP6L6QoLipjA9yvF9lcy97Mlv24Re7PHY35mHrafdBvTE71AnSA4HkETOOlYhpWfjc
         p32vpubk4+aYu0v2KI+wWqBQ6yhtqcu3rzvyh3Z/rqYJ0GriDJ27ebTHupiT3pjhHVCS
         UsRpAx3i0z/hdJXADAoVhpvexLzu7JT9YuH8GZ7dIFd84OBjPw2xhBRskPEh8G08WtLG
         IQysumcxJWqaprix/+7qT4ondg2JQxQKOA4dIO6NeO5UDYA2P9trVaRDKK5xe+a9ryoe
         AIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786322583; x=1786927383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HP8SJyAhLKviGYtSjEGWriX7L/IXdYTKdJPgALu6Feo=;
        b=ikkFWIrFTpBiyHoOOeG1mzrxLnssndul9f75EBTcx3KpUlnC2A3t6fe1jmWMhSOUv7
         tv54UQoxcARvdsoUpbTf3Uwbyn+kt5LQ/8A32dyUabFoAfiA7PLmRndjpof56JP2SkmV
         ++ol6DR9VCDR49BlVdC/Q1SHHw7lTLEcJE763QcdyHxj+JFw2ZaErQudubf6FV1rhWrR
         tThjFzgHucZlB2iZPoDI/WZw0zIKN1BmQPqa2CeAe4Crr6Hm1iG8jksbwEbppqBFenb8
         /ak91XEiQ1YEmKdjQgrgbN439nJS1PPU54kQ5ccFxjJN8xA3HJvMOZVc+a1sEvIC2uS5
         pc1g==
X-Gm-Message-State: AOJu0Yx7ShnXxXIa8N8eSdFrcqicRWx/+5Z8+mLygqB87M8wqiXQn9cg
	H+Mcpqd1cVT9I7qPeF82DJiUcZz3tGa0t3ufN2qnzZnJKJS3AG+QdHxONVB9l9tSCvZqLnMe0Gu
	W5zyP+MO8FLpooRS7m9kbC3c+eu6o/sSUxVx18xkLw6XfjG6VvLCYhoolqa4ZegU=
X-Gm-Gg: AR+sD12YxRal2ncjoRmlXqp+IvZzaI9pUXBNLgF8lA7n1H4RFe+M7uc9UTJtva0n3GE
	Bceo8xLNoTGEwYszkI0ZkoI8Lv79h82FQzwybcb2zTI6HDlgpZ43FpBaOunbiacQzi59zOD+LeA
	33Cm7fllD+70vsKURdsA6oIFC1V/vE9o4reml7cEID2UzKg2LqnlKzmlp3k/Pyxywx7CNRxlT9l
	nf8Y1tW4+/7Np77vXggDXy46lXsYFpHUcAGWfEAvqqFxxyS9JtXjmXhE+wDoza0f6zu+U1XGRjF
	JcnNmh+JOWXtx7qIGkPE6jJlMjsHQ3tF5vi8B1nK0RCqtLMGKv3gNN7zcNXQRpcGzumaR0qJ1fD
	RHXOV1zuYoZ2gBq2pmlsAKtctwWarKRrphA8v+Sz9lXHcRt/w13x35j1KmSXqojOVJXLo4uSQ6R
	ik3Cb+RVim0v3BmQ==
X-Received: by 2002:a05:6214:27cb:b0:8ee:efa3:4466 with SMTP id 6a1803df08f44-908813b28f0mr470217256d6.28.1786322583423;
        Sun, 09 Aug 2026 17:43:03 -0700 (PDT)
X-Received: by 2002:a05:6214:27cb:b0:8ee:efa3:4466 with SMTP id 6a1803df08f44-908813b28f0mr470216886d6.28.1786322583028;
        Sun, 09 Aug 2026 17:43:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3d56sm1679742e87.69.2026.08.09.17.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 17:43:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 03:42:38 +0300
Subject: [PATCH 7/8] usb: misc: onboard_usb_dev: add support for the
 Prolific PL2775
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-onboard-usb-v1-7-08a805768328@oss.qualcomm.com>
References: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-onboard-usb-v1-0-08a805768328@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2849;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRmm0BDYx8mRh1Z6PZ5OQs0m2tqsgYby6M5EsFFhaE8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeR58PWyCCRUxEogwLDP4ZTfRDdwCRE/w51ayH
 zhO6kfivWWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCankefAAKCRCLPIo+Aiko
 1VXIB/sGER4tkYsOoO4v+Q7n71gHmoKZKEoZNEzqG67m81YJifbNWDzqaTk4KNdArWBXUvhA4Aj
 Tss2nrrvJPbLp1AqOEcYmyWjTCJBJDts5o3gUoLsU4H6RZd1jzoCmh4iIGwmRN/BY2FV2LdNpnG
 PanjStKwcSRgZavwePvPbNeRyz3rrXbMdlS8cFX5w0rUTKPNiL67UzBHpOrJYQtRQDAZ17Yc4qN
 Ee3PWIR/WlJ+eAaePJcbFT7L28rGzrWX3C9hhDVPZweks0MiiBye6Qkh4kNM2gB5/0N/vG0rpMd
 tpp95yfyPoyqrvJe5xe1LXnf5BwTt51e/gElQvV/Y/WErISV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=d73FDxjE c=1 sm=1 tr=0 ts=6a791e98 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=rf1umJF7nZwkx9SeL6MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: C_jjErwSv7Phu3-EB25QZmgmeAaIPG35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfX881vsSV9NvYb
 ENfQ8uQn6dhvtXQDapW9Q/kIwZx/Qgez/hBBDpha7+v3CbMWDrR6Vy/Ks3L+8Yu6ZBh990ymBkg
 xt5E9wN5V0g0HX+j6ojKJGjjHW9LAx3N9XFyu1IkizgTU26SmzWRbSJjXiymNdF5WPAuQTVMeb+
 sdHTLFr3PEOpFeNkMHUePwpKYhX9mb6xVWsBMk6n7gArs0Mgpikh1bRRrL7BN5Pwn0HZ7UXLXPV
 CRN5TirehSiY9jWVh1QEGBQwy+P0uNNIrHVwjSpJarfnAe21+sa+n3PRimIMAPLmiEq+mN1YD80
 4O2uRliIgIt8i/vqEyQSMwQRx8qIifWM0DL/H8UtJKwsLdXG4zmlL1RSIvUUPp+9AZS/IPiHub0
 kEw73BUWgpw3RK5FNDtHhGR1hD6aIkCHM1EbeoczYPZ9QfpcpyezbNW//NU3kCTwH63PzPzjKGX
 o2u+kwqvS8WpijFaOVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAwMyBTYWx0ZWRfXwC5s8cWN8RfH
 chPiuk/Tqltz41GZKe4EFfILQeWXvT/k6d/y2G60Hfcx4/ceFLgq+6NvK3PxvTTBwIZWraqTGww
 oPuWeUO6MHLELKZqZK+0TJfquDbwquo=
X-Proofpoint-GUID: C_jjErwSv7Phu3-EB25QZmgmeAaIPG35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100003

The Prolific PL2775 USB 3.0 to SATA bridge on the APQ8074 Dragonboard
has its RESET_N pin wired to a PMIC GPIO, so it stays in reset until
the OS releases it and the device never enumerates.

Add the PL2775 (067b:2775) to the onboard USB device driver as a
non-hub device with a single vdd supply and a conservative 1 ms reset
pulse.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 8139fe3f2cf5..6299c0539212 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -571,6 +571,7 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_GENESYS	0x05e3
 #define VENDOR_ID_MICROCHIP	0x0424
 #define VENDOR_ID_PARADE	0x1da0
+#define VENDOR_ID_PROLIFIC	0x067b
 #define VENDOR_ID_REALTEK	0x0bda
 #define VENDOR_ID_TERMINUS	0x1a40
 #define VENDOR_ID_TI		0x0451
@@ -675,6 +676,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x5744) }, /* USB5744 USB 3.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_PARADE, 0x5511) }, /* PS5511 USB 3.2 */
 	{ USB_DEVICE(VENDOR_ID_PARADE, 0x55a1) }, /* PS5511 USB 2.0 */
+	{ USB_DEVICE(VENDOR_ID_PROLIFIC, 0x2775) }, /* PL2775 USB 3.0 SATA bridge */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 27efccbe2286..11425bdc5a63 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -66,6 +66,13 @@ static const struct onboard_dev_pdata asix_ax88179_data = {
 	.is_hub = false,
 };
 
+static const struct onboard_dev_pdata prolific_pl2775_data = {
+	.reset_us = 1000,
+	.num_supplies = 1,
+	.supply_names = { "vdd" },
+	.is_hub = false,
+};
+
 static const struct onboard_dev_pdata ti_tusb8020b_data = {
 	.reset_us = 3000,
 	.num_supplies = 1,
@@ -166,6 +173,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,625", .data = &genesys_gl3590_data, },
 	{ .compatible = "usb5e3,626", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb67b,2775", .data = &prolific_pl2775_data, },
 	{ .compatible = "usbb95,1790", .data = &asix_ax88179_data, },
 	{ .compatible = "usbbda,179", .data = &realtek_rtl8188etv_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },

-- 
2.47.3

