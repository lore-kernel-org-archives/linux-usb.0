Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF0E23ABBE
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916504; cv=none; b=WujqAGaGHp9LnGWZzamGjTeLw+iX4aV4gv1YFVGzswmfDx6ttfsa68/0bdlthv7O6SwYP/+ak2gmQLax1yiIqnV5I9K5aYvM7KJoaO4zjn6lzcCyjvOE2yoeK0Au1BbfSmto5CaPx+qGo0ZEkVDTiTcVcY1HXJJLNGhIK5d9YxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916504; c=relaxed/simple;
	bh=EVgrHj1tZBs51ETDgVLuzBSX1Fd5Ddi56a5fYfUb7ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MgG6Jr56JQy6u48w1xclcSbpwJprZwU/+cNNBL06owMui7+31OxqvGSvUaHjGV5Yejs7/Iis0BQWyxgh3Us/LMn1qdxOJXVmeOkycDufNhThMzfkZQyWvzS/Tz0EsoCITuOBIPx4WSXLhpnDg4/hwrIsfKvOdEDNoW4f3ldAzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7CittKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoTsMVYf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7CittKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eoTsMVYf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoPJi2762376
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXWAWnwnkyxJNop1YmIHyAiC0W2g9ZZFzjEZKgzs1qI=; b=D7CittKQZRPVq5UC
	NzezV2mRx7HM5unMGn4yWg0e9QyT7guxtZ2apeq28m24DXT5UVEUSSLkto3AZaoX
	RR6aTlY0GH1tuA9eBSBw49k783rdUKHLw2x9fhmdHVwfvPuaYkS/gcRs6S50dme1
	jd4Ue4hnc4uvbP4KiBFqn2EsF/7eMpG87+y9f7zUiJoEcByyQSzcu59i1nNfh/TO
	THdX2yS3N4edXwkhE7gYvpS2NuPU7zzwi9G6LEPPI1zVWTp0mXf7hi/cAFnMX6wr
	X37003zGJy0bCbxvWcIkiqQVzxhsS/fI3GomsRvVQu5lASoN1ykXMI/H35arImx/
	EA2SRQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd63b36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:01:40 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98304865f02so1971441241.1
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 08:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916500; x=1790521300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXWAWnwnkyxJNop1YmIHyAiC0W2g9ZZFzjEZKgzs1qI=;
        b=eoTsMVYf/rwLTu4YukIH1gFAMELZZFF9ovmnE/T+vJg5K5KkMCX4VV9YnoGyWsPEgd
         ph387LUm+BAXYIN9Ny5izQexy6QxaA9iohHnNGLHDtoEj5opPX0g5xqI+5bIE9QvapTh
         aY2kFTUbw0VsVqH53xfmybf8475maAvTIxntH91g1TlJ8/dsvcXpvYqlDaOJdJ9NvYee
         eLOPSxdekp1uvkhD18u3YOyCG9/F8KQxmrJz597gSy2isPD833gPq1vjNOnusWSc/TrV
         6LMQ+ehYEOvzh3hw4nqkaLf1ZGNJ4Y/a/4QQw0mxcL/bjsJ4pc6K2o1KmYzN3VYJyMyo
         n2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916500; x=1790521300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXWAWnwnkyxJNop1YmIHyAiC0W2g9ZZFzjEZKgzs1qI=;
        b=pz9jLdnSTgApp9yGXItUwA3lerjpNitCGJEwVNnt3cOr/qZ7eArrC+TdyvFSoppz/p
         MAZHVx4N2A2TAjZ+iMbOCWYfcvLmSqJEex/Lt9XhjaDS1uJKPWUJkrgfo6zjUM+sqzEX
         Cg5jKBvjWPz0j6Z7mShq/9sH7104aUNqYchpFV9UVal8xwPD0ancYn0IIYOOBHJzUrkA
         ejuVDadO+DR4cGUfl9bBOv7H4xx2frm5QvAd+3XpV7T68H4uX/JTvC0gW9XIgL/Bkiw8
         kOQEkb9qpKbR3S5roCGOmugKshGOYy9X1fxFlHd/h8sRQqI3bhgd9CgHt+JPGYUpZumf
         nQ3A==
X-Forwarded-Encrypted: i=1; AKwUvBzlH/Gdnfal0UU4j+B9+kVvZHpNJOYED1MsnIHcOF+okl5dsV0lC66FZnHXmGGoMYIqr5ugk0RzJLY=@vger.kernel.org
X-Gm-Message-State: AFuF++kKk4Rv61zveIRvtGqdW8fAEymMqEwaUxdyi2ihzvgunetI8UiI
	MBGar/7rOIEkCHIXOIXdW1vT+wgo3UZcYdl1NYGZv3OV7ZKW9FmWQV/LhHPeYQFXhz8+fyOppAB
	WZp1CEfOFw2vuxBj8fv2Z9ztwcDIgkTb+EmYm4KVXmq5Mov/E5tEL01s/u+mBlyU=
