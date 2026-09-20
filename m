Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62BB3AAF6A
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916502; cv=none; b=sD3s5FuRV3yr7khM5+EIPN5910qPLwreIDukPN4P72hVCZh8RGTSo1pNW5TGO+B40PsoVQHuJcpPvb0cxirPfeHELrCcf8jddVuycXT05PT7oP30EzKCi8BK5DTX+iFSUJ0kzTIGea953iCMlUPT9WQ2ngku2EFtNUPtW3wWGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916502; c=relaxed/simple;
	bh=97+qg8LHxoBgWChDxeF1jYc+0/ONjYDkNYGaAee/3lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KB9xpgCpViuFtgEh6oAialeGVo1thqyKTDtvU3LIBqTkJnL9+8GZkc9EW7RxcDkriApccRR64tsQ0I1w+rugTFObu8En580Q2+w6NYX+G/GOcQAdlVRrMWozEwPeGJSX0R6j5hpBFuAfcJEiyGYvWZ3E0oFtvANw+5m05ZaoLX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gWyQcel5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Csv4lm7r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gWyQcel5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Csv4lm7r"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBomSG2762727
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/VCzt/+en45nD4RiQsh8P89hnWT5xVva5XvHvRUZ+c=; b=gWyQcel5PQlGIvaF
	89v0J16W2kHow0eXcQk1Ikpk1UPb6+b0NyHDf73otBPE+HUejqvOV+/3rwcR+rSH
	U5tTdN0hyaMHO/toVhiJrQEwBx+XVWbhEdSdMFnrj2S7rZvfUiV3K34pTvOPkrVG
	5nBkaHu1g/PB7Psd/W5cXRb4uyvhcGZpEga5gmyBYNx5Sed3VcBk6L8s++B6t5Cd
	85Slr/CIGVr8XBZFhia0Aloy0DIF4rnnb+VN/6v70Ew/vV8ZvvP0ac/wL9F3pxTp
	Erf/PklqnDeZRWMiIPbxMQklb19aIVIxaiYql6XDrTCx4B6axyeKlqse+lhaYhR9
	DJO26g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd63b2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:01:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5328dae1305so72605501cf.0
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916498; x=1790521298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/VCzt/+en45nD4RiQsh8P89hnWT5xVva5XvHvRUZ+c=;
        b=Csv4lm7rqvhw3ubxRT7bNPeqHClUbXZ4AwoaZ67EJ/4alnpkerdDsyENL5BHqGw+cV
         NMiVxvyRiz8o0u6jy2/PREL+e9UXSaBSQa7ptscGmtnc7UYrouDuzVmmPmPM+GYGY2oa
         Fkqmm1g6hjYQlYRUuFSiR8s+AUB7U3E1K3If0EYD8vXw0QVWZGAOVo/08+FE+Ft71WwA
         5G7a8c1rg/QblwZ0C4HNwRZHYUjTo0olwbqHYZEY8C9Jl9hM4FuU2YBBwxINot3OH5Zh
         64uhtTzKwwhm6A9KlSkR14FTzaTlYH73Boh5vASuTRFqkNrdcF42n21/U05R0ifQKNEE
         aPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916498; x=1790521298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/VCzt/+en45nD4RiQsh8P89hnWT5xVva5XvHvRUZ+c=;
        b=FPkFN1KXxAd2QijKaJkzOZp4G7/V9fW9+XuVUmbuY1J8ATnr30komJyMXyDlcR9tA3
         zhLfosh6Et8/8jGoqDC6lHjZrXQFAjGa+0iORpRIyIhDuWs8wDKmIgw3jN7m0Dk9/eMg
         Y/VRBfpKmg84H3z9HMjy0vcAGP7oAiOWx5zH6UARt51ZO76OLPmwoXwrElj8pD16G2/s
         /EVOaSrNtN+ps1TWgnXrBFyWndxjDkrLw7c6Ffvb2ibaCTlGQDgLxKszHiqYHKFtj8kz
         QtDc89O+wQjd5he6OGYcQb7d2nf+z+ggWqXaxBfuj5/frxu8u3PGBaaFr4TjgajerwAh
         tCCw==
X-Forwarded-Encrypted: i=1; AKwUvBz0WNxBj1r1AT2SxdMDa2Dnmw5NvfBrZXt7h2r1AOBQSHrC/hsXQ0n3WAjOkCWgW1bP+9EAGnBKvqc=@vger.kernel.org
X-Gm-Message-State: AFuF++k8jBBgD3QMx4D48oWZ3CY7eOBI7NJO2eBeNchUOeejfvFOqj6j
	F0pcgWXetaYUweZvem/qeb/et4BcxgCVmWSX/asRLwURlvxmCU/Scn+2Ncopn4uqBHbbQciEGXy
	TKwRtYcCigTMAPnl36JFmjWejwkmBN4f+cb9dlq85Lrqg5hXYG445P03pJ/Jg7nw=
