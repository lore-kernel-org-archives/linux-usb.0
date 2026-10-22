Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675695;
	b=xpdv9jhPgyrMjJ3hjRPh7VDvWXWAa0OpUzjNWp7P9kkbg3jU+kjKs31NK9f8Rwri5qOC
	 p8RSuT8v0xavsXS2HXt1t+AypdP4BpopkUiENIAn8G8hZvFPvgbrk80y2bhbtK3l4rLNh
	 t4SPwaEqHme79g0nIEssCU4KaoV60oOwXgRrgYLBTdMvnWTf6/jmSqevX8eOahEzr6Ui+
	 QnrVb/E7Q2uVd2XBYtkeraAX2Y9+K/GSXCOsMvUCx1fEzrW2nfEmEvlGkdeD3/yq9D8l9
	 ROnZx+SgmxKIVVTNVGrQalYgFfdLJblPX4eo3isv/eaZoIyrHAXuRfxBhkGVqrDZRAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
	b=08PNTjzhZ9uR6ZtyFAiEfEzsFTM3pKmsfIb9YWsoK+w12x1qJx307a3ghCleICCzmn6y
	 Wh15+2YdZ1tfmIC0Vj/hZZUTMznTtGedWgmECycgwenFLKlBtFQI0l42EJ1dJxyT9BPb8
	 mLktuv/GKEg83G+5c9mNpeoUmmxS5Dj+DjNdI75lQbv74wQSvv1qxbKrDt+lrXQNyNpN4
	 Giu3WrYizMdSa0wAfSK3BQQoZKJ4C68iYJ151ZZum0K6RFDxtDxEny8LkenPb66QiK1V0
	 PJ9QCUI6gldDZaSWZEbLjQDklPP9lpaG1QaOqyh/sS7jI524a9Bq4Orp8n0w6eWj5yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dx5v7mYl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AdP22yz7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDEF606A335
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FDEF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dx5v7mYl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AdP22yz7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MD0wIb3898389
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=; b=Dx5v7mYlAORcKITC
	6y9KvrE7AnZpoGxuSQhsvp21uG/gDTAvDKH0bJsvKNUbicpQefEHGjvVfKuyPXYT
	0ZjlLiRcJrI1OZ9ZWFzTWgEfU+lXojFMDURQ+gs19MHg6jItXJer0l/5+WExE12P
	z40mILbs9ghjaxXckIxJ8uCSAkQsaYNOg7NsSV6KatszOpG7A4fRHVNx/OOrAfey
	p3+rYG/4fSu19gPe7ubSRxPZKBBoEyS9DP9UdHmT02k7VwaB91c1WPGmLjSWk37T
	sJ8ORKzr2XdLNC+dAjmVb+W3uMZ0bJ044F6a22PR7WqpQicmKZ//gvB/xssqZG1A
	vKFaDg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93auqhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179a2035a4so20713386d6.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675694; x=1793280494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
        b=AdP22yz7ZYXN+eMY0El6xRLL9VfE64nUV8K9bZRuTeY4WuglDSL58dUn2mRzrIERFD
         qJ56+Y43RISIoQLFQLkZnAl8LLFjwRceKq+TXgPGh8uM5sLqCy1kyLCpdq5G+BwU9UKk
         9gZa57Ph9XIEF6ZaRSHjCSIxU177zaoLlkND+51OZ1H8oaOtMxCyFzclwaKROQZ8JQ3X
         2xvvSnj/jQMqftg+hFWQ8O143ZmoAJMeewb4xz8xcGPXzVAjpU43yNtHmM/EnjAcabBU
         IRC+bxYYcaDibd8qhofK47CdqdF/DpgXI9EVPBWtjdWeku+VFfBUxWkA+89naNA/SwjD
         7IhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675694; x=1793280494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
        b=HOeLRfmVC3LKcm2kFGbHpZauRznGN4lO16hEoerBV81zKI1kNaVoSB8y9G47VWSTv8
         /TeOe2vpOeozeUFKJ6luEaUbaj15cGquB7ZdcnMQINWRJS6I6OvrJFFR+HHeiyiODvbk
         f2ykhqVea66ZH/BKqznY/jUSh3Ga/DoV4VTgicoOq4tLqk53p4+sFnB/83A0OpQ1YPsR
         iqcA6AtGz0IBcCvu/sEufSM6otBi63nQ024krTtl+rsUFYQ49E6Y1rpi4WtyD74LQqvp
         tCVkBkCnMiM2Wx+yAxXRXyo/NyCo30QAwG1+KJ5xiNiBSyaVu0d/rWujzHtPBzeSb9zr
         Topw==
