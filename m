Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802165;
	b=vpiBIzmxhIDeRz9ijLmREqMK1SHiNpZ0lD0kLYFOHftMPTqOI07UZ91mPWqsqYDVlIbG
	 vITYzpWcVSMod3LZSq4pSqsbarGjfcDFK8+r/0o/hKfNvXDaQ/dZNNhTaVV64m3fijEEv
	 gUeMGnPSRovX96Xb3iTKxfSoALqsipY1WlrlQO6VeDdQOva7Q83GNhCK6EpVCX4f1CSFU
	 ZFK1k1tKlKBloxl5Pr7jua0kJDvCkiUUrljLtYJqiUpHdV8VqrOhbP3hDG+EU78CV3X9K
	 yEphsnA0oT8731adLDXm80vNexPPaB22jgTAoD6TQbQejTMhCNLSXESyP42z51bUHHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
	b=km6plGIh0Ff64s3aj6y8koqpE/RBnAOW/ywNlj0gKiaIY0JU6G9j5oN7jRvthRj2O/EQ
	 Zbkzqlsm+jJ1uVeM5F6u7JfS8eSqhOcHGffHb7KmQD+qRxS6IDLVoVsEtD6sP2jsDnKgX
	 gl/P+R/druhz/h6BXjV/HCgsyu+Nf/gbs2/ag62SLLRlUzTgjK6qEMFo3YFdwzsbEOEfX
	 vaOFpoGjFsfNEml37SnAS1ThcERvI0XkG2lLyinODN3Rse1+OP16Ra+ZR3qBM204z2m3B
	 sX7fdF65XOdKXvsE8/8S+wKjJl73LxFP6OGRDDT8A34PS4O4CAkaQYlI9a6xCQt1LcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X5PXkxML;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gjepgwal;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF5606A327
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAEF5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X5PXkxML;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gjepgwal
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLuxti885871
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=X5PXkxMLShfVuQpn
	RNM1czD4Xr9K5BPvqE5YMV5/fkXBKuCvX5kaFmCAc3N2KE/EOAGeT0pjYdZXlZX/
	4YbST8blcDp5A2NDlKMgOJkd4VcJZ6fwWHJwHWUXU8zRTVJqrdIM8RjHeWrhU5uP
	SfOj/cTcskr9F+dxhn7Pf7EAKjRjMmkRo1x2CU2ILKMvwptPdA2kn8Xy7hQ0dnxN
	lZbDddUSi7av9O8I6waKW5oZZA861JtZbsDQrJqS6lv+G87HkfOEZ1meQvOSAb7j
	AmbSPuhLRvG5atn5Qaj0U8mv+QzkdHMce5ud9yuUevdmMhtU8wQEMHgIQxa66Wbn
	Z0+ibA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw2dva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:36:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so240821585a.3
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 17:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802163; x=1793406963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=Gjepgwalawo9HHnd4y/u2q3Zf/Fa4XgmeCbtZaSXuvQGE913nIjSQRcvHs/w2I6epF
         eGsefH0uzhFuosDMsroBGsro2yqFCov40HpMOoxU9/eL2HuPxeW7WXZ2deu64HWDbP4L
         HufYvCseT0CA+MROFrEivEYq9NrC/Qtd/JSjH1sf2CsfIu+uu55zpDZO4WViigDxyGQp
         Qaj8rJA2JluXOF9iyTo15JJAgcsa+slbO9iLOgj01gXl1Cy8HHoMl8WuwCZWIkmQMe1N
         siBh99tVRYgly9kQORGweKkdCOuDSSQnXppUEHRs3z9MtMCZMDmwUKZYZL3nBAjmc2e+
         Fj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802163; x=1793406963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=vw0GWMpwc4ypVkAtFKLxtjW8R6B2Lo2QxCpDUSi4LvTmvmEB6O5Xfet0at9vwQIkib
         MWWKWELrWZWfVCW7xR8hgVmh97DU51uibgmkO44KyL9ZArXfg9RFt7aFMKrl1LFCMlJ1
         F8pL4y9G475diygVMerxWV0LnwjKnP+GdDEZNhqUV6Z3zE+4iD4234abOVAwTC6cb0Iq
         pqRf1dOxQlQewtH6W+t5bC/WbAWicioqc/XJRt4R0GLZyVQ4qOiE2TKCzFzWnyVI1Qdo
         wVwS01duKEP3kx4hhxZnLBBKaI24RP9QSXg+GhfaPd7ocqEgZvFoZNMaAIJ4EfyPUAFG
         tZZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAZpCvgNvoMS1g96i6rMiWmmBKZ0XSzDjpzWuxly2mf9LMJRDdClTXxrBnaQVoZt0sE4aQYS1QOUs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLb2g3cV9ksOZbu4osEk1uNRrJEU5xX+5DWUvU3rYPKyM+75fcs
	/+C8rbtaX149C9oVKYtdcpJIHS6mw2MDEU0D61yif51hefRC14t5IB17OcQ2Bxgp5kBMMqqmurY
	nqjXkHkXA8wzv0IzyJtJBKCkpnIiJ2iPH8bNVXYIPGpsAPfZ5njUVFnaWszT/2AY=
