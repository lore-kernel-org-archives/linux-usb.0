Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFCF64A8C
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868017; cv=none; b=mO8A2KBkl1XODnE44/rlLC8RsHxfCHM6wxXCIHy94ttOBsXKHPJIE+js86nQx2BUzMcdOs1yYqVLokiY84IfmNvAzvrhuE6oaxOiuB4ew27V+FXCzJuLbyV5JVUJVNz+AkumTBgL1W77V7LSEAfc4GUTHqGmf9Xkv3HygNHazV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868017; c=relaxed/simple;
	bh=RMohNnP615sOpE6ZWKg1trb/KrvgErHGs2zP2ZkYPtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D2rxEoVGfHErObwTa3svkSEzlq920f4d+vUuk8zn1q4qZ5jYN+5OKiUaHQdqWg2VAOtwh0Od9wf8ZvGK50mT2gAjtpF9CScYCmejUDTR06DfT9ca+ONY8CAA68LlZ7pacJusw8Dl0qQWiFWO0tJafnT4lwjlasEFv5xq7jC+t8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ed2MZhcP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfpXRdol; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ed2MZhcP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfpXRdol"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Fixo3909919
	for <linux-usb@vger.kernel.org>; Sun, 7 Jun 2026 21:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=; b=ed2MZhcPR3ZJGhm5
	+YO16MmNxuN+dCsrIyoX0dbNtKYdE+mXIeUFaI5m4tL/8sC4JDvTHIF+iI/ZKfTy
	5tuPR0kjUDFAN4M/bj01EFAbZmD1vXgW33IHtqdLaKD8+Og9HFpTiEPk6p2rhC3e
	k2QsiU8LYLCa3Uh52T1+5W09iLZykr+H/ckInlthHNkXhnAD7TMu95/MsU7TO+2H
	ka6I5kIsqe4BprbPkA3vl05DmALsf5IyHe1zEyVd6pK1cyEgQY1P1P2Obs57PNDE
	f0NkV/UYxpwp29Ibe4Qt7TgTH/q1wyqQb7nmlqPwWrefKljAe2zwI+rDAhy4Fzcl
	VjPJvg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf5097-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 21:33:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51775f7b2afso88939201cf.1
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868014; x=1781472814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=;
        b=OfpXRdolAC9WJsUqCXaF0Lw/fTzqZQ6NnIqtI0JpMkvfeemEOCnMHwVh4msFK5N3Cg
         7pcaZY4IxxYuiM0j4A6PE3uce+/ze6QPriBMb6wrxkaY+UUjAjgnbH9I8IPvWyfz6s/W
         olKC1u5tes6bqmTNlDEShJyVq+hzaV9k5mHT03H3OKNgzCwYbeEvTav1ImZfbgqmquCl
         8r9Q5YHLIsZjqZ40wOldbIm60zrWnJ8E2vLQIU5vyAgaWM4Er2UOcwHic1UjfsfvAyxt
         7krpojNC7ZbdbecU+TiX2oNFKVMO5S2UlTszvmuGvfV38uAX2FfTaOCM66FnysOhSSAX
         VuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868014; x=1781472814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=;
        b=jqa5+V0n5SlLTx+ozLAZGKK9HXs9+wt3/JVprwKj3DrcVMOwO4Dz3IW4Wky1PDfFrd
         k0bfvR1xBCjH6hTk58fCo1latJjm4LgfWiGb8qcgs3CHV3sB4NkDLGYT4aa8tTpyc7aL
         ajlmMKAfHq84BpsA+OVtA3c2k4wumPc8mSf/amCbCdNhRAzyaR/2ZOMuTHAcvTpTotIt
         veQnET+beFwHXj9wY3pZNSwIgWyfTVvmU0iHQNN73LvV63YTzgyifjRjKnEqfzAeV68q
         Xhu/zWpJHfastfUlohEq6uznxDkkWK5zQ2ddR/k3RWLJW4pioXZIM6Pz0uxYDvFGHmXs
         D/gQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uZ0TbXJUnjHav7oA7ZOMzvIUF9OJSKWERImMUvpRCiZWGh44wU86yK2pP7hp0II3yJfNW+YKdzB0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycu4Wj3JtlLRDsh9nYMyq5eh1twUSmFjev/fYokl7inxEeZhXI
	EkrlDhmbJbMlcBe9gBoZpZ/dXNOjuW8Q25GA59qj49C1fps/Hcy/fTiSfbEv3PQus5mfxq6l4dJ
	x62A+Mv7SyweKgDS33vW6hNGBJDQTkYvR3GMQ22aj1knVxmD5j9ljnCf3YbZf344=
