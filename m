Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41502ED872
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 21:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868004; cv=none; b=tGR80WaO+SQ4935LS8pEbEkWip1aDunHpZDXfOqLlo9BhV3ai9dDXqTYDfMvylJQn3Q+t+P6h+7Vk+sOcYsNEp07I2wBoXme5Zl4icgVe/WW4kNm+5YhDUfQs892NGjlohCQA8VqZEgSmubBRfAhcNEM6LreJ1GTGcpL44ONUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868004; c=relaxed/simple;
	bh=rdu6Lwit2C5KKaZ0v/12eMby0f1nLoCKXdHmYUOIy4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C3movSV5/GN9HuAwJ6CJWyieZ/7Y4tCP+QJlbq4d9ZurNsEN7SGlT0vfrBuvC2BDe77Bi7kPt4dVJeMra1DFQfbSgWqDsdfEH5rvu8UcjTQoJ3k2vFm4iZQ0ojsn97h76P/eYlZhYeOQsyKcDJFApg/j4I8tGOs8owVu3AijZoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngD8UMRR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbHDv9bv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngD8UMRR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbHDv9bv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El8EK866306
	for <linux-usb@vger.kernel.org>; Sun, 7 Jun 2026 21:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nXKFoSv+OD8UufALvZn1QYM34hChzmAMz1kYVtXJuCs=; b=ngD8UMRRkCVGGPXg
	fDoNGLDne2G4UuEFKonFSx0S0RwdRzAru+C7w6MEU7k/2OAsBmYgEhJ4x+R0qQbZ
	L2qSTlNJ6APTR6FLdwyAJ3tv/FTIGvm8kU9rY7djgBDw15dFuemzomhxKdpWojTP
	NaB337ghqIJozX29QuKHVtKhQqNLyrokSGQ5vE+zhAJI7N3oE7b9CM3wh6yVU1G1
	vk/OHKxhODvOt+r2AiWgd6htZAPilaoag0Ma/JH8xhNRCCIiRtvi4NqQREpKDMw9
	/qMjeOKjwfGpstW6QDVPpis/XwbOOD1OhUqxD8sbTdei0Ei4COfjwVsXoYPIexRF
	B6tBMQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w4w0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 21:33:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178fc89b1bso44816411cf.1
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 14:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868001; x=1781472801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXKFoSv+OD8UufALvZn1QYM34hChzmAMz1kYVtXJuCs=;
        b=jbHDv9bvaZ3vD7nBRD5PyAIAgZJkea5hfZp1XgiC1ZS/73eaQ3KnW/8w8Bkzi0zz4I
         4isIMuwAtA8aVDbEe889h0UXp0O+dZbWJVd177M0nbvVNQbHM29DO0BhFTlWpCSjTf+G
         RuWO41KcHdy7J8PrHLH18fTjRaVuIa7ulhW3kg2A5G2a+YRCu4ao3y4hpOXnK9j1GF/1
         BoUI1PTrx7hRcUKcyoXLHoorDXxcQPLCQYZf4m8qvvetg8ipMHf3VTlrAOJDgjqKggTE
         3n82cRI0t2GB7OS9zVtChz7BLKMTTa3Hfb9lbqrl+NDjjAvzZ6SLDq3PsO9/4Eovjzks
         5/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868001; x=1781472801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nXKFoSv+OD8UufALvZn1QYM34hChzmAMz1kYVtXJuCs=;
        b=e+a7npoHRPeiLVBOiFyTM8G8XloUbSRulRHSYB7PNdJMmcfvo74cfX0dlQAKy5Z+yJ
         Y87JcM0lfAAWOyZAqUpLTNBekwkpX1sjlYXKpJu56vh5nh0DTwfyycYsWoYggMrJeKM4
         DZryb+xlDxBamHDqkB6v2wqJGmlkQ1wm8IKIGDmqe9zld11BbZRiKAqj+lWXXKM3wwrU
         UqtFmH3CgFNo+oRQCd1lqWr6BbrvCP+pSZNs/IqJ3qzoTOnEoG4PFVjg9DuFXvyZFZRf
         1nLjR0OULPduUWfVnmdRIeWkGt4fNQPLD53iMmpLybiIQcwHNkYNWcqtdLWHiq/QKV4Q
         /8hg==
X-Forwarded-Encrypted: i=1; AFNElJ++0L33a06oMK3kFvJkhtycyy8/S7zR8lhX6Wmb9ODdRQIS6JUIkezBniex/HGAEtUwSUQn1ogEowQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUZ9nJT8GBfayjDyo6l1m9kHmt9gBd1+PBuup6+75+TX+wdE90
	WNA5leODVTNZk1qTv3BVd0zybXsFMleOYsw4kJoVN2zYz35rujjL8Raw0704BMy8NUbNMVm9ZQM
	GgkpToWNcPU2NcWmOCNMQWGEt+m7VIJctnpmlGQeB7YY1al026kNq3Rfc6nxQas0=
