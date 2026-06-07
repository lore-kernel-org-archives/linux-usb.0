Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A425331A4C
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 21:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868021; cv=none; b=OTYTKo5nfn5gDYvtCfvE8XeQ4JvR2dF5zVxReRsa1K4/lk5FzRsZRfhnvtMhT3d/37eXISySRu3BInL06Pg7RDPDPa8l5eF0NRFm5SN7vOFuXGPNgS9S3VfDJ3nggqCZ0Ayj5Za81FpBO8jBaIPrf+NYnitGqltuHgjGmgTnBcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868021; c=relaxed/simple;
	bh=3SjZ31inNFNocQI2RmpCu4Tw/qg0rtSCt0SZ5oE3dI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XU6wRebOAm6vhDp2WJvdOBvjwXp40D6irNA4QCObZ8I6OltZtSHJDUu1nfrF4Fvvtrf3qepjjLXXUazT9V6eGcw5AMjHK9GOduzdOA0p33kU1DD9j1p+tmkt2KK8zF2Cu/xXwf1dGzMYMeRNd2SZI3KfS54zN63Z08nbX6E/3aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EiVvTbWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VARDB3x8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EiVvTbWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VARDB3x8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657IqHUs1377795
	for <linux-usb@vger.kernel.org>; Sun, 7 Jun 2026 21:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FB7VsGWBD03rpwArJX/noldaF7TiU950Nm2TSbfvyU=; b=EiVvTbWMNddLSWaX
	m3G9rugq0EFbtLfwWqsRQ3hFgDPCVYJysVU7USetWURk2Wuq306mU05XNloSioDW
	jcsrziM9VNVsqT8zM4nuiL99YeswMiGt/cBhD/5Ose//4pxfRa7cPiBA+2a1SyDN
	+q3U49r1JRYSaK875YDBzAylCpDWi+xrsj1jXbNdJS1i8JWKIUaNzNki86Ky4ahB
	BWtjMrua70BmHtF4shrL32VKmvGOviGHCrb+UuPkdZvshfA5ml2l0oCTfwBwuzgl
	Q+GZbCfbRiPXyolSgympyGUcISNKDocU+ul3Bdmzao2loCOm/mFaVhfiWhgxhjCF
	34NSUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4w4v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 21:33:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175aa1a54bso83214931cf.1
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 14:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868018; x=1781472818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FB7VsGWBD03rpwArJX/noldaF7TiU950Nm2TSbfvyU=;
        b=VARDB3x8ncwmkdUUpD644KB5cFc/oM46O7u75/lZ/c36Bgq52246NcB8uijk89fbbC
         BIs1yj73NMcd9DIYB5qUmIpu2yPuZzD/DpRUgRmB5lApdd2GnSO2MoDW3zOOoc94AEMQ
         0LzDoOTmUzAPoQVo/iAZiMZzY2i18GcWWTJEyjFAVKSon5UYmSLES81cCWo6j9QayDaj
         f73CTZ7e8xhowwVHuNsxVRtV/0zhta3CQ+sXNoRlfllu0Yw82jkRQSBiRjCwtDeCSM4r
         2lUf9z1ETyDIUdGbp0hcKGeTEaUaXUk6EOnuNO+YZSwoUntB0GS48dwKZkMW4OankZLf
         1u3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868018; x=1781472818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FB7VsGWBD03rpwArJX/noldaF7TiU950Nm2TSbfvyU=;
        b=Px4Q+bnnH4yD28ClcWFsTQKF8tp8HiTZMhiLGnJdsLdcpRh2iw1M181fB0XWkUunrD
         guisV9IO2iPn6ndAwIixed2DtVLns1FN33SJuYSepmAjIk1FHIxCEpoarlrb2tEhZxXD
         j9G5quwqd+QoW0GszA2RcMkhLT+PVVyXfdVeX7n5dWBKkSnQYLgthuDVavjE6wSTmXry
         Il0F0GMswAvsdofTeKuiN1hPSpUuf9IpWe/bDN/CesLkUfwfttPsg/gVKlT7lop0iC4m
         nNmQg2dYFndVd3HC3nk0TGyITPmo5al34Lu0vtJzPebCAJ9WRsX1K0UU8eYUHGi96Txb
         jBQA==
X-Forwarded-Encrypted: i=1; AFNElJ/HRteUrZiYBZRHzVU+mlquv/e5pKWY5c4UyzBa7vZle3M0wbifhScU13aGz3F2q5b1RJHiV2A/3ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKbZKISEnkob8B92FkhtG4n9fKVS9Iekgea9jP8D4reALLo7iI
	cCmqkC9gnfzvoL6VB/acA9g6GO85tVe5q7tJb2KIA/utEkshQjmD4AX6u1Bjarpqc6X+ct5v/Mz
	pqoAccWQmXfTwsATHf6h44fns7W2fY6JHK9gGVpiURS5Fe6vjOwyEt2BkwThE0bk=
