Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802158;
	b=3tGUQP+2M3jWUHgl3qAQUbqq16I3wLQH+f/pAxs8Rupl+mEl1SIkXWOy4yK/v3HbZZ2J
	 iyUY38dbmD7apEwn+4zniudPuonwuNEEnl7FoUNnns7ExZWgEeZBnHSkJYKPe/jU7oYGz
	 onSA7OCSSg9/YteK5rp6CbMTEz/MZMgxmIpkwRjESojXcbreJzsIEjBNqm6S8niYzf2dL
	 +I5r8JVMAyrjOJ6kLKncdk/rMjSQU3wdckFfgSBOwWcoCpGgu9Fb569rC5t5LQmIG8s2E
	 V7CyTi3Q/GHdbbiw5B4hIwXjGgRuR8gFgAyOyIDk1Zrh38LuRKgTDVX4/g1zdK3/Q7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802158;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jRF8F+zl8QID4mvoOXqchRYp/K1eGPwm8NSxwbyBHZE=;
	b=b1kB+4pACq9xZmF1XXCw6gfnGnq2HW1cOv/QTGXpegB+t9is2WENA9eJzoaouLOTC5vD
	 X113YJ57zVkKRxyTiYh4vy9qB8C0Fdg2If7ZZSx0OiiVZHdU/TTw0YRujs5MiTP9eVhoN
	 tznHzqPQXZMnG0owfIEuQXVe0oNrV8F72XoneTWsAFvmA6de9cPcwFnyRCesuQXf5arsR
	 zV1P1SHPHeWTUXgbXoVZ/9A/6Az2lFANk/eEYaS4JR1+gRYyxH6+iX2gsN4qB3+YCt2Jz
	 Yp4jbvE+/4acBZhjUB8An6B0ADOfaoGIlu6CVeY9QP35GYUTDx9W9b8IA0+SsZup//Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KxFtGX2t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jdx2WbB5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8467C606A326
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8467C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KxFtGX2t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jdx2WbB5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLuvf13115343
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRF8F+zl8QID4mvoOXqchRYp/K1eGPwm8NSxwbyBHZE=; b=KxFtGX2txNqcAgvt
	1G8J7te40dcLokdUz2l4aGylFpgWC6H+zgi4zNq59N58wsOY6ZBDcpa3224WozqE
	pLK3pirOwO+tVyQyu1yIYXj1Moo7i3sXx0guc4Ow0KzKEIKTpF0Z2M7XBVrmKzLD
	EExzQAPK2eYzhnmoK/OKhCO/iGjgiK+b6CyzFWKO4dkViza2euTtjdv7fouja2A1
	DWb35mGdYT0mC1ZzPVG/1cIZdPimAHjKVh/g71NSvLEPOhLde/EheYGTpsaeGM0W
	uoWz0FdUQGfICahavsboKykM6fu5mEAkVvVNcTuLKDL90ncZjEbo9dxzd6xjp2ad
	49UJmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrt918v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:35:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso364931185a.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 17:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802156; x=1793406956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRF8F+zl8QID4mvoOXqchRYp/K1eGPwm8NSxwbyBHZE=;
        b=Jdx2WbB5LlwaUQMYohfFD3Jg+tS5l/BPjC+Eaul3aqYR/g32/cho3dbuI93tXw09uM
         SIEUbM8QypRp8AzlvnC30GXvaFANgMs0NPD3jHYg8zseigr3m6Fikfy1UL3ujr0cg8MV
         8ows2149yBnIkx2bwrbfIhAHlmiQ8RL3XMgaN4RD9M17eMPg3UtvWmi0eH70dgUkfSvA
         Atr0XSz9D/9q/ZkYHwftBsbT9p/JulSnKxODwNXd6WRhtT/UOuPqa8ymF7GOI3VyMSWg
         b9AoO90w2BG+D/9PrWxndCpO8hVFrNZczPiOIIP7UOfnJzOhLMYr6zeB9juK4rhRp4pZ
         Z+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802156; x=1793406956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRF8F+zl8QID4mvoOXqchRYp/K1eGPwm8NSxwbyBHZE=;
        b=hcOmTYXRZN8MdGgkdf27BaupqCs51qNW01ncRCPVk94Qmp8zybspzvUvH8G908XLpX
         vBPsZXcWz52epI4kA6MBjfSF+HRXcqgKR7XPZgtXOTEpCkpWTz92zQPq8WLs4wosynug
         czGUOrmHJCRPyTajP5eze3NgBS7C8pjemPILHVCe+z+47vC8RrPb9geM2u+g+hsLiXgp
         xQH9BWU+xaBo/LseK/cUw416sHjApBFLqK4vEsVE2uVGTnh2gTnzlU4fv/xCSET3Gzc4
         nkTE21r+IGXfz/vtljHgd2URVFDAX4ykAM/rzGcYF1RSEGlPI9X7bCZpWqO49m5cViLm
         SQOA==
X-Forwarded-Encrypted: i=1; AKwUvBxfNVsr9JGN69qYdMnGmajbTQKJJTzuEVy+UMx+KKY0xBrXCY2ZmMgrNwOPuIoYGCtJyOdV+yalLpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw5zckH7LRd4dbbNOVwe2WI4CARgJibGpumZJA9hQn3Av8E49u
	df8fKMretJ9ZqCksGdPYD2s6/ORP0fYSIVFKNSJDstd08tUfrmm0st+V2eF5FW5J2pL0hHqQK/W
	26LDCC2S0y+Lo4fW6WYIJ4HI7iQRmwD1vQvrsV6H5FANIhzTY2wH1OJw1BNa1cVQ=
