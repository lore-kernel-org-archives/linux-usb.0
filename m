Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675706;
	b=KmZ1lBvAjQY0UwN8iKmUePNP1l1KWqDjzbGyf9CFAFhNc09aXfSf8/7/YoYbGiGbVwVV
	 FehgkdH9Aam6dQ+kO4kInMP4ke2H2BTMi9ZXymDzRRUH8xCt2RIxhJgYhJENQpr9OdtIi
	 FjXVTnSj+tKGmUrAiOnV+T0z5t4bVoNpekJ6rWEJVY3wiCUSoM1yKxJnKt2AKaYu9GSUN
	 CmhLDlGFvDyAEXXeCimTJ0YRCCvarkqi2enw1bhxltcKlxgP3SpoloGt+tVUGPgXrvtvD
	 e/v82/je3vk8fZDJD+qpsvLWuVvIqd2uS4u+Vwa0JUIbbUJZCl9b/jSqFhyMgHRrhjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pVFcTsw7nDsd2D3WrnzVxWA8UM6MmAK5PteqqT4jhjc=;
	b=IBQAar3dGzYjWHQeVH4OJzsW3DJGHbjilq+OStTYx5z2ok9YGn8/KJFzgJXC6f8Pnywp
	 PLnN8M8RdVusM1HxNkbqKakXqeNM4Y6AHwdFi98WLSf9ovFUt6vLBIVZthLDTXEtSCAUl
	 6AxcNPU73yolifuMpdhoKKDyPXWlrXYFDHxIXW8n8OYDqUIZ7xiHpt/70/9cd97ro01bD
	 cNmfk5Pb+1AoX21/r/yv1u4Aen8kVDku23K7gPFKD4jTdzhVdbzOJ60qcRk3YSbNFPJSV
	 ECwueYx4eJSnFqFNe7MHAzmoT+R0h0mMHAgwbpFTO5T91QXvvthueD9ERPfndDMHOUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ofnf6ZU/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dK10tJG0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291E760A2601
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291E760A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ofnf6ZU/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dK10tJG0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0DP53116018
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVFcTsw7nDsd2D3WrnzVxWA8UM6MmAK5PteqqT4jhjc=; b=ofnf6ZU/q+kO7QhM
	Y4uarySkWnJOT1Mqh3oJNhtOMdkKTrz+Rysgd/jHT0IQewcoEScmN+WIcMumic87
	xv1YbMdjPmXvjfNwjGfPw2WYo5kLyAvSN8/Vt/xa/bqk7Lj41mx9Vg4eEtI4KFxZ
	jsBKnXDzgCMGk8egcNXgwE91XT+GqKGhInf1TTvDyHsHrc46uD14KNIgt98rd0yk
	Sl3u8l3gOIJH8vsM+BbMWaJOljmiYdArFkdNkQfRbf43Zuhm/7N5u6LlX9TGpJAK
	zfmHxDvDrTudHXozSmGX0ekFdX/dczwAXi0nm5GtNY8w17YQiCqHT6446p6Z1xgk
	+SIoog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bus4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso32674516d6.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675704; x=1793280504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVFcTsw7nDsd2D3WrnzVxWA8UM6MmAK5PteqqT4jhjc=;
        b=dK10tJG0WaLJvDefFg2gxlMV9w2dygd701Ldi1VHbXrNL6mSd28GZkNoanOjL/Usrl
         ipTL70E+lUdz7qOev1d0X0T2bDlnJtM48ApdIsCWWQNj9cLbD/hU9f20AtUQn6UTuSLO
         d36zHUtxH2lVKuKkIiyDTNuYdAZQ4zYH0uI4W57u+1m+ZYHb7XlcDvcqmPJBVH748/pH
         vSkhj2k16HRxEY9OLOsFwYqcJyBFvR/SCM9yhqSCIMZiRoiUMsHMPpJy0N7Ve9ArVsy0
         hbqU1OGMEyLXJ7GU2yz+7jvRG4B20ibUKMwL91ZNxwOOnoAiK+IeNbPGZH0SnNpnxifC
         HXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675704; x=1793280504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVFcTsw7nDsd2D3WrnzVxWA8UM6MmAK5PteqqT4jhjc=;
        b=BkHL/6WHdo24GeT0gR+2uged1ZMB6vF7DKeR6ywc9VpicoMQJ7BLO87DVVlylcAUPY
         IMKjfD9z9UT5nRaRq8UsuKzumpLJQtozeYpj3o6oIjFjxmNHxcxTDBMuk0ZI8WwuEw+1
         IDANmLEAwjECPh8Fy649Gvxzw6Bh0uZiSiv2kkc8icK4sAVlDbTIPUG/EwhxpfpHzN2R
         vK0xgcjT9mvhR1oWjW18NPrav7sFiCUZ+F7GoHjeBJgopMN2XvrO1IDfFDrfT4NmAaII
         04E/p91abPkfCAMihB7HgzUpGRP6kqfFddFG9eBa98gYqzO2j2dxnbYilrUHTwl0n7St
         r89g==
X-Forwarded-Encrypted: i=1; AKwUvByVe7Srq627XpNwYlpUTg6UE3bk3Kjmm8oXM1omxiPTV9w44JmNl4v1XlPMYRBevAv3g4MbIVZweK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgLJY2Z2b2JQxHrIUmDkZ0x8OtzxmPXSKqqNXCS1feGKRnpMNZ
	6281sC99n7mNnKlLttDqGgcR/DjraMUmh3NWRqU0hw/1eDqe0UZeIAMbZJCxXrXPJJtd2VByJOi
	yUxlp+r4V4Yj1fVLA6y7oDhJSMUaxpf6/6ogT/8uzcB3wQ40VxPsWVEDnovYcAkg=
