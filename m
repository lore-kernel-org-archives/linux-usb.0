Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791751F7575
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 21:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780867999; cv=none; b=PNQDP65wE8AdJn4PZFvnlLF6/aZ5EOdFgEAdsNSojy66V9wWLmEjsmgZFAU7QEK1JPwOBIKy4xVyKrAOW/16nKzb1Eb6JuLVbpATQsvzSd1acwC2fv7bp97rPEX/NN+vJB6CK9rWVJ4qZoLwvjsAYUmnt84JAMIWbXPqsYaJJbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780867999; c=relaxed/simple;
	bh=A2PPAf8RIZIumN5Va/to+GsP1RDHctHNlwnN5DWn79k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bYSEo9kQhzW6w8STswIcslG6JZd94NN9qhDDSOcQzhYIWo1Fjpl7pyaYx1deDG25MDHFSEAKY7t5X5eOQ4MYgNM4cw4/+a2fHrnedmOxZkgZomrV6VGDKWZr0QmCG28n7nTJSb2Ido8o+yuLYroWQElRo03xXSeF+zi1WrMjrOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgf/vqiQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7AM3d4n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgf/vqiQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7AM3d4n"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Ekfpb337074
	for <linux-usb@vger.kernel.org>; Sun, 7 Jun 2026 21:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SCoT97Q5hVm4j6zlVv2MwuqAb+a0wwmxj8TjVN/oHI8=; b=lgf/vqiQvwidXX+J
	H3u0Hg+bm/YbqD90L3k8SZI/n3ibPQNlDNkNDvBLEr64+i6fWp/V5U5XpRMpQR2F
	odM24vycGfIYPw3s60L2/A+/3QKHA6fxU9wgzMQfRsitxyYxItsY2UySoJr2DnPU
	03QHC9EGoT8XIVoRj+k+Pg3hPud+QIt/ZW02lwQ1AAGV1uJLosZiP6kWv2qoaeCh
	De5+wRgj7FIMkfONdSCG6cls9Bsftkis27VLuwXgZ4gqr8+rI2CwFz+UzeSTkLGR
	DHHlFLjopbK8nfjbWPgBBvJKRiGuSEkT7lePsMNWxQIuoIv7E40uRIoTHGccEJCT
	P/HFdA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgvhbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 21:33:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517878a92c5so85634171cf.3
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 14:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867997; x=1781472797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCoT97Q5hVm4j6zlVv2MwuqAb+a0wwmxj8TjVN/oHI8=;
        b=a7AM3d4nXtYZkPAkydlOXQ6hAPDuh7o60IaaD4sWM+rTtzqyJJSQPMV/R+Ls2e0uLb
         Z3XM9WJyHmecfQyfZkwvsTEZfkasjqVS5tBwiiAjMEc0df5wCmsamV+cnknjWLPigqPN
         gkAfLr4HbqeqoJF5QeVAHjh1DiFxA+MGXgvAJWMRfmiesO4M/AhhtcAu4mndRo69r39a
         Q/+/qmfFEw+kxZRIMrQm+otXXbHitcwMxP1SblCRy5RNeEGI4PAxedy+MQiWJ3R7Pfnd
         0Q2/UaEfJnYw1dMp9lKTHKLljqWwOKssy3zMtjc/1s24lkVnfSexqbmdKF8pD4VBB5zy
         7iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867997; x=1781472797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SCoT97Q5hVm4j6zlVv2MwuqAb+a0wwmxj8TjVN/oHI8=;
        b=kG5QbJf/IO6b34CbEh7JcHPqXp3BTooKvLyB7XEc0GvBxvYTmBazKUenAKl8uMvREy
         9oziE2i/ZI9yLpCujCchspkKE0bZzqZ2dHwv0ANUwTRKdhGY7zGYa+ZvMwYExgDQF2P9
         765/BV1RJT5630MH9AnPCtoJpeYrHq/C46SEFsuI20wkuo7LxO63qQLjJ3UpAw/Q0N1R
         Qj9bD9tGofPbbcUDEx5yhE0dVKxe1haSeWANUHLny3ydXzOm5/bHHjMIoIeGZYVBm/ab
         QYst/C1h2JtWN+k2Ktksc4mAT64ioPqUe4LeCCQ05xcSGIbwEaKRj1yST52bm7+v8D1H
         Du0g==
X-Forwarded-Encrypted: i=1; AFNElJ+YrvMQ9jiJP/Rb3UXAMIONZwxk05BrQ8LWIW0sqhM5Uqy+Daskn1iU+QOHv8TB+VCmnVRGN7CD0Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9k1h7JeF+FSOdrVDoVR5pMbFCNwzo87BCWrMfx2Hbtx4qR4Fv
	NKOYC0gafH50MbLn4shRCLYgHD+3bRZkjV/kIjclcjqLU+nPMuGvrJHTTyGKB/WkBA22t1w+vP3
	eS3Z8W/aeLt3YnAQKM1HkYNhwELDDDmpfpGWSgLmHB/6WN9s7MkOlwScyug6sz7M=
