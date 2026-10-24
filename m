Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802143;
	b=t08eph6503NDbV/TmcPg/eca0YuuI7kKZx4nZS1Ea7WimlAYcmlW/AilvnQDNewdY59A
	 e1QeorjaC52sunFRalyXn5GLfnL1KW7gzStkKWMVI2dSIP80ffW3kcECcekgXx/zFTPga
	 WOwqLc2S3X5KUpnkaHM6OqV8hJXq5kU6eh1v+1g8pGJm6RN5crwJm3kGCLcfvPK38s3XK
	 736pJFi9jMT8mBeN/QB0HPm0WVtpEKjRzrxhwmrHXCAdK9WselGrhRsi2te8A7z3Tl/Dr
	 W5v0b5zhwxCvO6eJ2Syl4IA+Hztq0FZzqJSLWP9emppXjOhPhGvwrFD78/PMDE0y2kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
	b=RjUXHaUQu7HVK5hmQ31U6sH0uRF2YPQF2i9Hc4kzMEL7ZTjGFvDcGoGkohmZN4hThHLH
	 J4wljLFobKvskRGSGFrscGd0TESoRhqzWqdWVAkUIxXyjX3XqCBF22dXb+OgpeI13yUn0
	 0YbaI0xqnBKslXMTsq7JyNryjn8ImmZVp2/0ogqbv0oWJHGbeHaeTtKfOSGCYfbPfesFT
	 ftbGcXub0XGZISBaHAz5g9s1tCtCut8UsumJ9MuCleZQS7cj60k9uOmPI536f8h7qzGzV
	 qZOuYprAXHyllFzfPXOhVWtusIfNie3pnN/6Mte5tkN4EK58YCar3oy0N/VhBFHx1hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTS1hJqX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CjZS/hr3";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D458606A320
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D458606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTS1hJqX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjZS/hr3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O0JcCk106056
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=; b=KTS1hJqX0JA+t+Xe
	BRgpxgNRIrxU1ob9bqwpQIrd7Heyp8U5wSPKQEwmhmPfxgaLe26ebU0vTRz8sAZF
	fA1fEDBwMfdQoYmPDhP/4ja/0AQDQasuKasWAnRBrulwRP4rRIzrn0P/6aKrMGKc
	fEIi3nbo4iNHHL3wOdNgEe/t2uEDJsTlBTruqoJqwHPuja2+luriq0F+hMsKOuUl
	ldem8LsDoRJfwY+I87BH20IRBUNyBd1/nmi0yQ8+3QIBXMoUTxy9GMLK7v8efp/D
	xyXriPRqx2ds5pteyrcBd2Hx2x4qA83hcpm+xJ/OxMBxgq1BTdEkcDMgEDq3L6yd
	85X00Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1p812m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:35:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso458501085a.0
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 17:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802141; x=1793406941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
        b=CjZS/hr3P/5r6DIZsO74APwzgV4jUwxphg2T1AB3wuR+GmTA0sahLvXAf1KA2o3nuv
         s5PfVjpdp463lTn7fJ4GhzMrZVqQpGZK9IJxyNtnvI6HhxpIeSiRuJppfOaph81/Foee
         /vx4MouhUGcVXbABys1Bz3GCj0ecbWy6x3pTZ9Hs0EYNc2cvgkx97yjQ9vmTCWkO+acy
         XjRnFJ87IZOiEhlb93EzYpxobvcOzaSA+EKMhqcM1R/fH9iavP9lWoY5AtcVORTWUrDC
         Bap2oUDJdkf+2kjzHnfUpHWEjg3mr7ArVcn69l3L0euz+rPc/GRYh13gqHX8zp/3B9sO
         wimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802141; x=1793406941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
        b=hl/M8UPuNdfLpHOyLP6iVXHg7hcBEJYxDAH1QplR1+sjHdJWGHjniTKlaw6scySdGj
         Q3YoGUSPJqFXA/nJlTleocnbHOk+Cuyw8iKZRKLbtFgz9TVPuQli1JZQENIRekbuwzdZ
         HBjA6bbtbb3UGuIIHuM8AM/6E3LA8gYiJxMmyiu0lSw1EMsSE/hYxIx5rHKNxQ9bqN6b
         EC/Ff2qirgl8zDatf8IJWBAzUsr9wpNQ7xKzAVTMYeOiv2N3QsWLnfuLGtPwwsBVTZE9
         3pgJlH2KLqPO46uPOwaOXGUbMUXWi2GDVfzOJYOEDbIXt6uHEgGUechIWr5A9qhkRxLI
         Ls/w==
X-Forwarded-Encrypted: i=1; AKwUvBz22dhbGHs3tOp4HOITfT1kEw/7VtgULxKmE6WivjhJyWykl+puYgOb9B+DpngPS8joMzGuuHJt3j8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJtN0CwjahCAk0HRwyrgCzlIN+iTk4yxTRYOZ6zDT4Gc2obioZ
	EEpzcxU7/7y3hpJ+mz3Px3GRu98AjX97X5cT/oAYCM+eiB/L8QgBXeMWghHfQBzaYLvUG/wimQB
	EbosLjmp1CdXUVNH+eTWQKznLwfjhcgB+0ZS6NivoDBnmOk0iHuuBitp5svh66oo=
