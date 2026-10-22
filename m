Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675709;
	b=G7q1My8Bspo83Oypoent8YbtcruoTvGbAcF0YrpfLAvDZcvUPXu1C/gNRXmyQlR3gYnS
	 ZZALg33NT86YMdp9950oDI1X3pkUwNq7LpyERjaDKVi+fEM61MVY6zFfOHfQgJLF7a/bl
	 7lryYwdThTK5d6Yaro71xfZ19W8eDaDdJJepNlmFkgq76kd7KwwhLcHTy3vurzD3W580c
	 4+M3DaGtrHrAxLS+uPNG0sM/+pUfTkGlGn7TNhNstaT3gWnJZI1VUOwLmmn1ntVE9g0QE
	 bhQ+UjaUg3iSuLFFSEcW/P9tOR6lAUOMU/evssBCJKrIuonV8PuvNJ7V+8vdV/HpcsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
	b=JeI/paNRhw4ko5lYDDHACewjweAGtwOS+/mI3GX2m++tVBC9oYnkak4J64Rtkp8C5Xvw
	 4jCM2mu2gMuL+RU0ZU/17DmWNMsINYIXRIE1Noi+aY6ThtnSDepxUZFy/bINojQnkBn9b
	 ZE3AdRyHc/FQVf3DDSppSGSqy0Fz32a6iUGhsxI3rGK1UtCL01DrK1+WsLd+1ZN6k7nmJ
	 l6asP8P6SV5GO1UIpzsZonkncRI205qesftnV8FPlM8yyL19+x7DRz5nmuE6uSzLGsYd/
	 YGnTrXgzO7qcb2Oylj+9a2OIHoLcEhVYSRnGka7/p26SS1lpobmTidRGbDAylYPgATA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZeVLEBj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z+iBRFUV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBA860A261B
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFBA860A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZeVLEBj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z+iBRFUV
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0HKx3428085
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=CZeVLEBjvIzXrdp6
	zNw2wVWiVgTpKCuap4rZ8nsMAD6kvXwxI6y7tAIpX9cFwskWJuBu4UADQJEcuFxR
	U1zWyh1NfibE0s5kX7xA/LMUmfeXap8Jz956NFBzEUUYH0lCbq7uuXxoL98J9SDQ
	ZSIA0q8ti6SVppbUHO5aXVjbt/eaTaZE6UISVh1jpCN2QCxaietQCgoCFD+6aAko
	Vc+bONyAw/zoLfxEvtSLaLo8sy+qqpLljUOSYKJYVa7OO8yKjaIgyfGXVleoC22p
	MZ1Q9OzwT4IlHXhVjGXqbpac21/MjbeSwpbD4Bu1999+rVbg1iLAyf0PXX4Ju0JN
	lF+8lw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq2j6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so321542385a.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 06:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675707; x=1793280507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
        b=Z+iBRFUVQ2DGnZ76aEkcAF/s/MlMNxvEZBnr697Mb9Sci6juYgWVI2OHeDt4OiyQrg
         XdwiGvEoSH0HFsTxUcCIs1ME/pQ3HxjHSKUKWwt5KgsHALBUNwVy6LbWFqT63shktdhV
         0Q6i6rU9Ju4T0NCOgLXJuRl8V7KID8P4RCVQtOVPjNIsu0TthY1bFv+OiUjEAiXP5xvv
         gATuHxWcP+B/rNv8ZX4ImglNrcIh+3q7/DBLYvZpV21hkNE700Iz1+dUiUnL4m82VWyu
         1YQo8I1T+uwivwL6zBWBgO0Cyzw/tMNGrNcrJyS3moa5JY+RhTf1L7sM8z5ZtkBBJKs+
         X8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675707; x=1793280507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
        b=gxd3h6Xp/3DI59yB/xAClWszOyadpycavSJUsTf6GMGsCHySdo9fx2zk9Mc0LePthI
         1jrMXPjAgoQQjRwDAwYF/6O7E7LegHQtMmwugbPzhsWfTRlStbe2goBth5PJ7KwVXi7E
         lCeUjD4SFD9evD7r3zP5ADbZIkyR5Uf6UQJxePs6Yw/FV8pdCxXNvSLts21Y3IZ0xqjX
         j6ra/qav5RvZm4/bZD3sE1eRptIQwKZ5f0AHI/ZC7AWz94+pyeBtLqSDZP2LgcbjTmlt
         wlXwjPUiGjRqGyBgZVOchVUR+tK33cgLgHdrDIWqqW00vXm+lxovZAUREXI7ftbbFb9J
         /8YQ==
