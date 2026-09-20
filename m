Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8CE23ABBE
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916511; cv=none; b=KDfbzDrhl4gL9oR1X8fhLWhGK6bWytb2W5zXD5/HejTlfPlQ/S0O7G5JbANTeQwfCF6MJeC9prAwXnJZaxXUxjTQnEOAyYFpiL3ncIX/rW6n6yVbiPNrEnD9+LAJ5G3aH0z4xqjZdAu58FAiCor7nxNNe2lAye73SLf38WDhJeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916511; c=relaxed/simple;
	bh=IHP/CEHKbEjbTAclh8cTAdfCEyItA+qP7FeirdUUoOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/grn0WaXACSKCA0iWvRan2h3ZVEld0Lt2LV34mbyn/xhPlCY5pn8UlZEETupSkMDKy45eI93WNuYZjYobULiDoYtxBLEer8yNUFikQxYeZyzp/hIlTQia2X3NO+4m26PhmT+D93433+HH5BZbyKyI7wp2YjV3TpHgDI0zRrDM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXC/ueKz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDFiqNkt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXC/ueKz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDFiqNkt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo1UY2761263
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=; b=DXC/ueKzIq/kzAF9
	rFYqtVTFD/hrOYA2YzaXtLkcnUoXM2sFtzvQtwmd/9/ZSZ6Y/3CFQ8sg9RUnOeiZ
	RFVYdj9zMPsAnhI8p9o0mGPf/Wjr70Pl3ScG0L/EVdMNh78/beTatZcT9xf7ZxHd
	yD4hZW/OZLFu8g4dTZs5GmNjUuiDIqK+mWMecon6ao0P+rvaBAPtwiXz0wzLzBsU
	EthYaBSLNRtrODbJ8MFm/30Yo8KRbDC+8YVsY6Yr1m8vDa1DCBDIAx+ZhiYd9mwY
	rN3XRbVxjKOVnk8EYpA0uXNwGP3mMuf+mfD9AGoK5uhIrsAwuuf5AHCBxIbAp0Hv
	R5evsg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd63b4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:01:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so68173371cf.1
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916507; x=1790521307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=;
        b=RDFiqNkta/zTYZtlwTJwe1lhPgFCE9QGprC+fFiEPrgD7wgmBTpAVaMTaOAXf7Z4SP
         3evIQD7PvBNynOQmBOTR974I3UCwlQ96MYM9Z2btO9M5TA7Kcf3fPCIFGp7h/G1FPGwy
         H2VMgJxKzmM9CBeeH5qcbRt2URh27BpJ8uVWeoVLTh+9VKeeaXffPWMzQ7Vg3Fk13i/W
         ZvqGTfIznijfL79odua2xOjBSU44BulKKN8zxnwoovjcc1oSofV/HpC/CYXhwkPAhOg0
         dbJuGd3hthU/Es8D2izX5EDv419EcNE0Iyr59VQuZcO+SCfS87xF1J04VFv9xco2p928
         p8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916507; x=1790521307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=;
        b=W7U0UHgoEPu5zIOB2FjdW81bQKVnPSn3GIs/4kXSbTYWUmJsJGV0JMbQW3ux+GqChS
         /jUinyhn4qNFk2NlrOz7eJCzcbUEW8wW1iued3d83sLlvlcssnOcUyZesbSJwEfJYgnt
         D5IbnrTi11BzIVx8CKzeurcEnbZnDGN57vPCvgweH8lZ9M8MNCEyzmdSXBAc1LQ+iV3+
         /PCbAt4OgDDw5/4pOSdXtjbYqnQJJ/lldfHjQQFc3Jeeb8wLM9hw5oif6WpdcjnEgJ0e
         Ol2djPK9G/fqGRIcOOwa5fpwPsKMC0i99yO3AWIQt13P2RdYBtN5qL5xpPSh6B96aqXR
         Z/fQ==
X-Forwarded-Encrypted: i=1; AKwUvByMX4OxWDFHUKNEMyrroM3Mk4KL1cOOJpaKQt2ieL14/oXGhMMzAZcVWQA0F1Km6ur+BbcNegBjAZs=@vger.kernel.org
X-Gm-Message-State: AFuF++llHXKjI6Z3a76C9JOpX6QwOr724e14OBwbGmDqVPwcSoSnVZ9U
	KLNT5RcMLGSKDpe64mDIeEzNeTSMnDyt8aElxP/nkQJb+7VEd/ufNY3hayG2IKakzS66eVuuwRp
	MFfKobi1GSy6CH/4IIp0aBFJiCtSVnACG7QY1EcQjxHePjmxa1w/8HzsJuRf62y4=
