Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCC831815D
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 21:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868010; cv=none; b=NWCeRNTPtkk/gU9mzHy2Xn/IZYo6hVabV9opqoXm829Lku+H20XWUfeMa6M0Xi1QFqNzp5lYo1XpcyszVXaZC/S86qpWDJGaDfO1ahCTKXCCocq8v2bq8U58knst5/iztqD1XyrfX1FXp10TtuqLTdseDAElF+GKXEjtVMUs3Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868010; c=relaxed/simple;
	bh=5ElUVbocQ0iy2D7k4OSQYGFJA4wuG0p7RdSU3WVG4AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KwcwI0T8rX5xXd6vyVGQSQhpxeBn7mhrahSDwNy9dCf0HV1GGX1C7djM0/18GFvtnktBfY3Udkfzp8wy8i8dH8wE03GIrnCUlvzpUe22/v3f4UOdweqllv9JKW/ZoMJTzLAYEjSAwahxNIte2mmbXG7+QouQoD2bW4MGCt5jqME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IfvAqeMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHf36dX2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IfvAqeMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHf36dX2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EmJHk888723
	for <linux-usb@vger.kernel.org>; Sun, 7 Jun 2026 21:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiGy/JVajFIukktw5owJydRTv8D1sE7z5Bd4+V1lofM=; b=IfvAqeMhQA3w7gsk
	5Alk4DF4N0JH0KwTuB3eXWzoXmzNinLzj0ClsiwjPc+guvwtFneMRSFBh/rc0HlJ
	NvtAmvIguXP4FqYMxKAH/KhnjfxbJggLaeNf/X2q8W7elFkbyNQqoiFhDiDAqlAV
	555LxiXgU/VSbu4ZsUcN/MCLKMnwSd5q/NyBK2Xg/SUW5SVo0q6Z1ubwjivrJkOH
	r/DmXRmt3+4qzF7dtcDoSinzmEyq0TLJvKQ3AtdMjkG8IEOYmYgs37j6PG0aVNY/
	O4tfdbm5fliyVoVh99RpkMAK7MOFKgT9cUbQxL+GnuI/HThJKdGh4sEYzXs7Cgx+
	4au1BQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrcv65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 21:33:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce4f4634fso118057706d6.1
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 14:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868008; x=1781472808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiGy/JVajFIukktw5owJydRTv8D1sE7z5Bd4+V1lofM=;
        b=UHf36dX27jMLQ23EhOv+Zqf1wJ2sMGwxslpWkHhVThKtz8yofOt1Np5+D5dy9LrBN+
         1mOORt52oTfoeH4Ub/rhFUZ23NonM+51rKubGzBzBOgJzNsM4TINIJ5rZXfinGFaUSiH
         8AXgWFKyq9R7966W24XFrxkgF1n9UT8RmuyjgE08bnSKATk4VGKnADToSPrGwUEmNJe+
         PWyIFoFVt9GBiytVgXkhHCqi2wC6WUGZif/D3g84gxwQj8cPY8duzaFc3+TiCa37YPmw
         HeGfnB3GdVULWYWhfW6Q2afYK+cB+NRAh49GHKLmR/P1u0wWKDrFcDxT6o91KaqSA915
         dCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868008; x=1781472808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kiGy/JVajFIukktw5owJydRTv8D1sE7z5Bd4+V1lofM=;
        b=KA0rqLWOimGU4xsHQKbDQebuIhhsu//B9uoxwIG2/t/25LtvqPW5I3tccHRoY+Co/S
         VtuiHiPYIZWlLSmIt35KGOosv+dqP/oVhzoKdacn/mDd2zLQJ6CBgFcJUA5x1a5XGq5k
         wWj74+IIANTv8+wB1zA7IPpBr2PYu85nUXGrunX2B+NUb92zGil6S4gJZiEMf6NKOtFJ
         BSeMOccIImfKGngqGQ0+UP3ik8amNKdKSOWkcf4lMJl6ARxmAfKn2ztEiefLiZJlnIqQ
         WwvVukAAZMaeWYMe/ZxgSkQ5LOGnKNNOQ5a7SVk3O//rM/B0Q0TaRVOGqWEcAfJg0gcL
         amcg==
X-Forwarded-Encrypted: i=1; AFNElJ//iOfvVnbbHbfXVn84Q3ZgKHdu34MjNmvYjxmwD8AfpnLkWVpx5yhGQQWMjTOrGCLnmEdjkq7pL1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YySy2OVt8eFyG2lBdKYQxlwauUvwQy1GD8IzB9V7q5YfHYxzgKh
	q49yOmjGbXJDZAUD4pHcolpzBoE9urMExJ7NZbT405GFWcewgoEN/se/30i/6SnXxM7WYBMCgvU
	GoYR9ZtRtpVCLeJGF7DbHRJZuFax7Voqf8MbfkQj9s3UXP/QShGEKgdT997bIyXk=
