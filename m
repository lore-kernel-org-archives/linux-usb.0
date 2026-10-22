Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675702;
	b=OV1b/iNJM9c86UUYZ9+R+sEGU2C5ajflsgo9mtr5PfUX32WPXWnu3XZhJHdhccfdjspX
	 +pMA+PEf+8fPnUrKN68TlpsQKVU1xjMMiLsBFJ4AzSjMyZbqDhUm7CO2Ad9AnfQTGZR/P
	 h+62eTqF6UUMhq5w2wtQBqRsVgIJ1TOWYllO6xhCMo3bQ9Y9WWNR8IjNOZ3RBP/88h2Q8
	 CPFX+TU1mwMsPlVOdViwriJN5Bfx9CeKWffyJGZt4AjXIabBy1YphX21vUhquFP0sLUWK
	 qufMHzq0dMUv6JMFH5+pM+SYY+f1GNixuYH+sBkErIWWZw2SfCsG6sMGni1Pg/MV2fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
	b=3ufCBA5BdHbtfO1Q8+R2Mlk81DpCdRQPIH9Ow9RsHiIiYzEfh9AQxO3NheFjRc49of5L
	 dehQe19Mye7Lg6kAZvPDnv/WKjg1zh3s7VmRSvCZCGOG1NSfB1cyOuvdQ1vKJTjIJ1s04
	 YShnbJRz1YCxhNUan8AFOtkvDpl6cZbLMNThmcOwo/FMIBEIpLwmfTipIqbP+LglhYw1D
	 PvDgETR1GGtLBPNxBbkCXv3GLyfV463GdxrKm6m8UUXul8qCARLw7VyuY0igFjdXgPED+
	 lnlffn7uiLvuuST9o9FQhvX3my5bxCuFYPuQlH/ysHbqttZVBHjMBIyn1fJxBdRdxzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5DcHFsD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpFWontg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20316606A327
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20316606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5DcHFsD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpFWontg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0WkI3923125
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=M5DcHFsDC+EL8Mkb
	k164l2UnqbYDeXD7sYFe3zZ1ZFexpDf4Kehgy8W1M7DowBtZHzqbQxiu480Df5Sr
	58G46/R9IeHvJl1xCQDw+lQEFSiFaBCWrZGOjjcFn7/5pQ2ihn0c8UReV6pqO2iA
	x2H3g1abdamEIN3kuDeOA1qZCqXJXIYC1rFrtDeXW3n2VMFAugKkF9I43I4MyQpE
	CJSxnmjwGLppgYdiFV9Zwf7JTeBgr8AO5Spg7GGlHd6xRXQ1yumdqUXugaHKhkis
	KtYypKgRDBTKLIkifLi2dUaYLJ7gTuaeQa3V1xwpUi39udR/DonlWwrjpe6a9ToA
	NS/aTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bkqpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so347258485a.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 06:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675700; x=1793280500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=dpFWontgmqiIkrra+kSx7r4HSR7BSIc7f2afNWRss7sPU52Bbl1KOjuSSOdfv0BlgG
         f/vXioIssngLRT+7CwnnyOg3C102RTSGwwuU+fCDjhQ1jLoaRYnVDA6hIOo/BJZT2GPF
         hQhSIA3Ssaa4ommoKNzQ2STL6ee861zKXEIKhPUQNuQ6rLPF42o+Qr4x0t8FBoU5fbPC
         /Chd0dVRTo7B7e4U6DTsyFVArfxoHWwVR8a997ALSUCxLhO3CBl7WXmhBt6caz+j7fg4
         WX6M9d740o1UBpCk/Cyq07FdhKMfWi98sl2AIQe8f448ocAH0RlrTBtl5ChfsQBK8/6t
         KiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675700; x=1793280500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=XeKnckdTKD/Rq1zpQCctbKF6k4lr7LqKZSaYDY7dX12a0F+TIkKR83l3Y8ZsKMVIdZ
         OXB0p9CxLMz3AXjCOY3fORSOnYC0TLP/D0uZ+8o8/Pj1VO3vy+MkdBlH3TPBCh8givxR
         GpVpm9tFCGWMaG3Fpijb1jjUcGK0K/kEsCZr6R7Yo9SUVhRoqrXqLRl43LiRbrqaP2QP
         b72YKnIpjf7mE0bQdQsEYn0Yy7PiGbr4QL6hNeJ9CgJhcQNVRDRAbRCxZNJMuiIrselI
         7rBfXDJomzrDDH0hsPYgZD3zrm3LSfAVChyxL3nLA5A3LmkVLkwcJbyXJE/bwQLmfmUs
         yQZA==
X-Forwarded-Encrypted: i=1; AKwUvBxl3nXA8x1n7jmmaAakbjs9g+bqkLBQFusm7+sSQW0Kj4JMWCclYhiYYw1KrDR6AaliSLNNZwuVzYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfL0WJXvbtPJ6gHJwNdBZv2/Z0ICTPUJPIDqnV2agvtl/PF1Rq
	V72tfYHEhHz0C197M9AHIXx0CnT3GgMoodW/zsWjyfFi6zDzF876bGYT9RjUS+2xk8gkaR7wt4Q
	k7QNrxbKfel+5VdCPujfV5rbRnBCVFj1r0/LaKuj6trVU9UVFjeiqs4b9Mq8KRh0=