X-Gm-Gg: AYBFou2eTqaLAn+H7tmuIP8CX6q2BF77p3oWSx7w1w5dpBTu8a/m1Ph5kOuC39MVf5y
	72JCl2DPToCB9pLzlK7hg3gnSaSpNUzajioGdcBut4+zRwPzA13co+ezHH1awrIgHSzRwPUpZoa
	KJJHR8fBjWfZaaxW4LTw5sozDI3vCX+SVsuHIrC5r/+IMIqPJww2K7svQAw9nOXMr6rN/Ygqrkd
	EEudrnmM8L5Ytkg2d2tzwnk4dHAtOsskCiWq4paAIBGub5l30tbUjVmYoWYbgNUVAdMzGtU/Xfc
	DV/KM6akTL2fsAX0qowKPfkgvIfGdeAwrcdO+5blZngIQUi2xLuM6swIWZenPYZOXK/8kHcaQ2d
	EINlaPdWz/aGbclOLC6QkitQglUOEz+dbPlkjWcyHlTG/5uiRpjcn6ymosRP3D3P01pFIOtuqSw
	ZKkpaV8jNltgpP
X-Received: by 2002:a05:620a:470a:b0:93e:7944:b874 with SMTP id af79cd13be357-93f57f7a4ddmr850928185a.33.1792675703526;
        Thu, 22 Oct 2026 06:28:23 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:93e:7944:b874 with SMTP id af79cd13be357-93f57f7a4ddmr850923585a.33.1792675703003;
        Thu, 22 Oct 2026 06:28:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:27:58 +0300
Subject: [PATCH v6 3/9] drm/bridge: pass down IRQ_HPD to the drivers
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
Message-Id: <20261022-hpd-irq-events-v6-3-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yTxN63iE5sDPxbwfRJoSoPuKPuQmAYz4uarpJlGhNeo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9l4JDgs3YT7fQflKbBludBM/COk1KjL1Nyw
 46WbgfsPRGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZQAKCRCLPIo+Aiko
 1Qx4B/9t2GhDJJTG+ELCwLIBsJRfXXRrdykplLp0v3ucrwWGUnxGvJldg80uKgm/+dha3ocW2yw
 QuCaNpwKhNVZpuIlfZqHWU0hAMkBFVxCme4I4kAh7GVsYrfoT6NhSm3K/MHE6pHwuc3+U/Tn44y
 bw9t+GVAqiVcJHy5dEntyJrwXFcjaqSeXbZckhqOE0UChjsMt5mH1pjH9huvrQ7McXEMnfsgyeh
 cJHIyJ9E0QX4rb+uXdhFUG60Qluqd8k7voEkbUf76YoZ5YYme+jrjVHBHHiB5PkoQPTh5p6RuYf
 4lmnxB2WsHIX13NJrfEf8Z4mdwaLlWvITclM+uzWN1TNa5ZH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX3Timl3VdcTwu
 jcSs5cxZFHplTaDuaReFwYO5mDN8vq5vr/NzSgOfpHf5sUaJOh2/8ecovFcpQDrjaIQluE8s5sp
 z0Gbz0UZLfCJIZiK0DuDb/U4TI6OnGU=
X-Proofpoint-GUID: lkQUNubwyzvAferphTqOejRhQ9KynV9W
X-Proofpoint-ORIG-GUID: lkQUNubwyzvAferphTqOejRhQ9KynV9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX+WKnXj4Wes/h
 +h1jBZCUtZsFfwo/4P/xrIFT2cu53bAfPzh6QwdMh6mr+LSnsKKQWpskRGimdruW1iWiFwaKKbA
 UArMVb3x9zGfbPsBHEFqXC8hi2Q/AcZCx6NaGjwCSWY7eDBi+WAvZgtlLYLtNv0bOO2x+TRkK42
 FCcTM51e5dBg28X/mcqInnM1pkyXfRDDX8xmk/qtn3SwxmBDfuj2Zm7ooTzeQfj4DyUvSUJJzlX
 yHP/PI7xAfcqHutsxDZsEPreT10eQ7KkEeBxHBZyjTfNb1hzTt+SNEEJPd51jQk8SqMB+AM38Mg
 9E4LrA1g/ckvKjsJNnBL6tyH5/0YuOL1B10UXAQGD/zAHtis5DGTaFKFBZyDyWyMVBdPVs8LSKS
 taJeKBnePJ+otlun0QV90gbBfA58IQ==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada0f78 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
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
index b3bb7f2cebb3..b1ffbab89a16 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 898273f60cf6..1b0a1a00d8eb 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -151,7 +151,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, event);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c4355c5cc340..a637613ae2e1 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  enum drm_connector_dp_event event)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6abe30bdff12..fa8942922b53 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1541,7 +1541,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index da412c788503..8f2f4201da60 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -31,6 +31,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index bd6c4d2dcdc8..72972a6fe989 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d..6382ef5f1ea2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -509,7 +509,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   enum drm_connector_dp_event event);
 
 	/**
 	 * @hpd_enable:

-- 
2.47.3