X-Gm-Gg: AYBFou0W55gXuzUlesdholPI4OcmvyLN6tqJU7QW6fdErC74wI4ANULIeCwMN0VUESc
	8G6WqPE/Qeuwd/LyovPqmnR2/LtBKUZF86QbCx7xmC+6AvrpomlyweO4BhNyk1B2D4kA03XyYa1
	JN41Q9Hvf2JELdUL+GVScpxbsO8GKT3gbubkf5BjpTt/3vkmtbZJ4ABF0oT3yJmecIMUj1ZME3i
	xVz0mTSOwaPX6nqD+1qEy5dWXo0FE1gVYM+k3yG1xx00YW2ED93b9wX/3+M6iXZIdBhaAYBmRTA
	oUH9/Ck2nwzczU25tDxK30zQWdsBByKI6QxTVT65Rp2daegboyNr9sDUbejVxP1m5iP3CDfOg2h
	Q53pbkrRc7iFkp/aVCxVBkZvVN5u1ugKRTxwtQO1gJe8n+QUDHvqo7S44aATyUsMGLwuuDKmUhU
	W9Znfp39k5Ry7Q
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr109938685a.46.1792802163137;
        Fri, 23 Oct 2026 17:36:03 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr109934285a.46.1792802162668;
        Fri, 23 Oct 2026 17:36:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:22 +0300
Subject: [PATCH v8 6/9] drm/msm/dp: don't take extra references on multiple
 plug events
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
Message-Id: <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1SgHKkiJWw2Q/RmkX21UPsNJT6d9sWxsWfN
 lGk1cDfUG2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UgAKCRCLPIo+Aiko
 1abQCACx1C1gEiCjh/JA22nJY5oMv2sH85fmApV29ur3ZJHiuL544WoNV+08rQuI+2s1l7u0BfB
 pSH3B3HC6A7rQlqhDPIA2ruMLYYYjriz6QSC6lw/1JonyaVTNNm8xvMZ/VOSDO60jZpXprD143V
 EqlmhijNpaAWTY4Echcgkl1UjRZvVlWDS+tyd+BfNjvz5PIPoLfUR50gMU3moSgcfAV4eIbHFr3
 LQcvtn/0yLkoo4o5hAATZZOchduLmibkjvq2qCB7lkAlkqZMg6CummmnUdc3zBbEqljwccC3sPw
 wbS9DfpRqegDI381OagL0f5T4ASlv7jgolH3vPOzjKcXhbWk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: C94wArOE6Skz3ZPEwyzjg_ZG-iu4KGGn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX/s0uWxQkisGs
 rxkrD09JrwkYHWZoJksSGgmg32/sDnvJpBvcQGe3wDZIbyFLxHT1MLHzGswB9Z3h6MJODKJHy3j
 8/YZUo0TGPqHKAAGtowRkya+CU1YDs0=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adbfd74 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: C94wArOE6Skz3ZPEwyzjg_ZG-iu4KGGn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXyZwXcsuti8r1
 w46Ad+b3JmLqDfUDKyptL0k45bJvMOD9WIEnq3eSkZVueju3U/o8+roxFvzwHuIteDUAgxCNkFD
 ovjJm+nDqc+9OpggStxA+DdR4I0oEPTNvRVv+5G0aNcncafQsfJCXmWUz1QbX4NQV2oFElfhzJx
 UW7PzDeZDvnDX/9g8EhxgP7qiXMN97F1Hqd+/A32SGU2ojyPmA1lsEKcaP5x7Gz2d8fEB5WDKGW
 ratTBqJRhavXMmOAKTqvziUFQfYpXy1KOHcK+h0mQEmTwrxivZ3Gao7X/Xrvsn8NBq8uBGAHOB0
 J2Iv7g9DB3tx/g3p8+MPQyQGBMtvUjbeBEVLTjwJE0cHwaf/eNKk4hufgfWOeRhLzAwruSx5XOb
 wPJDjpObsouivgBh+usRPdOqq1q4//pUVyTh8jo+ErXfocdzQVuJUTby+mEZqYiZ3XDuNwArXkL
 VxB48ue1wTDVZZAm2Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001

The upper layers might signal multiple sequential HPD plug events. Don't
take extra references and skip all further HPD plug events until we
receive the unplug event.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa8942922b53..ce919a26fba2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.47.3

