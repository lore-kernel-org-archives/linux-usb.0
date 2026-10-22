Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675716;
	b=bnypx67hymhKuB2dhOVpUbBkNlHHIsqZ+GFW3hPevDI2aFihvQ5k5dyVmruRgHeAQuOF
	 +XOqFPEp5OU5+nrWz/Ht86SgWD6qTHCxc2hwtFjxfXQHqDlt09AXYSAAPTwNWA18oVSBb
	 Hun7ZOfKtEsAp5ighsmtIPFtHZ/uVg+6sQ0oE9EEQZQeMDxZNaUML0KSkPqzqe5XdPthz
	 I29Jph3JTDCGnWKX841/EGwfDrhFrqjCtd7q1oslFKP4Y1EHIbG1jsiZlql5JxvYgAl93
	 IG2hT2RR63RzdazF1mWKyH1rdsDc+HcpcZSVNl1Hg5ytPQtfjb3hErrs3R+Zt0khlAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675716;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
	b=gBw5OStA70fOcyjbJUdRxDFIEqguvJFC6ax8D053uIu81C6ecQTpcQZA/LZ/DUJoK2x+
	 3ehoqyg61B0wklAP6V5xv1B+N2w44oirznZ2oMPhzrKj2pXCXnWfTnjtayfODEe4kSavo
	 Xn9ZqinJVWDfldieApqO9Zzil9Tcu4O8jz8HBbmx4aRoxIHpq4QOsXBW3ZHLC529yZzqY
	 Vb6VCWfBmSyhrVCcr/locZx6MA4zsXtHscKz4girXsYnGFPb/XkKO/ch5oHibmFWkEtBD
	 vk58o8MWrKPyNnWwe/uKxPtj2yPngN2iuIlKdSU5Q8mQV1+UBdU3iueUIms1QiF4bOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huq6+EdL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqPplk2j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE9C60A2605
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE9C60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huq6+EdL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CqPplk2j
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA051s3115450
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=huq6+EdLHIG2IKh9
	fq+pBx8cZXxAlw6MNLQsBsBq/skklFtFTkH9mSCKnIther6jO1a/HCONVvYjnXN2
	QaDCt6zjurulTvzpcbiYaCRzfYZvR4c1oCAyDzlgxAPTxrJtmDUH2olZjhE0ztaT
	V6TNw4uaZ2X3NoG8Qp5GL6OFRwhDGX+7Z7cqCx/WnzXwzLURb4i7N2oPXwzAmGZg
	E4j7rsqN+RkR7XbGOp/uhX4utIY8PH1+EJ5AY8tegI2Q3Knpq+Leq6P/5u6+b1RX
	VdNA7E5J1CPiPvBlJK+4LT9ybakIaQavIzrJIYYj/wYjlKKRvoggcIiE3kj/agu4
	izt4BA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bus6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso277735685a.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 06:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675715; x=1793280515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=CqPplk2jKt8ZoPdZTaMu8sXNd/E7t+ZJ8de0PTMel8Gnwx2cZOmcDqbmIlYUWtDfm9
         2NrO9/Jgf2yr31RZDmrUExFfHEZB9lMrhqD363CRLswXeWTi5N3r1XmFQMnGiz0HQ3Xl
         /4egygPLGKOocHoYSCljYoSrlZxtg7zmnJJ2AfeWjo/LN7lWnXfpPmZGMWzgt81c1H1j
         a1w3HAL+ZEzE3bsMa6aU4eR9QRgk3wMYRh8asZKYycIaMHZ5zwHUeTHkV23n4+LXxeAw
         P1KTQ7RPyLYRneIk+Ml7k8zbiN4qLXuc0azbmLCaSPCdHTRb87f61WLKMYVA/WrWXqXv
         oHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675715; x=1793280515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=CJ+EpnVNKOa7gCe9mwzGtZCp56igSPbIzuSejw1pU4FG3Z69bZPgAn8WpKyMbYLfaz
         ERme/CguAEBV33g98rlE6AW3Z6Sv42Y67TEukEM51356Jv6MQ9aF3Azsrp6cXFKU6OjS
         KYMqU9MjuO86U36DcQyGtxwfND/tcVTUu7lua38DELuAADJLB6UGgEnjkZfUS0XjnlP6
         8PcXT1CaGZlBqIvykHajkTvXIxztT8N+mwz8M/Rf6F5Vu+E+UgIMODjRZgHj/5yOSQJL
         kGfQBIHZ5oZ1oJwq8ESCQqE5B4FJzewhxuI3MRQFvxBaZhCt85D2pmMNVzkGPocga39G
         Xg+w==