X-Forwarded-Encrypted: i=1; AKwUvBwqemOPasoiHafFp4D5l6cwDMqG0ZCacLG6jzK3la0DH+Kkt3q+QQqAzkIfgQaYS9YEIJvWJNIuHKs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWV51Zg4mMKMM+th9CX8eFmCTxYsqZ4ZQ52QEoYIXRQjQHbO8A
	1r2yBngSKKxRNscCOi9rPhI1U0cEbGoaciL3Nf0K+5CX4XBpdEXbDA56Kn4YVbCkShapEmMsCXu
	57FgLlzfTrzjktSJg0PfKKOEXxo9kbe0MTE8Es1o5iYr7NO/LiQyKJspgmTmJ1rk=
X-Gm-Gg: AYBFou0wtqLxqWn79GWd/4ZMel0eJgluxY2rMs2t4jPjuyRZTJJI4cwfr9VxjBYfY2W
	0201nAjU6osx2dJNwzSY1C90hRbMI93KgsOFCyni6HMKr/pZiYY9X/J4Q7b0jxVpQcPokq/3eBx
	X3JiZD+i6M54qLNhzIISgGjukD+sl1ENxdQjD9dr7NRpKoca/IPCMQBKPVc111EwgRgyEo3gkY9
	iDOJvuXXfo7MD39TD1yXp+RnWyaOGuYEE+Xg28EtRv+SOHJ7KUWRjh2N0K316qFo5v+sGp9w43w
	aQZREDHtnGulVmrT0uVbRxbOUHgykZTFlW2tHvwAzbzzdS6gcxj9xKFR09xWAM7uUS5qNPZmoWL
	+uMYzfAiGWBS2QfFKnbNfv9ZBcorTjf5i3a1Re1vYDUyhLbDbdOWqGS2V2DRd6mVe1RZcNRDpt6
	qwol6unCqG5cN1
X-Received: by 2002:a05:620a:25c7:b0:93c:3863:ff7f with SMTP id af79cd13be357-93f6235c83dmr389696885a.0.1792675693408;
        Thu, 22 Oct 2026 06:28:13 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:93c:3863:ff7f with SMTP id af79cd13be357-93f6235c83dmr389689485a.0.1792675692727;
        Thu, 22 Oct 2026 06:28:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:27:56 +0300
Subject: [PATCH v6 1/9] drm/connector: report out-of-band IRQ_HPD events
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
Message-Id: <20261022-hpd-irq-events-v6-1-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=saKTuWGNmEwpJovWRzupqEzCaC/rm4ThXYLAzUmpGxA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9kny+ts34CTm9BWKo5GDTM24nf/7A2XV9WK
 1998Mqse1mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZAAKCRCLPIo+Aiko
 1XjoB/90leBj6+ttZ9ENUWIrRmh6Qul0u4JQ1rlyBSs+X6x+4HPszkbjNlaXcvRh6lBhFTHYr72
 o8+uKwCYsilq9KBl0pn3RokDSR/t6CGDv2nZBZgrWl+AOYzckNpUWr9OXO9PhFZ1uhFoGm2I8uP
 CTR/g/RitLbGdosAKt/bU89gBOe+gvLJQNytuk6/OcANQYchPYByUtrDEZnZA7W30RjMOQ7fNR2
 xYQe596N6+RCmX2JQkA41jO1+M4J1ZlH2MQHg3bnFgdFsdAn0tAJffID0Fdh7jw8W4S6kU3jtgg
 d71T8dsrsJCaPQ/lv+Nlc9z0MPTFnMi40V0bwAMn+09P124k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX6q1z93ex3HoU
 OEbAfefGFS2G0aEdZPraE2bbqivlhTsK4YwX2GzfGWr+EOKFnxPUrJli05jceOTp2QZnbYVfWBh
 WsvrWgzeqZTqafIui1flNKoRrSqnebFVUm7B1sqaJPUE324NWxBXPQhyY9ZeVJH2He6/CdoA8t2
 TeDqRVVC8NqBDaXBl5r9Mmg9zn37xd4LrulM3dlk7hMc9tUgZ2msc0Fq2ARsljnLuXAI9F9NweP
 JeSKsYyJEFF3yJqESInERua0BfUhrxcse1wlWQImtAEksYHDpmL954Sm9bV1JbSlgsSVF+wbtYx
 k42e3DEodt/4crG8varlTE2oEG+ns0rEk8VIHjOyqEP0098i9QmlPG8qGppXKtMNtTupUYn/7QQ
 2vD1m1s+E1vXT0kkzgz97sN4sCjmjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXzkW/QSZhXMQr
 5UPrqTMCB7Q+3NAqweVVmK8HGs1kk4GApe/mVCow/pwDRlxR9Q59w95+Ny5Xtjf8y6q6UZXeM14
 5Zt0idqcOkV3cHQO4PbPATvoVKOJZA8=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ada0f6e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=IejCAnqV6A546-KFDggA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: OD2kRhd1vW9l8OjV5v4ywgdCpalrh2cX