X-Gm-Gg: AYBFou1s3HaN7tFJuthtbym1pd1mi8Gj7xDW/qWVAuJoIY61XqcyeBMcodhi9g6AaGy
	HKPuhkMS4PcpkE3SFMviiEyB18Q3Ri+GLTgNepO4qnhtv2GcNrclC5yN/10mpVPdcMkLQLsfY5Z
	doDGsXcpV7Nt7MNxA6R89gNvzb3OZQCcZ6U5CzbOCQTMxsoyADj4bByiMjp9SRqPYNQtdsemTx9
	WvQGjSthNhqNDUAzpsSSbt+bZX4UXygpTJfhLr7skztHclW1kw1wJTUMa/oJXF3n3SxQx+6FK3o
	XT7CtkO7OvHwk1yw31oqh74v0pTlNxF04bHOQjyQDlk/Hwf1Y5wNA+W+mnjIjzYgJDbEYnZsoaF
	s3y04vuc6OTv9dJpu1Qd2t/x+h7bHFE/MdJYgxQycYy8RBBvoK7NzrTmTgeI1PNru0CEUy7HsF1
	adM78uMo0enJbI
X-Received: by 2002:a05:622a:cc:b0:530:d1d6:792d with SMTP id d75a77b69052e-532b71fbcbamr62544881cf.15.1789916497780;
        Sun, 20 Sep 2026 08:01:37 -0700 (PDT)
X-Received: by 2002:a05:622a:cc:b0:530:d1d6:792d with SMTP id d75a77b69052e-532b71fbcbamr62544181cf.15.1789916497205;
        Sun, 20 Sep 2026 08:01:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:27 +0300
Subject: [PATCH v5 2/8] drm/connector: pass down IRQ_HPD to the drivers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-2-ff1de0090c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5324;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=97+qg8LHxoBgWChDxeF1jYc+0/ONjYDkNYGaAee/3lk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VHQAEbomyPgJF1i4+z0xHxN/ABd0NoA/dTW
 k3gDKnMyFWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1fO3CACx3dvdjG5tUF5UKYmmZ3WVKr4NAbrSZvIxkHvDE9/UakP/s3iNZdimLdvdIJmyErbvKAc
 S1zzrVX1hO69AUkpbXVIMN3d/sEEz5VB2QrnashFbT+beRo23VpkXG5VqybBKszC8RLy3gqDW6I
 CEvj5tEOZoICbtxS2dkMl3QqN1BcQbFmflrOwuxr8iygJH+izfFEgK6YmP/X4ZwfCAP3ElB8brx
 l8DTFq8cR0O0ZoQ6f7ZvfJpWTvHQmyh3DPIBjN2QBDGJRLKebNuT0Tu5qO2D75RK9Xtr2aYHXV4
 zQ/+vgcDu31BgxRbPGWxvuc4+l+OUlusdfRuL7TSjKIyn1Qs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX5KCYlKPocX/z
 rNDBfY3Yn4aNf5PfgwBU73w6gNwo3P5b2/rCoH95K5Nyw1tv+QhwQdIT4fZFDgVk+jKuOgFcCMI
 6wvis7trqiQp0nZuf72IX24z9qx8uRUkjpKHWBD/itl9BXa4LqKkp9SBZ5AmnbwkovQn+IS3ZV9
 eTIDgaOBbX+yQs7qd2LI28TMBbq3Hs5YvOU2c+/3X+HmkflLKvuiDj6mLPtCvX8f5pkNW32Y/OV
 j0jZq9ohuQXyBVNnCvNjEDOFVp/cHS1rn8azMjw0oAK7DScuXFPdIKxu4TjP8Yrs26JJj0txa2P
 SXOw4YYoDF2ilZrxwhXVxqfKEtauG2GolPnNUajf4O2XxF/BdICfycjP8b8KScbsyjS38qNlDDD
 MgPBvoot7Q4RrP5XzAHsTkPBvqhFksWeNsvhKallv2Uki+WWfBr8i5iq7ZkLpE7ogAtjmJZmeMk
 Nr86jFHlq+MmkWEzM5g==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aaff552 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Uld_eVi5zExU9UbbJsYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: IcZHno9st1omQoYTLfZ0wV2SB73CfscN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX0XR0tVwmUucA
 M2LZEnJcvaeKKLe6gE9ZHvg/Wvxsx1GgT8X/gW8Ffy/x49/S9eNdJHpn9IhbsIvXiFYLmzTrU92
 P7q3vtN6tHmpH5SCFWMkmy0sM2Eo7jI=
X-Proofpoint-GUID: IcZHno9st1omQoYTLfZ0wV2SB73CfscN
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
the Sink side.

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 00feb73e63d7..a51567d19550 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -154,7 +155,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -163,7 +165,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, event);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -171,16 +173,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 static void drm_bridge_connector_hpd_cb(void *cb_data,
 					enum drm_connector_status status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, event);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -223,7 +226,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 5d4945ea1e95..f0facccb7859 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3698,7 +3698,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, event);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 50ed615cf0f6..a2acff240b45 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6800,7 +6800,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_dp_event event)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 906aaefca7e1..c3374cd2598e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1884,7 +1884,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_dp_event event);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3