X-Forwarded-Encrypted: i=1; AKwUvBwelLMir4Rej331eE06fOiKxUN/6xF8+O5CxfPm+MjxFXgdWQ464m84aAr7L//390ePRKmZAMc+DoI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA1r9+C5LgTmDGWcokV7dSChjR/Yb0jVFnFlQ7puNG3E7I9HCl
	kLnYP10ZOLTL8yurbJQ33XlAm8I5p8MeDauBqgDM6H6cMZV+VFB4mIkvOjig755msenq15Df6LZ
	ku4SD9xyOCILHuJ5y2HXf47b/BFGwXjLOro9iWKvXwWAsRc0s2xX9uCNe2696h4g=
X-Gm-Gg: AYBFou0unkh7tOoUMf6HG5WcXKeZD01oT30Zlf3bX1E4vcvEUy2OUvVjZPMxgrrlZO6
	Y4MaPgQAwoSuv6HUv1g4e26U/GKROcmfGQJE9/1OpcjuKpWpgOMPw4YQS/3H5yWZ6iJCBsvnQxm
	O7kXpnnUZZZ+BMI15Ve+kwfxLnpvogsUB5w6uYYiaQuvZrfeA8CxiH8nMz4Y9d60W2Wc+f71gS9
	JX5CM49hxCrBG89+20hCamPx+oRsDhWZYnut6D/sKeDLfHvdqBDTvHgvDvviBDIQ7OqvXQifAFJ
	Chxq8+qMZiJyKz/HuTPlMRvUDeYDubjTqHvNKl/HXF+WiHWAIHlEiyZYxmxhzR3L/SrhM0O//g8
	HsT1oo9id1jF7IfSLVRO0LAIIYFPGYQBO1Yg7m+kXGLNoH3bAGdGPkFL0twa1/X+Funjft5Qigw
	6R/6a+9K6ogV3q
X-Received: by 2002:a05:620a:2b89:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93f57e45af9mr860584185a.4.1792675714460;
        Thu, 22 Oct 2026 06:28:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93c:7f48:8f46 with SMTP id af79cd13be357-93f57e45af9mr860577785a.4.1792675713861;
        Thu, 22 Oct 2026 06:28:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:04 +0300
Subject: [PATCH v6 9/9] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
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
Message-Id: <20261022-hpd-irq-events-v6-9-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9oUOGyoZ/Lo9msFFhzc2wcKn57bx/TRaPi0
 NP7H+uDIseJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPaAAKCRCLPIo+Aiko
 1Qn/CACG1K4eJynq5qB7lVOT6butQGOdb0Uhg1y7eGfXBUIIGj1DRv6ecFzKRRK0bqqp6pcC5ci
 EIrQitRmOJrdtYWSEpurrdG1g8G+KPLJUhVNQEysupJKk1UtdeTjjfLKzFo0433HZaIXhfDpj3N
 K3momphg+N2wrPSqKOypSco4Z/DK1vaIXXYy+0UWhUxrrYMXstFcdV6IsFrEXkcVoNcdL9pxLls
 IJxAjrrVY16uL/yTOwggUx66Zvog/fgGXfehXKJwmzjWKCAkhWW369L1wPJ5HGNAbqCPvQESo/X
 5Wj+blNVgBLSYe62VO2WdSqoGusXFkACUWYMezRkF7KbPzw6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX7i5r5Q5XYfGG
 cWBkvPja3zZXx5250qD9Au+COQBVLrLkT66IZ+rCR3pz/lm7KaCiEfkHphG0QuoC45xuvG40JGr
 bTZDdU6W2KjV+9T1V+s/LYFbQvd7tCY=
X-Proofpoint-GUID: QbTni9pEuGEuoUlu-UtVtUkFvTMV7JMj
X-Proofpoint-ORIG-GUID: QbTni9pEuGEuoUlu-UtVtUkFvTMV7JMj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX1bnJwKqMZDWG
 4evWivpCpacC5xHEr+d8o4kim+TORf1jZdV45wkADGezMHAnnKNWBJ5aAALxAyHLFSfvP0ZPVnu
 DrLbmTYKeGiyWmlGUUMJ2i0hAfy8c0oly4aXAlkXxMrl2YSyb9/22mUxC4cLPn7h4MGNwiRYqmA
 655lYi3qbQJsnYARfTYmWcn6kCplDPGuEQyhUHLBA8PuynUHZNUpjpb6xFXDC28BdgKFYwPH6Id
 Q6qy9PxrGhDY7+ob1lmfKYhaWDMEYLowvp/8tVhgjjnTJqFN8JpxsthMCjXR8wjRwaa+APrlpgX
 gRkz5FZilrxt1bMDwFncGDwzWKwfbkoIB/cmX7yhL82VzZBIXvobVqjyV7FkwAxW9uVcnn7dyXF
 wmfuOKPLzt+XJJ7h/bvLTnrojYeNNA==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada0f83 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..cb0312e2b8dc 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -316,10 +316,13 @@ static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3

