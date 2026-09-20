Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB31323ABBE
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916564; cv=none; b=qm1d08WE6uMiQX5MqLGSMgw6mepEe7oe5GczBEeXQlugpMFyYKmrWmYNaNibe7g9SlFO4EnAsuI2SCYgK6sY+yMYeflU0Srs9pTIWH0epESKc9JxfkP1nNzbCG3J6o9w7ceB9h81cSMN1jGDfhCXbKO3fT9b2YeKqrF4krxOtp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916564; c=relaxed/simple;
	bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQ61qDoaHYP1/ZUbzK+Tvk5EjYDoWWwu3N9EfOBThYEs1p1tcH6NirO4uFx+cYjd/Jz/I7JJKcF02NvLDY35+Tq1rUKwML30+p7GKjYvOUuZ9fH15G7gAY+WhZIuzkMAGGbppkl5sOVgSihRsxY9BrZ58zL6dmwBw1ce3PFL8Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyhU/NIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UF11s+UV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyhU/NIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UF11s+UV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoDp43272158
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=LyhU/NIf6khqaz3X
	f2oMgJDFkUIx2VNz5QCZqmwTUJMGy1g2VGuy+Wa7qDxFAGlsE9RXPhiwx5BReQQj
	J8IcQf1B6LrThNm6c1DYOZCJZDP+hh5/P62LijFAbhdFvjHu27egGlxk/nf2Kyb6
	7NC0pAG1EDnjKuuY9+GxG+jDsCehoXoRSk4GGTDvCVjpMeJWckVMgxSHL0ZNj9nJ
	zmsoWAl3OS4X7vNRxGLbkmYVC5JcA4rpMJmhe0sdCQxhppVjQifaeLr78HIjAHXY
	y6zfaK08WIFaGiWEK8VCCsLoJzvHn0fOu2jsFZ22Qg+icvuZkh63AH5r5DvNlYhs
	AdYkuQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsbc9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:02:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78830f4bebaso579001137.0
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916561; x=1790521361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=UF11s+UVtfJELg9HLpeQDaqrOUEnBu3KXvmrgO9n0NxptYu5km7rRnK1iuOhrvNvGJ
         /UMBS9jYYI3ib9I8jrSJEGj577c4uRocYWrfRGxbgDJ0b05tzkkXdFm7DuzvhkmvKNYn
         7x5T4js88J9y56fgYX0dbTGxf4wG/7NiUW87pr1JGtjVGQwFGRn8d4fMKPFst5P3QUEO
         Vp7J+zR7IUFUfPFSbd4uR9sXD5j6/vaxP5GcTU7QGY3dDIXQ4A0HQTxJ1b9VKRMk+9Pr
         9G0t8Lsl9d0LV9ls74PJjC7zWy8FWc9OC+EjBY3usEaBgOY8UxGt5ScrY9GUiegHkY0s
         g1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916561; x=1790521361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=ka+fkfLuxr9fkqKb7gVzIgBYtQ5+izaup8IvvqkDJsFfzSRQpTya11JSrbQU2dLMdH
         m9WptKVbUUnvrldLtGet2rDMwjhM4W2IOkAUn3LARqZIup9j12O/QRE8XJVbD5JWNn9V
         cSukmKc8yFde2vUZuvCya1RFJhTFnYgQj4mIvdhu2SDML/y8FHVHN7VbY2fW6AHGMTlk
         eClJJDd6nWyUyqoqqngAaj5dgnjuJI20JXIdpRmL5y2y8wZg2CQu6wu+x+dVyc29g7Sw
         OzQLiaVE/u4LU6PuLMJAxGHZlwSLgH6cxEcbFIdwBpbSJpZSDRV/aSvyX8DYVqx+KGuS
         44vg==
X-Forwarded-Encrypted: i=1; AKwUvBzWfhg1BWSjsu2tUFCTO2+ehFeDavT+FFP1+jtCx9KLobO9CmnJiCYz9zsOjUGrH+4+Pa3wyw15wDo=@vger.kernel.org
X-Gm-Message-State: AFuF++kr/tza+zujDqAD9m2zvCpGu0qcfiCKo6KGgn65Xfu8bmzmdokR
	/8VTNcxqLnhWyZ17u3BkYIZdndK6l0GyGKJ5mrjre+PT7f74G9DNPJSvc75n7UFiFrIZuKq03mm
	JCcJy0sOoM/l/1x8QqgtqcueO8SJfH7BVFknYDuPf+haRS73rUvb9aVyld9O0Q58=