X-Gm-Gg: AYBFou2BtRQZFv/YRhH0wgkeBQslWFI4JPSvutyoCz6K6V9lJ1WkqJiTavV1TYRCgZa
	oYM67lY4ng/UhnsAK4s9RX4FIhadH3OdbVvfPhf5oKDcyQKHP5EqECDAc8Btn/3YPfWQfvO8GSJ
	juDKSLeQMvesvHef+dxzFTzsv4/ujpYjXk4mHOT2YKVQk182C2qxgTWfIubp7RVvd6h2optn7Nn
	tagPgxPrUAzkqn5KPWCPzrIWE7ZGorDZq6t3Pac+x1BMhARiOObadizH5rgoUXAyp24pbZYjz0Y
	3ASvhbrAtlr14C2Cmg5BbvqJRlwHwBcepoeQ7drEZeuAmbdGAtpv6FAjNAsPreb+UQqtOP6PFt1
	gw4vbokfV2OSMSNdACwoGg0xxE+coPIMeyZ3zdExybNagOvpI2NCcodId2nNoByJt42dUD9Sp0v
	qGQ8fFsU6Z/Ubl
X-Received: by 2002:a05:620a:640e:b0:93f:4498:603a with SMTP id af79cd13be357-940ef9c6529mr87940485a.35.1792802141235;
        Fri, 23 Oct 2026 17:35:41 -0700 (PDT)
X-Received: by 2002:a05:620a:640e:b0:93f:4498:603a with SMTP id af79cd13be357-940ef9c6529mr87936385a.35.1792802140729;
        Fri, 23 Oct 2026 17:35:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:17 +0300
Subject: [PATCH v8 1/9] drm/connector: report out-of-band IRQ_HPD events
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
Message-Id: <20261024-hpd-irq-events-v8-1-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1OZLtxTLAZE9k4mLMRNIgX161lmxb4HdRk0
 KcJoRJVqumJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9TgAKCRCLPIo+Aiko
 1QfdCACr3U9nCjMaq7hUKcOJFW/lwp+QSFlq+SJzJzYEC0uF+7jmehgYxVVCZD0duk0mql8OUOX
 LEGEF21qooKYJ/ETJrLR8Ri8OqLRF5V6MD2geevo0idGhk8fqsh4rFCv2r9gTycRlFHIrA801XI
 1FViiDW0PEet36tSpbgNjsyvrBrRd4KGtMixDGBl+IWnsOHtjKqaF90KcXAfBzQAdMS4Y42bVDa
 ixdEW+I1ZmP0dGWunCuRWLcCMm3WJKiiS4plIQNIeTdoBvsXjNXQ5/jUu8GgxAf+gjCwpxWOzdf
 0gNslwwifuonvwbCN0OAdBOePzurGxT1myve6bhIuaze/Uta
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMCBTYWx0ZWRfX13mlq28pkIxK
 k5UVryJK9gGHGgTbzQ2SRcx31now4Y13iHXTrvr+i78LxLRhtLa21MKv01Gd1KNYt/qYmJaJ/jt
 Y0BdjqtVNkU6pYcwxL3YpuoyNiJEe48=
X-Proofpoint-GUID: dvp_9z_lmd2yN2si0e1EoprI8lyq6sby
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMCBTYWx0ZWRfX70wezG/XT4Qn
 9rv4Cg7Aviu20UdAFzzvK5UHRPtK+1NSnS5eJuFVmZji9oDjmr9DIEXyRXikzXisTnaDSpjLfSQ
 RqG5G4IpNMC6bwCTJRofdbOE8/Wjj2x/nm8uDGaHFC1u2a+BdIm9LwMPS+Jxx7vSaVh/Q5mZ9m7
 B/yJBSH2JNYkIH3mr0M35ms0O3081YqtO+0XaUjUrB6F2Es/C4XqX4+Yr/vkuNfsKuOs417v0eh
 atGOqbkIfyuSysfnSFUBgnQskQuFgIDobjyGBVwMEhCcUDZ9g9FSMLwWXpH+u4vcJGLnJkqV0vJ
 o/aRriCmMHQq7OH7gJJ9SWWM4yfjyK/7TEnq+jxn29MwjkWL3ACN4TV5acgyyBTLIaPzOSnWnWx
 Kf43iHPrwytG/Otv8Kmo3yL71yCpU99L7LNLJ942CtjKINIX+6CvSnbV3Nbze/hP4HLMI+S1aGv
 mkA+7jf4RpzIANWEbrg==
X-Proofpoint-ORIG-GUID: dvp_9z_lmd2yN2si0e1EoprI8lyq6sby
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6adbfd5d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=IejCAnqV6A546-KFDggA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240000

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