X-Gm-Gg: AYBFou1kgv55mwsOgm2Nv9qfMgDFuu4OpZTQUT13Rnb9KRP4II18b1dBZAsCa4cSsYF
	LNpHzmCLHR23sxGSegcxiqizKNsoww/gdb2d9XDnYPW+t4lcF0ZpqVGdRNg42gFD1O3Bz7nYdPA
	PiWGC5q8oCde2yrPELec1m1gFGsg/W0nGELKrHWh91+XpnnwQPNj/sGr17pNRJE1SDj4rFPdGZM
	A/c5NklLihOX0eoFRVevN7x+J+wxGXuGtEfaME8WjC+bnRKVL3nFN+NINaEOzqiXOpUib7DQ+Ud
	Aa3U+cNjuynhCSl/Z1YE7caDIlfLSz5MsaHvyu0Kn7LZD/73IIBJsIbYPRQ37Qyp1UQkoiHLx5J
	5W0cwMrFFvvPzAQbDkDnjjE4qkor+oxOim1Qxd5HF923xcQ+F5IssMgvBYXVMbEHqpI40lelLDU
	mT4Dc/Ly9ZDqgL
X-Received: by 2002:ac8:5756:0:b0:531:10c:a525 with SMTP id d75a77b69052e-532b6f9c339mr59088511cf.0.1789916507207;
        Sun, 20 Sep 2026 08:01:47 -0700 (PDT)
X-Received: by 2002:ac8:5756:0:b0:531:10c:a525 with SMTP id d75a77b69052e-532b6f9c339mr59087721cf.0.1789916506618;
        Sun, 20 Sep 2026 08:01:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:31 +0300
Subject: [PATCH v5 6/8] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-6-ff1de0090c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IHP/CEHKbEjbTAclh8cTAdfCEyItA+qP7FeirdUUoOg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VITghi4UzzRoE/FzgfbEnUTmORHJmboGa52
 XVMK6F5wo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1SAAKCRCLPIo+Aiko
 1Sv7B/0YL5DFJ/q87OBtIjQCInHBNjJWVturTDYh0TaYHFvNJxrU6AlpJU7OUMxKsZfCeqyUQTp
 CLdTznZPfsk0pHv4sgAH3ivr8voWJgY0gF9WW1EDhy+P4p+MTBHcM6fSGNNsIxaGRc7ZDzEWqYJ
 ZrusLtSE1bZYR78wlMziU9RHUX5W7lZPN+sZ/zgMF3FdhkI5Rg4LVp8wHKA3aQLQ4QWGBQ9y2yu
 PfH+vAfW7MsNUXcAVZ0L3QCDqaZCQ5D86IfEyPSfSumHYKRgKikqjEy9a27zrbpMhb99EoIaIMA
 533IC393BTUb0jdbU8nuR0DF7Xsw2gXSG4kvX3t3JpEU/nx/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX+1b5L2LMdYOM
 Jdk3BVQtaKsz2r+yidvJUpxKfykFT+T17S8vE1kaYy2rB21I0fyvYlJ9fi26E8ZY4xqd/nL8KCD
 vW1VN6N12WTMBpn7pVJdq24+TDP1XyHw/oU416AzeNAg9V9lfGtFrSJ/akYJBJpuCcucXDsr2l+
 674VOdFzCZoST15aTs1vSh8/6FGLOk5MGF3m81t+ikmQtA2jlxIubXYpc0rzqsRtjvQ9B+6iKv6
 hx68460KDjlTx6SjhH9WPMCs/1A1SopMhMjS5KDz9LPw6EPL9j9uBYL+BtZ5pzwOwXdmmffTqJj
 y0L/12Z87oA03O5d7QuLeDZgtNSUKgBgdEZNIuGPjWEoxh2IzeeVJbN3dr5hx/rELIIUgHhgw8J
 xy8Mj++81e2o3rKIu+UbpvcqvyVhpgVzBLrE0BO3K91btTex5gQfy3TueTVmZjNfYwrXVnVkURt
 nGKBbVbVQX3QjP5+EOg==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aaff55b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=kFJzCQJ8v3RGWcIHJrMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: eHZlc3SqL7M1zC3Bovt4enAad80lS8wB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX/ZMm8c/UboLo
 hDFsN/cN0nr2vfL5NLNDaebSIZ1VjUgcCwytMaEKZsFMhQ532hfs9qaqiHUfPhVlWNXU986pdyW
 Bqnj+aGWaZEXV1ydZHVSQwihrVbyzq0=
X-Proofpoint-GUID: eHZlc3SqL7M1zC3Bovt4enAad80lS8wB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9308e373447c..a420e3d49928 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1559,11 +1559,12 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		   msm_dp_display->connector_type, hpd_link_status, status);
 
 	if (status == connector_status_connected) {
-		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
+		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}

-- 
2.47.3