X-Gm-Gg: Acq92OGLxcEkLyuvv1JQ+sEhB39e5/vM+zUpEq00IAs7e7MqgWqu0Tn1XEbdfG/v8cU
	83FOlymzUDHXz3k/osYjMHFB6X8aAxm0jBj5YAWGAmN5OvZexeChPz4loY2yjZWFBb3dYEXt1Ov
	LICLy47CVrVZmhzTu1jMP3X3YjgE/5PzSuAfESqDf/SDTTu6wuiN6j5i1n/U+wAvf8/bQzeJnxU
	KSAiYDZBOL6jdTB2PO+WX0z/fy8uu1t3ZBEpvHzIcae6n08dXJI40wur0NyVUCWlCyUgHcnJpej
	JkXozw6TGzxX0gAXA88SoiLgW3DkXvC+9I6MRlei/c2FjTVIl+yaTJ3jgjcCSLc8NW/VJ9WXXFd
	KXEDAcgGWeVUb6u8W8MHDwFjzzPZVThecwD+dqaPtA+roJzbtKzW27QmP3/2gekuE9XlKOOrmPN
	PsjT3Hedxlz3HlClhnm1A0mfAdlvOtwxt6ypIYYFS3ab8Lsw==
X-Received: by 2002:ac8:6109:0:b0:517:8a19:a461 with SMTP id d75a77b69052e-51795c56d21mr173338731cf.42.1780867996769;
        Sun, 07 Jun 2026 14:33:16 -0700 (PDT)
X-Received: by 2002:ac8:6109:0:b0:517:8a19:a461 with SMTP id d75a77b69052e-51795c56d21mr173338131cf.42.1780867996264;
        Sun, 07 Jun 2026 14:33:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:03 +0300
Subject: [PATCH v4 2/8] drm/connector: pass down IRQ_HPD to the drivers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-2-30b62b335487@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A2PPAf8RIZIumN5Va/to+GsP1RDHctHNlwnN5DWn79k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOPllDTwWwMp1vESqk1j4UB0AHP5j7B5bL5X
 uq2IPLISouJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjjwAKCRCLPIo+Aiko
 1VlqB/sGaQ+sksjZm1e69F9eT9jxsXnLzH5/YZqYUPV74YSWdt5FApSzNf7tmIphhpE0fUE4LWH
 YozHAGahdOxwneinArqneGoOTQvp1aS5h+di+zQZRzeWHqayX0N7EXOGpaohwBQ4lC+hoBv/c8U
 YLVwGvblsq7oFWaEfoE8yeFhSDBDDkIGhIPAeyPRq5ZThVvChLMwD6AbWU6i+EtF/dr6t42Lvhz
 mHngSlPxsh/S1AoVsH3HstphanM+aA+WlDkXPZdW7t2CKF4cAZX7QfbWK3QPNP/frLMhRl0ND6W
 xAWtiViB82XxNOvQFNCDI+lH9MaGzXCY3tiEVgH4V2bJFjLa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25e39d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Uld_eVi5zExU9UbbJsYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: pGMtkmXemap-hNLpRsropS5WSpQm4Vuh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX8N/BSGWhjv5K
 DbnBdaTc7hjEGF+vagMp/KTHFR7jfB3O461IAUvRRutF5Yr2H1keiGsfvkQTo6jj0PvbVoa9ksS
 QJJnZ2YhClkV2Hw+MCGs6MmFgcHsq6X7VBrAPaARqd3auWF6RJJIkkbdzB8qyWm+MaOP+UXu5x+
 EwXQ34pmOhKSAf1MvBYuSuNt3GCPTjYxgYqOznEenSmymsel4Sm+qm7RYCS4kKAl1S8HsuUC2YA
 1fHX89gdU9LyqbAaaFEsQqDNeGzqmapRPQzR9WkAqrKbhyUVLttEU3QW7ovB0NOd8LiVevYCEh0
 z4GoStPUApmornbZyJ/+lBh1J+X/hpQkAU4hlg5271fiCvjlNxNA7xILJu3DJg1xrRXWRu/BJ40
 hERgWesM83javH0cnF9k73wBc3qotEWTivZcztyWa1uvrtVc+APk/h0LZe6AAqzwLnH611vJV32
 6euWIEgyd+vd8cD4T9w==
X-Proofpoint-ORIG-GUID: pGMtkmXemap-hNLpRsropS5WSpQm4Vuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 649969fca141..046efd913064 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_status_extra extra_status)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -154,7 +155,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_status_extra extra_status)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -163,7 +165,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, extra_status);
 
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
+						   enum drm_connector_status_extra extra_status)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, extra_status);
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
index bb128dd0263a..d99019fdea9c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3528,7 +3528,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, extra_status);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 85d3aa3b9894..31acb3129723 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6990,7 +6990,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_status_extra extra_status)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 105da7c94910..5784bb9c4021 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1720,7 +1720,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_status_extra extra_status);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3