X-Gm-Gg: AYBFou1zBgd2XAfEvWqfT8f/ujeBttOr83TprVGUtmV56RWzK/uZDzsTozOR9WJ5gYy
	fzNqGzEvAHv1RW29Xg2ceZWSpGaH6kQnFhXpJNz5kBg1vs/iYNxcPBmMENoL6+GKjujMxkhSi1N
	AQUR4GXaiwHCd4lxLK5sttyDlgq4ot2mkVTz5zW3t2NM7DkOf7fw6YBVZJSMdljh/7rAZgVg8uP
	XaBHKON7XSQNlO5ajUorfTDpsbtK2yivpUXcumz41PCTnJwAY4xpOyFvbXZPNxF/ZRsIgF+BzlR
	SrLzkZJb/Oft3y4fIolh+9oPZKSCo41mFSWp0P1+15WShELE4ZVTuZ62hpxq+weJq3dGvTSLejr
	KKJ0IHcHwOZHB1/rwGJBTzqfjT6J2De9VlkwaxnX0Ugq/3BnMWl2GCIispFvFHi+JK1FD5fEKMX
	t6U0wqXR1oOxg1
X-Received: by 2002:a05:620a:6408:b0:939:6de9:4cff with SMTP id af79cd13be357-93f57f3d80amr951086385a.45.1792675700411;
        Thu, 22 Oct 2026 06:28:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6408:b0:939:6de9:4cff with SMTP id af79cd13be357-93f57f3d80amr951079285a.45.1792675699899;
        Thu, 22 Oct 2026 06:28:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:27:57 +0300
Subject: [PATCH v6 2/9] drm/connector: pass down IRQ_HPD to the drivers
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
Message-Id: <20261022-hpd-irq-events-v6-2-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5315;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EorsOQHW0H0nqzv28S1rGKOICW2UJpSufyghXnThB60=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Yt/hSzFpHE6ev+vJn//9zUP0H8ontkeSIVJ4sXfporv
 CZgVUNcJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmwl3K/j+ENcuEteD7on9S
 j+81h/AWqFyzznIP3uBqN8nG8EjUrlnhk+bZ5s6ecU3jb3Xqp89vU2+yrGk3K19kb6LJIJ7qFcK
 idd0sL7tImefD4i8ybw8Lx+tqPv9YfTVsLZ9+0/TTprn7U4oLfyxKTyi+sdJlVb219rJXGus3nL
 kps1T8hEfTnPtWE03tv9pp5VzwZcnRbVvZN11mv3nJXUb+6+ue3eT/xpleUxq2l2ERc+vNrLqno
 uq+Mjyr9yguaLWZvYNZ/YxHQT6nkbtX2esXB9nNxB0POd0qb9Q5vvi9jKKO5/JNLkHf9p896G7N
 Uc3NbtyY/8v/sWnA3kNTv/FtXCX32+Kq1/tjn+wbdVRjAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXyGUmCgPxaMCT
 EYbchxnvo03DOAeDQFIf92cxJe834EIM8DIF+LMyKfuBI0dY5UsZJKQwGmTCRjGAGUl4ROy2Bva
 RQ85kAysgY6XaQAM4qTJwsIydXmuaCylPoq0pX5M0Y10OZsXMVYFQDUdosaJT5ngIXO9MSZOS1F
 TpzNJ5JsVWULf5zF3wpS+w9mgvjahbi8vTZuNiOY38P3+ij9SZ5olGGlpN8Rg94DyeGLlzZy86s
 J1Tx0tH159sZwTl7/hcaHngQLqhxrTITyF+1YOiLNaKXj1+5h3QO8jt/Yt/nd9qnNqGamYUhE1P
 p7l4oIzToeOvNkSuhPn7qW5UsTTNsRJoyV636NW7dhdOaDMuHzTA5PhqQnljR5p3PLnNsF1YpY5
 E3V7QEdC+mUZIco/GmiSVUXkPwuHIw==
X-Proofpoint-GUID: HLiwi5kGyfje6p-gD0Ze6a6ZJTQZ-PNH
X-Proofpoint-ORIG-GUID: HLiwi5kGyfje6p-gD0Ze6a6ZJTQZ-PNH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXyUunwiqOio12
 EPHaxo3x28Rt1hGFch52ok+GKUoYwukzQQQgfo/AQ/eTjZLXT+vwEAjodDORh6Cs9IrCcBJ7BuU
 M6fzJigULAmnbd3owavQg7xlC2358tw=
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ada0f75 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=DclysrjFOTLD0Guyi30A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required. Bridge core is converted in the
next step.

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
index 81f3e26f6fdf..898273f60cf6 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -142,7 +142,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -155,7 +156,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -164,7 +166,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, event);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -172,16 +174,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
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
@@ -301,7 +304,7 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 				return ret;
 		}
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3c8181df6bd..90e27d0b165c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3847,7 +3847,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, event);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..911c3b269279 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6760,7 +6760,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_dp_event event)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4f65c97a89ae..39814f10fcd4 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1974,7 +1974,8 @@ struct drm_connector_funcs {
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