X-Gm-Gg: AYBFou3F/OTfwbSPpKqc2a+f4r7C+FULsksAb6h0UBvvmcfhuJ9DGWMfcRT/PQkuCOo
	Z6K4Jni0787dDXT66UvGB8dx2nIQTy0zSnDy/xW6XcTeRwTglUo2fit3dogLNoRxR86Yx+uJjPN
	gGljgJXvOod0tSytsMVGU9yUnj0eU1YtPUgGyJ9T/MCptKkqsLe4lBQfkErTKc4PF6Mx2SxbAeL
	qJX1qX2meTEpUB2hRrj9MxJSO2jWforZQszHGJX79pb5gz0inozrFbQqozcqPy6I67ZPyPV1TkR
	q+UcsWGvv41WTuCxgRx05cfBg0X15JQV1XEzBHFCiAoRxZQ8zJdnM6XivAAqmcSKd1wNUs3469k
	wxu3k3AYWWgIAaqTjHzmGLnfOi0IclounHENmBkDtTjPhqhbsoygLf3tBDuX0O2AnZS2TiqQDa6
	naw2NPGh3BKVbG
X-Received: by 2002:a05:6102:370c:b0:7a1:f7d2:e80c with SMTP id ada2fe7eead31-7a55ca8a2ffmr2385192137.20.1789916540551;
        Sun, 20 Sep 2026 08:02:20 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:7a1:f7d2:e80c with SMTP id ada2fe7eead31-7a55ca8a2ffmr2383773137.20.1789916512407;
        Sun, 20 Sep 2026 08:01:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:33 +0300
Subject: [PATCH v5 8/8] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-8-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
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
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VInUmy8zA1nzNuEwUoOY5JpzmI+vHj6DFGd
 p2t16GjXiyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1SAAKCRCLPIo+Aiko
 1cByB/9kaXaz9ejico38hBPR/nrKnSJ2+GBGrC2HgOUCqVJYVBl+wD1iTcC0lJ1lI1rVVoFb7hl
 On3AdOhJDRB7INjnKzoO/CrkukNQF5hbG/cma2VXE4Wvc3IvWqmYsU2XXYzqzvF/P+iJeVE0Jf0
 EQp/vND7wTm9P84MwrqonVtf5jamrmZc3eVaT3GaV1v2rAkWRDCqWJlnB+G8FmTWc+B+ZxGGfhI
 v3WNe1aScNk+JZC43arleaguKrx55HU4VILKhUhERhcbTnG5cu20D9ZweEcwC/CL1hIBHoF3LdK
 iFd6uyPvdlFK5oHvM8QmmRcWseuO/xY+v5QAxeh6NfTfCBtw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 24rf0p2rGTd29K-F8MguFGCCq6LPrGTw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX3NtTt5T94Uda
 2/j/VvFXPn2a8/St5wv/5+Po0/xt9AcBV4rKGIytY//7umdt14UMkfb92CvLtNLCX0WzgHAXtCW
 nhYRb9WQG9ZmfcZdQDP+xKjmgb541fDIHSrpPrEKCDTa0XBCpLbalriazqXBVKYXA2oVskSgU6I
 bDHQPgu5um0Y+/ZBXKIsc5vQ1dOkkZ2GZebpMyBLXsKEEVYGvWM3rO5ZCcLk+35e58bpIn2wVdS
 TakcNpO0SPIk6S4/Zl8zU1D96txAnnpf7iJwJcMTLnBBlA+EoeANXAWAGEbFLp+hgMNfyThy5LC
 zao1IRetKh51JwENLDEBri6+VBrJnRIM82Dpeg2w1013QXZkg2oivCHZzmNWkkTcOxT+YZUmymm
 G5L0konIlMnPGjFThfhZLOM1TWA53217vHblrR9hU8Oa3lzsTY/R88op7BewEdUhkcrxLWO/RW6
 x5EmA30/MGGEOk0oOBw==
X-Proofpoint-ORIG-GUID: 24rf0p2rGTd29K-F8MguFGCCq6LPrGTw
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aaff591 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX26px0a6Ti1j7
 HECTiBFRkx58J4Bt4W2HuvtEV7eCIQVZ/ErqpCKsvDGa0ZO2BQLlLccjNj49T4KK+cEpUPI0vNC
 RNyDVTKmCqzjHMDdy3tKje12K0SJGhA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219

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