X-Gm-Gg: AYBFou1sy5NHxh39mPXzYDrl2Q40Q/L1Gnhilk2i/alcpDboOJfloJHTyPsa2BzSqK+
	+CYMsnmwlqRoF8CRi0z9doR/vmxb5CvQLEqZQz60r0I4HW67QGz6POFywGAKq+8NXqB2XtPKSva
	2g7vqpKPEVx5DXEKHTemJygy4gTvqZ6NnxiIt74ZzKvUtT6GcOFrP9dv6D01v2T2yy6XgaQE6a1
	p4z/vkbeOIehm1pUL9KqluvqvlwAdvrnuHaLPVS29EFji8qgc0vyJVlG+rJcT7R/fnK2L/Cx8hS
	iJOrdkB0c9gfBKdiBlqS0gXOnW9N2I1WeMonAsW1Ar7XljA+Ty3n0QJxILnUPi/+gTXHMHCxPXt
	+BqQ78qR31VXfaf8Gtm2Z2vx5LGvf5V2HyumbYAuOzC0t27Xq0sgVIJACZwVXqZeK8RV1I5d6tg
	4Hy34J3p9zFb6G
X-Received: by 2002:a05:6102:689a:b0:7a7:3485:33e4 with SMTP id ada2fe7eead31-7a7348549b8mr1492126137.33.1789916499567;
        Sun, 20 Sep 2026 08:01:39 -0700 (PDT)
X-Received: by 2002:a05:6102:689a:b0:7a7:3485:33e4 with SMTP id ada2fe7eead31-7a7348549b8mr1492036137.33.1789916499090;
        Sun, 20 Sep 2026 08:01:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:28 +0300
Subject: [PATCH v5 3/8] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-3-ff1de0090c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7277;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EVgrHj1tZBs51ETDgVLuzBSX1Fd5Ddi56a5fYfUb7ro=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VHviHGAAVv1soXfol+wXO8U14A018aUgzNM
 6gy+9RNhzWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1VhPCACAVzX19JL6817I0MNCd9lLSKxJ0lJ09Zepji5qaM+gFtbZqkuEDfCk9lzBBeE1X6ktlRS
 t51CPFACafuD37D5RZzVdDqLyEYtYcK4HJdPVflqA3dVEKSCohuSN+uNHVvii1pjZML2RPYSONb
 VlbGrUki/IQDwoEwHkWg4fymUWBCWxDy2y+AHxLgOdNKQPm9hVhvIzGFt7poSRLbd/KzEjDBAJX
 AN45X6Ux5Syo5KWeuqXn5sNIyKi5cT0Jgwgj4vfGR4Z+pAcLdFp/TvTOnnVb2GKZiJB0xiM2OBS
 IiE4j2cUIW1hJsyQTkWakDw77VpN9/agr7urnRFJFnUhD9Hf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX1M7Zx1epiYc5
 Kw4sFlKL7c+EaQfaC9PyE8Nma6pW9WGi5xREmszEgsErtIuL26m6CleiI1k2cz3/dvhtf34zvgK
 GoXQe6AO9iGVUAwnw1bYEjbOrIrurMTBp7Lc90jFxvYMskBDjpNTmCnwKCqJ65YyMEyF6Dby5Sv
 DUT7Ihlc9+HMlhnOxrqLoGY6dzv17VqfyDqVBNGnB/Y1L4PtcJ/qdY35Ks0kF0d5ogY0rVsgFNr
 TD2FB5yNgSZI+qkBoPAlW81ylzRf1YVgtY/l5ogzjY73E6BEz6W7zlXnn2Nwpthbjv1KxXPJr68
 7xtDzL4DoqUgh0wT4UUUYG6nrGjamJhrrWPt4Vb0LyAQXiYyEvWf/pZdDHGc5dh4Kem6nibeWbj
 1IAdIjbzdA1z7R7HK6H2O567JDMJgUp0STXXzrM0ISORWBiwXxma+n0j39p/FIS8eBOfgkjg5rm
 Ba8Q01n5vL+uYUPVBOQ==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aaff554 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=sF2-0BiPaN5ps1Od_V4A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: dOHUROQb6e4Z60cQGRzHzi6uK-aa0aYH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX1vOloxTw338I
 LX74Oxjs3BDoBFaSXxR7lABaeA9S1QEB75m4uZ9CwL1TR+T9iw9GiL3sH9yXF5qGVJErv6Pe4xs
 52jk7xzSVVyzZRo4GZ2aECZiR1E6DFw=
X-Proofpoint-GUID: dOHUROQb6e4Z60cQGRzHzi6uK-aa0aYH
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

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the drivers which only care about the connector status and will always
pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 drivers/gpu/drm/drm_bridge.c            | 15 +++++++++------
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 include/drm/drm_bridge.h                | 22 ++++++++++++++++++++--
 4 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index a2e525aa5788..930a03496ac5 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -137,16 +137,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_extra - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @event: extra status bits like DRM_CONNECTOR_DP_IRQ_HPD
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_dp_event event)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -154,9 +157,9 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	if (!data)
 		return;
 
-	drm_bridge_hpd_notify(&data->bridge, status);
+	drm_bridge_hpd_notify_extra(&data->bridge, status, event);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_extra);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 649f6b6ab5c8..58927e0d0191 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1607,25 +1607,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @event: additional status recorded by the sink
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
+				 enum drm_connector_dp_event event)
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
index c2f5a855512f..233ca885736f 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_dp_event event);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
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
index 58fff047f43b..d64a0ab02c90 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1470,8 +1470,26 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      enum drm_connector_status status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
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