X-Gm-Gg: Acq92OFPtGSSHB2sFOTmANgXF4zZbEUYfDQPFJxxzaElDl8GeOnoM8uBoil+kkY8ma9
	ckhWqWy7AEhQzPKcXu2iwzacecYUtTLob+sCWlqhsK4m5T7S4PJ3jcFXPdZiM/oyBmkImEnwbDC
	KovZrXvye+kOoT7Sp+CcVBF1tgzTsnj1Ek8d5zJrDQDmefGipv19TnfiaczIRt4r6Ewita8+EU0
	0ldaki1JetqN8+NFNOKRyk8e5iIl9LkJ22Ovek2fz2Qbpwc30wdU6Zl8sNGLqN70lpd1/joV0We
	70nqwIKpQ/yMqf5mKmPP6kUwKlHZJCS+x+JDl3tcog+gp/eg9YFOC2odLyLDwPnUiGIn84FVP7Q
	J/YuukMasaBcBGFOyk2bMx4xS4yNhUddvX2XQktnqyVufjNZc4f1qXgmph8PUy+0Yow/m8gMSFo
	9wC5IJ1LdLr11+YiiLOYwkBXqVtuID9BabiAZlcL6076m8nQ==
X-Received: by 2002:ad4:53c6:0:b0:8cc:f135:52af with SMTP id 6a1803df08f44-8cee6134a06mr166005796d6.24.1780868007531;
        Sun, 07 Jun 2026 14:33:27 -0700 (PDT)
X-Received: by 2002:ad4:53c6:0:b0:8cc:f135:52af with SMTP id 6a1803df08f44-8cee6134a06mr166005386d6.24.1780868007134;
        Sun, 07 Jun 2026 14:33:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:06 +0300
Subject: [PATCH v4 5/8] drm/bridge: pass down IRQ_HPD to the drivers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-5-30b62b335487@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5210;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5ElUVbocQ0iy2D7k4OSQYGFJA4wuG0p7RdSU3WVG4AY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQyj+mOsk53KpLOI7BgWch0S1P0qlexQHVj
 QyBxAnUhaSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1bHPCACpzwkqWwBmlm3hEBRQEaLNtjJ4ixNpHz+KFuG2tLcPBqwnOTCnIWKTokmxQIPcwM6Yp2W
 FWCul8g8831IzUI986tYlkGuykff9QCUSRsIsPrCTqy+ysd2/VPkR3DdSx+f6tdj8fKuZBV4Kaf
 9slQ7JyOtsR6OGKVXoUA1eDX24qdqR0dou+URi7qC3Wb9svooTtqeJzkyq7+ZJIAm2/uA2GGUZS
 gD7AVEXZmhxRv5AxbmsrRsafVW+M+NDNDVuU9ThbFwFnopPm+INKpB6YWtHza1daXidoGdVeEbU
 C0VC3M7JQ+P81XsZRBqgXmDKlXRIeW0Qoxh5bOs3chXnxWV5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX3DSDhaKGfW9w
 upyzmBkfNWUBgH0tnkNIsK7VXdG2zraPQMqhFwCr+dY5Xyv1hJ4qVI84vcbmiYpAj9Nu7n+F4Dv
 +ANI8B6yDKYvPb7nOWodJf4uvGrxnOZ2fribhTTwv1kSKTEOzVIo+0+fs7Cq0lDXm7KO6qvAcsf
 FLT24tveRmipZdReaw4Svqh0rw679ybG99Iv6POa6RA8//wAZZqlpJKuBOps83Mx15QZhgu2m+Q
 j2n8fU9gcHOgMhXzB+PPg8rqIAlBEeSQJeCSxa5M02pyi49XFA0VA8BipiyvUnJvwAGqYChgSO4
 ISXZXymoWZF/DlsmeCyFQgwlF4ghGEbVosWZ2IEw5eYGXfXfjWWNTMJQWdPlRBOGEoO/mVEgXBp
 5K3zjhaRuHEafMSLorezSCxGtbYhVn8gmLi3PMwOCHQtggNMLpRwrScZduRYaGzKS1pV966Ok6a
 2oNyy7GjnS+O1xU/XOA==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a25e3a8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 4hmSZ5Q6UTXD-igH7fu1UNFNptp6d9H3
X-Proofpoint-ORIG-GUID: 4hmSZ5Q6UTXD-igH7fu1UNFNptp6d9H3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side. Pass down the extra status to the bridge drivers via the
hpd_notify() callback, letting DP bridges to act accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 9427cc2358ae..8cb17bd0e238 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_status_extra extra_status)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a34643d3ddef..8f7075fd2aa5 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -150,7 +150,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, extra_status);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 55c0601df3c6..4aecf0ffcf75 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  enum drm_connector_status_extra extra_status)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dc6f33809ca5..c0f6a8ff9b99 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1514,7 +1514,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      enum drm_connector_status_extra extra_status)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 041aa026ae2e..4d98e04bb511 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -43,6 +43,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      enum drm_connector_status_extra extra_status);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index e306247ed8a0..d02d432abde4 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_status_extra extra_status)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6a5edfda2ddd..9c4c88024cc5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -615,7 +615,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   enum drm_connector_status_extra extra_status);
 
 	/**
 	 * @hpd_enable:

-- 
2.47.3