X-Gm-Gg: Acq92OH4xB7sFit9zU0xc8GA16weBshuJ8NeKe3QZxAuz6jsGC1KEpn/9mptU/6d5qw
	q2OEa6aIJHRguzGSteaBa3CXJF7wl95Oyn+bI1rmCDBJi8+CU6rzXODVkpKZwV4bszbGDAlqnyZ
	9qctjoe4OQK0lQ2k5hmcipNazRSUMRlhrb3NCDDp7P+2slo315i+61PRwt2Wj6Xlf9rln5deUry
	Xwyos24t1aOBuk0al13eh32v1a2QIcsYXR2gjUTTkY6aB22PMwdCPcpneWGGgZyATtOI2MQ5CIY
	h2Qy5VtrDdYI6ww92ZJ0/gaHretpguQqXgz+VkHIrxXOz6uekRuVeD4maegHCjgiQH0z8U88nBB
	VeZW7wFd38MjIAnUM/DxF7nAmXsqAq/3ffWripp6LOQTsSz7wLeX3tmh2JxzwJmKNHLV0qxFzeL
	nM8n3yRfShxLXOQoIMmmdRCl1V9JIZNEPv0cLlKQd8V5HARA==
X-Received: by 2002:a05:622a:2517:b0:517:5e32:af23 with SMTP id d75a77b69052e-51795aebe02mr194976151cf.23.1780868001000;
        Sun, 07 Jun 2026 14:33:21 -0700 (PDT)
X-Received: by 2002:a05:622a:2517:b0:517:5e32:af23 with SMTP id d75a77b69052e-51795aebe02mr194975711cf.23.1780868000589;
        Sun, 07 Jun 2026 14:33:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:04 +0300
Subject: [PATCH v4 3/8] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-3-30b62b335487@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7243;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rdu6Lwit2C5KKaZ0v/12eMby0f1nLoCKXdHmYUOIy4U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQYUpV6AbZ+K+nm95Zl+WoXVrg+fMcXpgbX
 h8vS/IYrmOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1XWjB/9dqo7HAElaDvU+mxdxI+Ru2jHiFBIziemApDHFDezmPew+WlYPwGnF4HXVVGkwnqnNYXC
 RdsLnO6V2yjRvaDUyB3jljvapCpKeqoAOjTWpYWuh7ruL4RvL3r7RJbVdFiRCgvjbBpkr4EIXLI
 LPiNpjUmR/NV96lBKA8T7VZzMAO/WA0wS20cUkD+RMtdPlURGoSblZFEOZjOC6VhgmtUv6XT1mh
 2uMqBR0JZBDRXy8Exl1Wg7/eF3lvh3i2WAxvn0PsSWdr2wJKf9djD7ZnJrxViM/sOkJHaLMT12p
 J6fPPAx0hkYm0ysKoMyk6Lw8ZrANBEfDyScM8c5G3um5s3Jo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: yK8lB7r18QmSpalT63zG89I1Z2wgRoDM
X-Proofpoint-GUID: yK8lB7r18QmSpalT63zG89I1Z2wgRoDM
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a25e3a1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=sF2-0BiPaN5ps1Od_V4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfXy6nTo6aF5R3s
 Im709Iw30QaduYfzM5vjvLd3vZtMeVbMpKGEyp/JmLaC6jU6xr+sa1tcq45iKQAM1PRUYlvvilN
 xohd5pOoDP7zpSc6LlCAdHky9NS8ECDT2AdDa3B422tYbWheXQDDUJYNtM5lGRyWVic1oJgi/k8
 TaJxBbgEUzQrmH6QdJq4MDBoDI472OFQZ5xrhUCMMfPR7QkvrqGDWitPupP5o0zeVa77TKgZ+MH
 8Pa5g05BGIxMAjviGMwLexr7wRiEc02S0EVgztwpwy4LcAvt2pJ1jYZBXe85g8FnV8Np1N53hMe
 27Rd4ebypf1ZDzLa2qH7mryNP99+nVQnkvP7Uekfa+DpzLw25L4MxwpjMti1ZhjOvGrHalX34qQ
 CLoKVV6dy+lEKfR2MQC3ONKdfEBPKvzYSJsWSfTe37fYKCfTBDhrzU0Zu+fObyAHqK7dYe+o2Af
 1aIJPYq9uvqsaQgdDIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the drivers which only care about the connector status and will always
pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 drivers/gpu/drm/drm_bridge.c            | 15 +++++++++------
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 include/drm/drm_bridge.h                | 22 ++++++++++++++++++++--
 4 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index f02a38a2638a..0e2f0b046121 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -136,16 +136,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_extra - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @extra_status: extra status bits like DRM_CONNECTOR_DP_IRQ_HPD
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -153,9 +156,9 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	if (!data)
 		return;
 
-	drm_bridge_hpd_notify(&data->bridge, status);
+	drm_bridge_hpd_notify_extra(&data->bridge, status, extra_status);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_extra);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 687b36eea0c7..84e55db5c1fe 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1495,25 +1495,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @extra_status: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
 		bridge->hpd_cb(bridge->hpd_data, status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..f9a86886b0df 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+						   enum drm_connector_status status,
+						   enum drm_connector_status_extra extra_status)
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_extra(dev, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4ba3a5deef9a..78b0d83ef2aa 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1581,8 +1581,26 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      enum drm_connector_status status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);

-- 
2.47.3

