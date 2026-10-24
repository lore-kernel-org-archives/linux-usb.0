Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802173;
	b=TCsTFzhuRvYHs2Kh0m81ZaDyB3zTKGDj1Dg7EdV+dSue8JFO+wGUIrPU0VxeqXwv28DD
	 zi69mEnCx+VUZJ90jAdzngQfPQCdUpC8tIIDjabaWK115rVlwvv5NlDnzhk5XaWNdduYV
	 YR3s1V/IvSVYmxk4FLILxhqo0pzEFhhDtT3oPJLDT07/0JWo8ZWSutycf6hI1jlsGJcSy
	 WAsZHumC87YOI9DDJZGJPgjiXEGB8zyUIr+k/refIYC0dOqj1XCopWvdb7/QkCHvE4qn9
	 8b20l0RL20ZcPTiiDQSW3Lu9noyWk4rnydKjEt9p+dVguq4gUlRjTg6E4umVQXC5BQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
	b=VIk6yI/q4kN/bQzgFn04a4P3sjyrv3tewi3INfUJorbLOxTzLpB5chDYS9k2v0nYDcL2
	 bms0WNKQ1uYhnaY9RUJLLOt396mfiC0qXzJYW5d/loZD7tuhuIlCCvzcGIHtbnz2i8kTO
	 vBlSXgYyLaNXGfTuSDPkZWHK0NOo6vXmeTt19tA8Ds3+3ehqpg6jAWHhbK0dARn/HJQQJ
	 4xRfEuci5Z8s8GtK83vk0Nmfe8MWdYeuX9R8uOM5i4wBE+eFAgScuck5lj49m0s4cnXnE
	 6TjcqYVcr+OI2eyhOqthYew5dXLSPX6HOADjhySr3XclegcDnyHYqQFwKFSii9UTF9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y14TJ8rP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ALjI4zuN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C75606A325
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C75606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y14TJ8rP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ALjI4zuN
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLuxlU4026327
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=Y14TJ8rPPToVsOWN
	sBACVXmoasoTJ1BEh5WlrsTucN8+1iRREOVjNrczmobmXxX5oiHYgEGzAQr1iMyM
	u5Nmjq7B2l7gEH3SnQGc/rouMMU5Q23+5/UE0ZDYEwq/XfSNGVYHXWOKX+fISFHO
	6W211gF2HF2lAK6Bq48wtp/cS0JAVlUuak8V7GJ2ouXGjS5/uyLvqZWVgdu3UfhZ
	a0uyVvXiWUfsftHz14XyjlthFB505NTFdrw0dmbMhYjclSTC9VC2Gkk/5RUisOde
	/VquLCadl8Ru2Bli0RFKlPMToXYWy2PjslbH4K3u9hm5C8dQrp7Lv9DEDD3Xhi1r
	oNfPaQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcs7h21s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:36:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c44b8fed1so14525306d6.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 17:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802171; x=1793406971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=ALjI4zuNMb8b7H9+z0/5z3LisKDzv4ZkuMQsGDy5lv8nXOHf0hGTD7s2JWU5usJY/k
         TM3hbazu/PEMvteSye6JUiGVbjvjZkvKyhPgUFOwQj4K7CYeLjMKZ/fZzT4fLge8YYNa
         ROL66h8HWweNnIvD9a2gnBs/D1zo07fiwwew3Gtwiz/tnDQZsQkOkTsnT8VzHu+pyBS5
         O15cUW15ttpT8Iu4LDSBztEs7MFD62ANKXuUakRFgkDeI+k6gPKzsN+hbarbyYqBvdo/
         3OYdJMo/+WZa/kFEIb8SmAThRmHZuYr3E7wSTuNUU0SHnIFGuIj3bewDhNieu6Om1c1A
         2rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802171; x=1793406971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=MFF2zs8c8sHPg4YwomSlaUPTAmq0fpyYa20JqwMU0MZeirgnh222q5pCIInd38R4u3
         XKIXB08IgHrTO194RIcZU09HxPZYK1po8ZqFFJloqZJ+o3I5F3NbD7FgaF4Xj5Q7MU3k
         TnQP87mXUWmjxiB5+/MmrGqrm/7RTKim9DvY/Stg0JcGtsGvHBS57UUSeoOiOAJcEX6Q
         qex6NdCTxTiVjdUosTDcDxej0/6HNlNj7ihKbDZziHRRAwTJgx/trD67kvg+ObCaNEtt
         h12+9Rl2U/jA+n6ivE7hjO85PwWxA9s4o1cwFyYbg+SymRo98jTAEVL0nv8OPU22wZTb
         9V6A==
X-Forwarded-Encrypted: i=1; AKwUvBwLkr/fZ7JSDul0czwOqUIh4WEPinSn7R4mrvfLcKkSQGvBv5X6DohPIrzTPZ03gVwW2uKcTUrtMOo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLERBFvfHQdMXI0dSVC3CLkMci5Qlex2ESulMAlnEuFpYa0CN2R
	5fuDULN3/1PozDX1ljZUMMA0n134l2UPtHMHb9wQdnpbX+A+zlnOF5PfqkL5yRTXhA0WboErz3B
	2EtJIS1olZ9j8VSEe+nB2xM8+Xv8xd666tdBtm6915I/DXQtMzDxfvLWKamtOJYk=