X-Gm-Gg: AYBFou3PRmf47bbBIWULrlWzqXfOvyjYvXHDVPRPW8f0KnYja4mEjqBNqCF65ts0fQ9
	O90Ux3ONFCn1xcGaiKTWB3NEllmdMuqyfycUzR/gQYn+qHF4XxZTUTJk3/Ijo5GxJAs/zOY/Wlu
	6+QHIJqJMB3YPzOmtbIcnt0pSyOBxD4NuP9iKx9KMrXYAEBsFynoHc5opHoRBhlq4iNhJRjBP7n
	MesnoTloZIwUELi9Lu2933N0WW59L32NEM7usmdZlM9ghS3lJfd1WtLQh678ovc9XbtuOfIA+nM
	NIRYp+asTWjv5v9LZawq3mOqEVGRQdqMsWrf02O0JGA5hz8dWNZs64eNmZrFcHGF7ZKybt76yhi
	Ucc98w1vOJfIuSsAJ2lMIxE8CAJ3fdjsfVRa8YIqyIsvu3+E0pYJvtMQEFB5ykZUPNGOQimR/Wd
	IRK6cRYuh3EKqI
X-Received: by 2002:a05:620a:4556:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-940ef9a7ceemr108250585a.64.1792802155526;
        Fri, 23 Oct 2026 17:35:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4556:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-940ef9a7ceemr108248285a.64.1792802155059;
        Fri, 23 Oct 2026 17:35:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:20 +0300
Subject: [PATCH v8 4/9] drm/bridge: pass extra events to the HPD callback
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
Message-Id: <20261024-hpd-irq-events-v8-4-6ee949e7a384@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7777;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TPnvnv7OKu+5AobeMrUefT0VwzBWz9C4rL+GJ1Fgj3I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1QTA1GoNRKRIDZ+eKJO7nQL4+WziHskbhmB
 ZyxtOGps4iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UAAKCRCLPIo+Aiko
 1RDFB/oD6bSL6OUG9X5TkiAe15ip5MWUFVLEw+FNoNsqT6gI5K1bULm5YhBekLTQswcesqmdacw
 JSZMMvtxtyQrzgMNAOIhwtz8DoTe+YkhE6BF0fiMKY79L1KB2/JMkVuTOAEAJ/6v0LC6sxlOyw7
 6Rl9B6ahLnWNtPZA2PAh5kQLWCCLARoqPq1j/8hrD62DumHAR8SY5Ss1FgqUss+HB23YUy96Djz
 T/PmTj67jtzA/fjl+otthz4T+z5uL0xr3SfBmqkkQJaWr99xUgPz62FYXkTZrErw201SB+PmgYH
 oqqdp/YPyocpaWOJxT8n511CTvNFWWskEgoRIQpWWb3njGQ+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX0RAdwQvVWyCp
 f2K3JJLNs6tsSmTVdU+VMgkXdjWJ44+waWv5j9G/eJilYeoiltITMBwXt1nIn/7cojGHGGqmKm7
 UpTh+9s+NV41qc85jG0Zn4ZILd1XC/Q=
X-Proofpoint-ORIG-GUID: UuWpTbN-vyqtw8beKGfKOFs5__chXa8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX97HqL1cO0D7m
 ODvc7jO3DT0xqc52W3PNK40H1ggXW9hrd3s9FRnBhtSPSjQfHYQgoi0mEHPApJixpdIKamRGc12
 xK6tQc3G3KOi2e3pZUgRvX97+cPkEf6yFqb2roc5b0+Jw+ryw5xstb4L9cCHkPftYzogvKF/cWj
 6N/zB9uBprvNlgArRoKqIh2CqaqXLdKsmruJB+BFPRRpqhnQOHB9cM/16HAjRjoFvDLlACrkmgZ
 n2RSL8RNcPU4daNHmQRp0NzG6bunSNtx9zT4eoY9yfy86wyM20yuApzbh5JwhSqM4no3NtWnMiR
 GPnOt4Yw6AqfaszuvMA8G2G3IFYw2sCUvbsVfxju0rK48DCy4PUd3rnnZcmC9CctZOVH4cNo72D
 IWhoXNUg4Js9RQd6NS+magir084PxY1pHx09HS6g4xq2LPkD88Lpiv02VPI35h7GlYoi1yP8nZW
 MnM46Rl8hgqtMicyfHw==
X-Authority-Analysis: v=2.4 cv=E7lYNqdl c=1 sm=1 tr=0 ts=6adbfd6c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=UL_CVLMTin8KOx8HHrUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: UuWpTbN-vyqtw8beKGfKOFs5__chXa8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240001

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c |  5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++--------
 include/drm/drm_bridge.h                       | 28 ++++++++++++++++++++++----
 6 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 4bc64b2885f7..deb5d510a616 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -258,7 +258,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
+			     enum drm_connector_dp_event event)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index e347d04b7b2d..82f5232b4205 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -506,7 +506,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 629ff7095e87..03dbb449e0a7 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
+				enum drm_connector_dp_event event)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 1b0a1a00d8eb..4ade63306653 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -172,9 +172,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+	drm_bridge_connector_handle_hpd(cb_data, status, event);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e7f9e6d58927..2bc54131e58b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1553,7 +1553,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1611,25 +1612,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
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
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, event);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6382ef5f1ea2..c839a6993a83 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1208,7 +1208,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_dp_event event);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1517,11 +1518,30 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
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
 
 void drm_bridge_debugfs_params(struct dentry *root);
 void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);

-- 
2.47.3