X-Gm-Gg: Acq92OE2G/J2zToSX0jT7nhCdC6va77tJkk4rSQPWZ10bX9gZvqza2eFt/tEeO0xMVD
	zLrn4D4Nrvk/pbrcRBeLXpz1yPsIsHyQf3XHbQ4VFQIW0VVBXVZ09M2Z/6uu3xgP59YOuaGUEh+
	JSgXBjfsrjx5QDANk6B+23SB3SimcML8hp7nOblC9mHAYZkB8gMDpPv1B/T9DbpZfeYQUVYH0XE
	pDAK5DDokJS/YsOq/sgOUBBtlV2OLDghIu65NTVjf4Kj+uUn7TYicTRGuSsk8qtYe9CtcR0sEV+
	AbN0gBpiXVB2J5rc1JDJNYjk3hwTK526QoJNbe0w4z0CcPEdVpOkNrdPBcUAxs5/eHrD9CAt1Cg
	ICCUiOltaeENNFvPRFCR492qpZf+6Yj2qjOpsaosL2oFDVHmhZ8ZeRPp/WJf9VAWxwxu7B2QC5/
	RYPLEOdUI1rx8B6a5oCaCtGbF80+q9t1W7z5QHP6tnbAhVwg==
X-Received: by 2002:a05:622a:7d92:b0:517:b68a:8d8f with SMTP id d75a77b69052e-517b699d7d4mr24580991cf.19.1780868018447;
        Sun, 07 Jun 2026 14:33:38 -0700 (PDT)
X-Received: by 2002:a05:622a:7d92:b0:517:b68a:8d8f with SMTP id d75a77b69052e-517b699d7d4mr24580671cf.19.1780868017994;
        Sun, 07 Jun 2026 14:33:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:09 +0300
Subject: [PATCH v4 8/8] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-8-30b62b335487@oss.qualcomm.com>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
In-Reply-To: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
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
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
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
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3SjZ31inNFNocQI2RmpCu4Tw/qg0rtSCt0SZ5oE3dI8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQ0bhQoOsJj857BdAUiqH5pox278y0oAyGy
 RFMbu1dyjqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1adXB/9gLuR7QGRjAk+HXqf2b8R0PyE0WvdRPYlehmbvDdwTKUxzBuDzzuiV0kTay/bmwkqLoYP
 eSEgECp1mqSpjvxIbCTbpUNLT81GFFEDtjKOgp0EizyaOAmRWZF431B/LHJEqBNRywGDAMR6g28
 XBko5Ih990ex9CIhpqFhfLNy8a/OK0J8+WGQPmWoxwIt9PsO976mFy3iFyD5v4yPJ19GDBS9g1L
 mBGAh4TQw1r6fDBZ0z7VjlgWvcKT0EJs+3W6Mwh/6R/5YhL3raA9bpt8HLs1yUxKd/64FRiW39e
 4xRBwvcrgMfsxCVs47NwyImiptqBmFZy7rW5+/2YVxJAwuCc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Lm0ophrn9Ch_ivy0lT9Cq4Jt2B8D29U1
X-Proofpoint-GUID: Lm0ophrn9Ch_ivy0lT9Cq4Jt2B8D29U1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX/MQggGMRo6Zh
 O0MjETCiiRc/F0iOeVMOd3ovQ3fWcn9BtlPMLr7b3vTplXeeGTpCZxRdVrkVIw19im7VSmn3lFz
 exF5FANxeOSfZjzaIi4oI39ISv7FZyCtuYneA7YaPA1BUNlRuBCTyhQdGQIbHKCLkA8Xwj47/8f
 TCyo9mx1PHaHGgIEGHg0/bzNsmJn5EgYCFRz7YgDEqY0OsxQaFkAUeKZTGPjTUyELKDmg41vQKd
 rF4SpkPcfIGvZckVXPGhudGTjFqGtOxszrAZplMHjb246G6ZFGnANzCS3q2aMoUF1RFbt96YBA9
 QfPuO/CcleZBTtL/44PXrKyB5t5N//z4EscV2UwqDMsp8erHbQXSsNpi29y1o56NC2CHM1cdipA
 d5dXwigiL693sU7xlOuWWPLiF87MVpTM+ZFnQWJgxcbUvlFfOtXhH7ezYKYlA7WC022YdQW8hIh
 aDzAP0ie6gR6ITMTw3w==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a25e3b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217

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
index ca749fde49bd..5e3f887ecbd8 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -299,10 +299,13 @@ static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge)
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