X-Proofpoint-ORIG-GUID: OD2kRhd1vW9l8OjV5v4ywgdCpalrh2cX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610220053

The DisplayPort standard defines a special kind of events called IRQ.
These events are used to notify DP Source about the events on the Sink
side. It is extremely important for DP MST handling, where the MST
events are reported through this IRQ.

In case of the USB-C DP AltMode there is no actual HPD pulse, but the
events are reported through the bits in the AltMode VDOs.

Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
and extend its interface to report IRQ events to the DisplayPort Sink
drivers.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c          | 20 ++++++++++++--------
 drivers/usb/typec/altmodes/displayport.c | 25 ++++++++++++++++---------
 include/drm/drm_connector.h              | 21 +++++++++++++++++++--
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 893716a9e489..e3c8181df6bd 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3821,20 +3821,24 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 }
 
 /**
- * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
+ * drm_connector_dp_oob_status - Report out-of-band hotplug event to DisplayPort connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @event: additional event reported by the sink without changing the HPD state
+ * (or in addition to such a change).
  *
- * On some hardware a hotplug event notification may come from outside the display
- * driver / device. An example of this is some USB Type-C setups where the hardware
- * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
- * status bit to the GPU's DP HPD pin.
+ * In some cases when DisplayPort signals are being routed through the USB
+ * Type-C port the hotplug event notifications come from outside of the display
+ * driver / device. In this case hardware muxes the DisplayPort data and
+ * AUX-lines but does not pass the altmode HPD status bit to the GPU's DP HPD
+ * pin.
  *
  * This function can be used to report these out-of-band events after obtaining
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector;
 
@@ -3847,7 +3851,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 
 	drm_connector_put(connector);
 }
-EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
+EXPORT_SYMBOL(drm_connector_dp_oob_status);
 
 /**
  * drm_connector_get_color_format - Return connector color format of @conn_state
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 51c92dd887ab..2106074417d6 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -187,9 +187,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 				dp->pending_irq_hpd = true;
 		}
 	} else {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    hpd ? connector_status_connected :
+						  connector_status_disconnected,
+					    (hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
+							       DRM_CONNECTOR_NO_EXTRA_STATUS);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -211,8 +213,11 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 * configuration is complete to signal HPD.
 	 */
 	if (dp->pending_hpd) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    connector_status_connected,
+						dp->pending_irq_hpd ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -396,8 +401,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.status = 0;
 			dp->data.conf = 0;
 			if (dp->hpd) {
-				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+				drm_connector_dp_oob_status(dp->connector_fwnode,
+							    connector_status_disconnected,
+							    DRM_CONNECTOR_NO_EXTRA_STATUS);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -844,8 +850,9 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	typec_altmode_put_plug(dp->plug_prime);
 
 	if (dp->connector_fwnode) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    connector_status_disconnected,
+					    DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2ee7c59329aa..4f65c97a89ae 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -92,6 +92,22 @@ enum drm_connector_status {
 	connector_status_unknown = 3,
 };
 
+/**
+ * enum drm_connector_dp_event - additional events sent by the sink /
+ * display together or in replacement of the HPD status changes.
+ */
+enum drm_connector_dp_event {
+	/**
+	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
+	 */
+	DRM_CONNECTOR_NO_EXTRA_STATUS,
+	/**
+	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
+	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
+	 */
+	DRM_CONNECTOR_DP_IRQ_HPD,
+};
+
 /**
  * enum drm_connector_registration_state - userspace registration status for
  * a &drm_connector
@@ -2848,8 +2864,9 @@ drm_connector_hdmi_scrambler_supported(const struct drm_connector *connector)
 		connector->hdmi.funcs->supported_hdmi_ver >= HDMI_VERSION_2_0;
 }
 
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
 enum drm_connector_color_format
 drm_connector_get_color_format(const struct drm_connector_state *conn_state);
 const char *drm_get_connector_type_name(unsigned int connector_type);

-- 
2.47.3

