Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ABB2ED872
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 21:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868013; cv=none; b=akJCnLFM/0RWuPOpdNjpitjPkwsi+i9aibIySFL/o3W1jkb3kBzGVd63SPTlRQ04KBRS6+gu8/0nPpmY1QTgtNJkT3RGA//EtcJoP4rVb4CP07vDHGm1L/Vb89796bhZoUg8Z62uVfeG30MWR/cnbf/6AsB2F36D8bzylo8DjVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868013; c=relaxed/simple;
	bh=QU1zz0yugX4tikhrrDvaSfvgadApD+nFc1XuyjM+i64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oO8fF3Jcodb5UezvyAgBJot60OzmvVllqmYPvorHgC47njLE2Iz+lyzLi66nIYaINiK1v7rp1OFOn8Gmj42Pr1Pk7jWSVoMOM2FzGRoSyhjKv9z27qQxCJzHfl2acDBX+G3eR+ElAylgwNbXvxYmrr3QueyktgT299fYNfYm/Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hn5CUgbi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXGTdhG1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hn5CUgbi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXGTdhG1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EjqFP441200
	for <linux-usb@vger.kernel.org>; Sun, 7 Jun 2026 21:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzWM1TZRG4fIsuvgrGBJ02mMzsQCiM1GfHgBBstXKAk=; b=hn5CUgbiAJuLHwDU
	XtFLBR9mpaeAH1nUby7GCEGjmehu4jV6xB59t/z094qPjswb9dx48zPy/HY6rVMW
	0Vml1KTght2Z/yv3jPYj97Mp2AiYhM0S1A1b5TbxkYEbvt52K/V9RlenZMZr5nQi
	R8l5kPczHLiQONmvQP1zKltG46qXolNQAkRCHYIacaeNO9p8//I8cHq70nlaPhqd
	nVGOLO/27EgaoQsTCStJQhIue2tZjfnt87dJ/LOorZg0HK69vQJdNpuUs79Ct3lf
	GHaadiTeIMTosYTqmCassoj+XIiTQ1+gFJliDbhm/rVhREHzCcPnDuFPk/e+XPxn
	2ICmag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1cq1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 21:33:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5175aa1a54bso83213151cf.1
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 14:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868011; x=1781472811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzWM1TZRG4fIsuvgrGBJ02mMzsQCiM1GfHgBBstXKAk=;
        b=IXGTdhG1732s7MNX0C9ekV5JT0fFWX4xdpLt61FPd1ma5tv+s2XrFWcJ3Jomsv1vkF
         DZ3Dg5Eku/FBF2FoD0Le84RKZ/a2Hlz9enMtF6MDMNk44zPRMZshMq2vXi/uUrNs6RNG
         RfUlBOzfWlVVGZ+1FE+XRTRnQzuPhpIednvgqebnSXAtgkNSAOwq7AgTtGyvNQXrM5HJ
         g75K2LQSGJrR2BO7ClusKrvvKMiNOJcPypp7ZWYr27k1u/euFDgkU6xu2f+iq8vLgkCI
         zPnXkmH3IXeliWqCO3Wil+s/GMsdE2s5U5z/kZ+OFUaxfglP9K6HwS7ddKYmKIa5N5MC
         ouyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868011; x=1781472811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzWM1TZRG4fIsuvgrGBJ02mMzsQCiM1GfHgBBstXKAk=;
        b=BJfovguW2pP7KPrZffRdZ28HLA1kc/l6QYtMa9UsSrlqvn7Iflh8Vt+hMyTq3aqge2
         eagihas5WpxlKuhhrvPc36laOWC7hfNo5zNYnn0alj2WGW2F/AUAYuJgANdCSW4lCgqH
         QG5RRGXzOVLC6uVeVvBhhS1RH2mP9uvG7IZn/cRaorkX/YtVbW5BOtvuemPMODgAmPu0
         XrBfVxkhGr2jn/uxY+/s8X6+TJS1a2j+bZi81UbJ1gC4DBfOqO93je/OFyDm6bLJPZb4
         M7riNxXwTDaIvv7dUKBDDCWNHqrlwI3dtCqjtl8CwBK/MnczqVZWyO8sPR/+y2XPNxbr
         47GQ==
X-Forwarded-Encrypted: i=1; AFNElJ+azbCowHNG7rgkgQ1iq6r3Y2vMV4EQUKV76A9iJMQC0KvPe4haePOqtiokky0AHK7mZeNRGbfx+qY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaHOnv2zUI6aISo3ZQf9ubnDgxPTbY5XIskyYUb0UQ02+qyzMN
	qkpNwKEfAZsLGsM5G8n+3xTv71UgeiumiCtxoz0R/6+MrFS3CZLG77ITSOMIXMZUyfW/pFq2B4D
	axWJXVYTXS+AbhUtMkOPA1vYP5K0Z45kH2I0+I/2cQugRc+zmZvPYBNiTD3KfGQQ=