X-Gm-Gg: AYBFou1EjP40lFX24orCGILOn8kw/gevDqA2SXqB3dorWtbKlpRaj5OiSTAWlWVoT22
	PEjFP0AtYUDmagqlBqvDMGsMCSZUqDSmq/wvCGpFZi9tNq8+bkRCJ4AceYHoSkqfJI46rABgIRO
	dQcDVIVe7slNKgjVH4v8Vn0ZluhMJvLsCVhxSEFkzzRjs6aVm1FajYUkqlGI4/sODed78la4B5j
	pPk2w1u+sgBvfh7Z+7ZHrtOn0PbNMYFOjYy+Fb0d0DQ/XizK6ZtEVQZgP+LzstGx+XUKM8vj//J
	6u+aMNuspvfMmHoCUdt28mSqRhc5wtLvX+Ps1fyprLb5+Mih5gTWLRrBiDkBv5FV6P1yqkYZset
	Ku43rguV9cvrdLeEUW2O52LecaNY0fTszH/AQLfZq/dC7BaU/hkj8gy6MXzZPotscudvHexaKgV
	TYx01mN9lb8sWP
X-Received: by 2002:a05:620a:45ac:b0:93e:f0b9:505a with SMTP id af79cd13be357-940ef92acd1mr116218985a.58.1792802170920;
        Fri, 23 Oct 2026 17:36:10 -0700 (PDT)
X-Received: by 2002:a05:620a:45ac:b0:93e:f0b9:505a with SMTP id af79cd13be357-940ef92acd1mr116214485a.58.1792802170444;
        Fri, 23 Oct 2026 17:36:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:24 +0300
Subject: [PATCH v8 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
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
Message-Id: <20261024-hpd-irq-events-v8-8-6ee949e7a384@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9btvyFFnqxLn4beuyZo1X0kPkzxT7j+V+WX3wPT+pKeT
 63zd1PsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEMprY/zt1hWckG0xdONPL
 Z4HYo4JG+c0LTsazGwSXB27eVK1/9LVac+vheX7Tem0dWZwOtG+6t0xbSqdF6d2X1sKZ/Amhk8/
 0dJ+MtVES2CfvLHK4ZLXWvR97hDoFdjh75+zr6Xx7PKvhlZjVSa1jYtYf8t+cY+K7kJVi0GZo4/
 GyvP/hoZdb1nVNjXbazZJ4XWun5mYxn+4sxd1i207MkZ4uEGnY9zRlpWON3CNz1Tn2mub5kkIlA
 o43lQRXPf4kK18/OX7r2Tvz1Fo44l2aMs/t1rHi+jY7PC3KQOT4xIiNk1LqeTZYbo/iEkvxenuw
 9vZhBqnHvLdO8a1UV4h5WZP/IWeV5vHwc5dC7jRK5ewHAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX2/vH1q2pbRnu
 jKFbWtHnuEKnnRSNdxeVOc5aswi4Bd3+iSpStRKV2T+HRYKmlDSk7xF+bJQLG1z5AWzEZ+jnp//
 g4hxcbnFgDohQEtVIP+YkVyumTfWa2E=
X-Authority-Analysis: v=2.4 cv=XJCl2ghE c=1 sm=1 tr=0 ts=6adbfd7c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX+PoGCLXHkGb1
 mP3CLGXDz4/3quk8OLHO2AUZFD1TSAlpUbIjPp84PEsPYNNb1UGJRyz6sSU9mtHIHzkRPEV+d5p
 Q4Fykqr6jRRmGhTfLDCV8C2zSVF31RTKFJoX+LFUOp79TvuPpMuSuGUc13cEhT5t6a+2ompd5LA
 D78Vs/j14WSPEMFYCgd5EyZ1jE245U6rHJFtz70k/Ps2TjbDlB9UDHAh5JoSnNJWlogpVLvzP5e
 ckCYTRJB4Ad4s1FGjhwmSgtSECOy6P3+O/aVqc30DeT2CmxI4BJqYz/NhRPnNAicwOdokwnmFl4
 MxiF839YKeEieb5vtIn5geZl6RB5wy70q+QKlSlRJiHXlXIVp4CJADopu0391bXn7SqKb0Utnku
 uLgJaW2HZIBasYG+mGsPFBB3cpq/9YuYd7HWcs+TiK6eLm2lVWe4GnIzud7+K1sAgyQfV9HNgys
 +pYvxGJCKog4jN0/EFQ==
X-Proofpoint-GUID: 7mBl1uR3o_FpX-Jop_eqo7Tbpi1VRpJc
X-Proofpoint-ORIG-GUID: 7mBl1uR3o_FpX-Jop_eqo7Tbpi1VRpJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240001

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 13c434f8d03a..c463b23c99d3 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -374,7 +374,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
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