X-Forwarded-Encrypted: i=1; AKwUvBw67SaJjGwb9Jap8f4uPfzt9gNaqH6rUnWbMFXUivPwOEG6CPF90PYZ3/bmSXafwa89EZq1xoSUj6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG2It43iKOJNSn73T9gXnCTtFJ9qNjU1XtF+hXgveieaAzG+k2
	CQtcPRxHu2p+Q4BizS1f8/S7ukvLXEvQ04vcVSZjCPQv/pybJF0WEYEPS7gICeVgXb+Ebc0LtjL
	7f0Bo5k8bWL/M8Pg2IGa7/X3/MyI3bDI3NN/r05V9ue+Vd0BNIbcFRWFFxWunTts=
X-Gm-Gg: AYBFou0mDL/ZdsJ5v4C7Kxbp5uySRd/vXh1bQftGmEkWKrUrd9jksSpmDHLHhBKwTJR
	91ZBL6km8R0kyf7ysuQ+KHG8CNVzJup9C2Zzj14EaFdRnKPnzZ07zGywsVxS6S1VBwiyDdfLRRH
	WwbeFQK8AvejIN66ZHzLEf5IJs7nL+XvIRj5ClCFjAosEs6h0Baetq2nsTtyOgISZMXBpswQhy5
	KyDo2I8pgE2QBlbB6n55bXiBVjeBT39rcUdKnXyeuvEAUd73FaGvFLahB/gK1/t2I3AO0Pk8J2e
	W6CfATgt+d7eFH8mCU+qtxP5DIB5aUxYap/uplB+vx6jJCWR+Jvn2VWydqRbnVtmkudKe97KqbS
	3xORG97Jn4O3sYIZHg7RFoVyTvmb6FbsJ9jCtNCda47WAfNUNhzxqem8wmwZLkNuyUzPiprUbjT
	MZFTMd2nX7Nq8U
X-Received: by 2002:a05:620a:1b86:b0:939:b099:d52f with SMTP id af79cd13be357-93f57fa0c2bmr964765085a.20.1792675707167;
        Thu, 22 Oct 2026 06:28:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1b86:b0:939:b099:d52f with SMTP id af79cd13be357-93f57fa0c2bmr964757285a.20.1792675706572;
        Thu, 22 Oct 2026 06:28:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:00 +0300
Subject: [PATCH v6 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
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
Message-Id: <20261022-hpd-irq-events-v6-5-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BIcHzWfG5902z+M7u42M0vyUpcn4l5zulhIbCsx30p0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9mw1u0Qd3LxnGa4XtQ4wMod6I5wyqNjSx7t
 HCKz5kq/4WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZgAKCRCLPIo+Aiko
 1VRBCACUkpGMPsojQ3/lvQ8NRygF2i1lg6dnHEaRu8EQVPRRVWIa53q0uMadWWOGZqz0KqyGsi4
 e3ui4UA02KecreOJWaWscbiD1o//uWQlzFOv/6TEua08RyqDy5I5/1sefYM3Fr3LRPl/qXmA1Dw
 qNsQZyPGy+bei7bgQKZoVGTa1qbtAAfLFqQy4lLrjdsma70Dtowl+OmBmq7NdNH1SsFzQUosJ7J
 77O4afqIMKLgcq03RDbuMOdMltfXZRflGuGUM1jRUYO4qMY/BkpberJF0/5UheSZaZQJ9ZMBVj8
 tIbuROk2cB61iFAkifJ9LQeJdEnnEOVv/pbf6WMLnnRXao5B
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ada0f7b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=8Y3P-FUPaDH5FmT9qQkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JK6IHu3yP69QguTt2h2vL-bW0Xgj36fg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX6g8MkVOURgsU
 4H2EgF4fpxOGgQhnf0hekre2EhMzocgLQibS6PsHY5xK29fRILhHqJVzEfP4xdVdgOL8jsE/B99
 gHl5Z8BGxXgkivHliuKcTFtYSLtLDHtxfUtDfaZFrAXdTb4cIfgjq9/LVZ3qz4VfEPzKaene1q1
 HRpHA15u5iImJr/vaktk7cfaZorPp6OxyKUoqINl/B5jlRViTA2CvlPbIejcurNN3ra0AsMdPgl
 Rc+p3DRK2KIvf+Oj2kUPjnxG5Ak8DXL7/vLoiLQ3osrW5iFn8uMlIKcA0sLr84/h3fE8LFo7zz9
 q0ys8LDaldqJfmqURQGV8CRnjDWZ3B0pVm4eFaISzQYiXvs9SqJBMTcxfbqASQwNXHoux5NZ7Wx
 HplXFEHuRqmLP+f/24AOypslb1ybDA==
X-Proofpoint-ORIG-GUID: JK6IHu3yP69QguTt2h2vL-bW0Xgj36fg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXyDID6C8J9NZq
 ZEF7vDoVzAb9HcaA2Kymud4eitkXR9PjP5ORS09oXOkNPQPJiAFQQzzf6GOGIWDPKFnB38Z2Qb6
 oqrgQKNLStW+7nfb1Eaa8aiJ1II70sI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053

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
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 2 files changed, 18 insertions(+), 6 deletions(-)

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

-- 
2.47.3