X-Gm-Gg: Acq92OFmD63WkS3TFJ7BWfru4KJP35ZokFIwOH/25rkZVDQW36OhbshkhKzVzr9tVYU
	1b25QRgNuVs/r0FHNxEvifQKta7ElzVuRsnhY/9IyKkJyJ4Pvye0wv5wv9W7h7D5V1P82EKVudx
	6RIk0YM6E8+gfUBQOk+ZCX4NwmGMVMg2Ow7zzttN8Eu3YDLCe7i3wp1uhDWS/8A6gI/ICKQAd8F
	6tlbnDvjTNVRB6ZWXWlNgbxy5+FcArwsaZR8Mzw87fAQX3hZ0Gda5vaE3vDirhLn+ORF20oXAqi
	6hT/yjOGwAYCxS5aT93fHrskmZkxMjlK0ca5wpab4cN6mO6UY0HaFWrlw5VNJaellcoKbnYMz3y
	8RdVgj+GXCNH3RBPVowmKip5jbL2aieXR25qle0ltTh1SBP68dMeiRiJEFgjbuysVYXhI3heKkH
	jdUrTA0vfB+y0ge6KZMD3sG4MLlqR2bUI+GEHrr4x8HnFbeg==
X-Received: by 2002:a05:622a:190e:b0:517:7b6c:4459 with SMTP id d75a77b69052e-51795b8652fmr197935911cf.24.1780868010802;
        Sun, 07 Jun 2026 14:33:30 -0700 (PDT)
X-Received: by 2002:a05:622a:190e:b0:517:7b6c:4459 with SMTP id d75a77b69052e-51795b8652fmr197935631cf.24.1780868010370;
        Sun, 07 Jun 2026 14:33:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:07 +0300
Subject: [PATCH v4 6/8] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-6-30b62b335487@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QU1zz0yugX4tikhrrDvaSfvgadApD+nFc1XuyjM+i64=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQkeAHjmwgf4TWmB+cq7J3apXFq4vK/4Y/t
 1PsK+1kRv+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1ViTB/9NfpVnjn43UETfojgpSwReE0dmwB3DsDHqHJqEU8ojNNa4kPpaiCJU81lltCqj5XgErdr
 rCaglIXukNpl6RYq2cnOGXZDBFtEgA1NT4vKlAyKuMYlmZz0pWVp+FHDFuLRJ8tRA9L8J190qw8
 BO+hYy1pXLBiA/M32oxz8e8bzTDXNSD3K8dG6Y4JaoJige6+C+SFHd0d05ZNIvHff21WqKgWR8K
 Jhgy/Dnewo698WJFRxsEqUx6F3RzyX08UbeMeFsVfwktU0USS/tH60kTsuxsPpyB5yREqjDzwQ4
 m7VCLAA3vhAoRAt4dZxK3oKdlRp2MTrv7zcL8DXzOeRsT3eX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX7j5eglk/n08L
 sr09VvOBRyh1dVNCRWN4G1T5Z1kvADgCo0+WsZimF4um8W9uCNB91ZC9vMJsfZ6y+YFcKzhzTvU
 UOONtiezSn1Xt6luS+AY9H84ocYmYkazfsVoWhPO7zuFdACszSzcy+xbwK4lABPoubhaUgZ25bq
 sob2JSRpcNqnYABOpRUdlO2c82t92iFWQRvdsWlvCv+6gX62hzgHgzyJE3Dszjq90azmsdSg93x
 /Ld01SrWOdXOresTZmggX5TkywMKiIRDCdO9h61zIbI0cY2epQwWP+e2tu/AnV5uqlvIbJ896sG
 GLb8t0gMr+Nflh39QGVGQIruNKto89w5oHQ+wTmRX+uxE+GsrLNo3AKRPEVYY0OVvOr6s01rHAp
 PI8ncuO05Rbh0ksOP5ameBW2pqBcNqWqfZnw7TP0ofxpm5XTFYCPTZ2xoT2LWW5KSJB3PE+h1nT
 9COqW6EieAMKX6DZkQw==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a25e3ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=kFJzCQJ8v3RGWcIHJrMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: RrujzOcmW6rOVQCW-mzZJyfWSY7zA_bz
X-Proofpoint-GUID: RrujzOcmW6rOVQCW-mzZJyfWSY7zA_bz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070217

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c0f6a8ff9b99..743d8fa40dc6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1533,11 +1533,12 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		   msm_dp_display->connector_type, hpd_link_status, status);
 
 	if (status == connector_status_connected) {
-		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    extra_status == DRM_CONNECTOR_DP_IRQ_HPD) {
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