X-Gm-Gg: Acq92OGBZK9F4+zbr2H4nY/9uokBdDIu0U5JqyhthwrtZaFm1wY5UoI1LQDR+ED3N/B
	0D++nH/kmlYVhvXg2qgApLyqTlzPxuGonog0W2wmSIKPATlneCE3DhtyOW2rwSvVLdkeL4Fqzuw
	4+TIqKziAXIzLy5fPB2yoDdQ7WLI6R6g3zpvpvuUjH+I7HqGWdgiFtuJUioCWHCG5Oas1H/Eq9r
	OMSqxOSQVfpFc0AG7ilFbCGNSJYoY9rXVDVtVBEkM1BNqsk+i8Q0JFn4o7ZLusoo4g5qwloPsIm
	UJpFVoJ/Gqp2sEDobOvXO51t2sca6bT93MepQLi1yXSyUzmK205srV6/RWkE4E+s3H12qZ1aw9G
	xJGxD/f+1P1KxmB0qivyLIDPlLUqJRegXj2pTWIGfH3lAve97J3Y4SOrCK2MnUwLnLYrCwVitF5
	XMZaEj4WzU++/RKUf3hM8XbF3IyNfVKeuhsx7kA10zxjeTXw==
X-Received: by 2002:ac8:5d8d:0:b0:517:5879:1e2f with SMTP id d75a77b69052e-517987df585mr128694831cf.27.1780868014044;
        Sun, 07 Jun 2026 14:33:34 -0700 (PDT)
X-Received: by 2002:ac8:5d8d:0:b0:517:5879:1e2f with SMTP id d75a77b69052e-517987df585mr128694481cf.27.1780868013602;
        Sun, 07 Jun 2026 14:33:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:08 +0300
Subject: [PATCH v4 7/8] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-7-30b62b335487@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RMohNnP615sOpE6ZWKg1trb/KrvgErHGs2zP2ZkYPtM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQI5tl/0XcA3tgWGBDfparpRR7p6oX7Tvus
 qwjrqzb+oOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1XWXCACmNj3CHr4O+YRbKUG+T11qRjlO3v5XH4k0gj9GScSSKB/i++PNRfIVaB3JOvEoD/AYHrm
 YFUwGw2fBFT2Jv2Fhyilg176SDLOp8RsHVt0LQrKTd3iVzD84bkfPw5YQRsnoC0q2NNOeteuu4P
 oNZgIAB39IsrY1AUoXDu87QaI9/TPgg/T4uL/reYnY2d84fLwma0S1+Jh2/lbnZ1SDxBsBxpeSE
 e6BfBudjneZilPPKvQDNmThuUz1M8q6khvqmx+48G+tdedZN45pveTW7QE0GhFJ4QlRiFxRstqG
 Gz/WYDvc1HTnwPXv2iuBiwsSXHMYqAaiEHZoR0/q/qODETsN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a25e3ae cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: duNXKKIwb4sxsFEi1teSfrtQYzA31siS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfXzAHfrXMnBnP8
 fGVsWkek/FIQIgwKpAA7WdrDb/RmSD32yfxcJTvcpm0zx5se0GCJUiUwImKI6i8nZP00KWigjSU
 LKAswtC+6pWxW4WQe4HcQXkEeE07DMeg0dY9VhMvCgufBAFsCscQXbVpg/VdF07TUfqtsGb/ShF
 z/njaxW50lr7Zuc9d1n7JlYQNnmLGL0UqhXmz3YzikW0POG1C82d5q5IEECC2A+3N/P1mRjOOwg
 Bl6BV2XKqaYWTwOmjkJ4t/3PX2iLVUau6jYlPuH8UnSo8V9YGhPxu4THw1t3+lQKnv5jLAH3QoM
 NYLUXW+5xiIZ1HML2rtwshOoVTMhntTW9VEoEyhcP/Tnf0kEgFkjHVH1JFUbwGtljHKESLzyoF4
 GaegC4YO1xc8bVovakLVGdiyoi8fa5fE7vjzN0TB1JtETdHikqmLiYgPsUPMlgB4ZgLcX1nFsu9
 j1bLGyafoy2yfvm1Rnw==
X-Proofpoint-GUID: duNXKKIwb4sxsFEi1teSfrtQYzA31siS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..946eb20b8f83 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3

