Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675713;
	b=mtk4phRW2FYgyKGO6PlG7+fGLwr8hC24UVI24yrvLczEtWr+MsYxoZ9WyTevL/WZM1Sx
	 /QlA4ERsa/lHOfmkIAKeBGqbu844TA9binH3FkqYGsPotg+4wqm6m8lfoxxrDUmn3TVZl
	 FDViv9LAeDOcHw3UfoWELq5NtIEAzX8DfjOA8gyQd6B/u8gfTBt8xH7JB6yQTMYjK8/lh
	 Me1ZZAHxtnJDnDG4Vt3bH9a7II5+ufccMkdNFwZZScZ4i4uVtjYgT1cJW8cafgH9vTjUc
	 1Cv+F3YCmQtFsgvlDWbxzhpuU+Shq3DwROqaHEMCH407OHMboINqZtfkwzfe4d8RgGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=;
	b=eNoZryjjN44iqzmqoxxOxOoesz8J001+Sf3LAG4X+FnYk8vQlbJzlMMuZnwerRYWa0cx
	 rvhAOvZ931JJJpzH87zbh1a1cv9Rapm5zSmZFoX/XHCoVYVWQuyrQBeUa8dFBrqRqWZfm
	 m1OQNXO0PkWpwj3/xlakZOpWdc4PttR7m3wlfQysBuQbSQKqyoiICFXHioQlVnBtWL/yS
	 gMUVkjtJOBzSYjIvBGhRXYHDAMGajhLe3W/8ftm2L7X84fGu11qWSBPGq1dJT4nhG0L2o
	 h0ZvWw1H2tIk367hd9dtWC626ldkvct47RtG+l6oKCb8ceCd2MFzRgGZj3GUDbSJiaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S8CFFZcn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TPLCFiMF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFC5606A335
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFC5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S8CFFZcn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TPLCFiMF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06Np3115553
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=; b=S8CFFZcnxeDjyDK1
	UwXDhjtwoydfibEOA/Mn/eW1A4RO4Pr+mu0hyxuCaGmWz4FprGpi537xk7D+7lOD
	Xi5/O/Kbs2KBWw7L22+eZ6uQ3mATsNLnea0xOvHYKKwAmLWFF67iNbWUtYK/6aAE
	unOPSH0GDvKZENAdw8T++m4rQbtFquVxKc+ig/v0qVsL1dMB4RsPjizf1KrrMnD8
	kuHxe+xZH3cmkyihrBHH1MgM5x8xILMTY5vfQWoSTQ7BoFHImmIQ9SNvuCu5nYZP
	FM9L0CjPSjYfCoMOpx8j/e3ZTTP34KuZrgrIJxeBojPyGeCoGerWfIPTKMJK1GkX
	vkdzXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bus5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso399970885a.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675711; x=1793280511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=;
        b=TPLCFiMF6WZQkMZf/C2sV8GOgs2dtGZGT7IOXruAh0cZz7iuHHFqoTdqlkBkMBregU
         cKY7Vwwk+wa5XulQAPNH/wLScVROZ/HVVjVoDfCBVXjJHp5Wh0onDxxCSqkS0t8OiCQQ
         SiBKfj5EuZVAxIDHM35svGdEa+NorzjDqtQcMnw433sFS7Qqa+j9IKUQGzucnk35K96y
         EM0cHdZaj9fi86qzZhlzvsPBlHCDPMjUPHYLWlgNsVWeSt7/Clw2ovLoiVTKO+PY1b0v
         TZcrS5P3+YhJzeFZjpEuO5f12tO5t25mEInndrL7FzBakWWUH2w6ARzX83RM7E02XWFz
         974A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675711; x=1793280511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9dGBa5jxHY2xcy7xXvvjB1gDg8jzAjMuYoF3wwUqn0=;
        b=qMVyjzKhe34bU8BnHqaeAuFkBkmIFSSpG5uVWRctuas34xtQJJsvFX0LgT+A+SiG6o
         hSwIrQZMUBPcryCGHb7FY0dtVQvmoih/bZDoFin9v2vNEzbtwDwTWchjsMc/O1KUtkRC
         1E1zWkhYkMLdtOsfU8mnBazDvgcFQhecEeJWAS6OzySAIwYf6G1+EORc4VrYrMa/FRZO
         SQ0/gY1+mxlPF1xwjztPNcxriAn+/8A1PvfrBDp9y9lVWMrCHZeNt/nZYlg2rQuOMVsT
         iMmMVaOnjpJ1fZwhSJpTksmUhVlb1idv3b73zRytmRIvNMUoVLkRDHTJL+r7tVaURs4i
         DMMw==
X-Forwarded-Encrypted: i=1; AKwUvBy3QC8m5cTvWJ+q0mAuGlTVxSyflsVgxgAESMKfoKVQi2oFqDaSC6muoKVvfJ48fq/yA4fXFkkphyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfQbnpq4YNq+/cai4sdh10dsqnmTr8IezGiyVMxBWJgpOfLIZT
	HqRb0LyWmlkgZo2RCy5hTIGqX+iuG4krBRgtFKXz4f4OafJFx1Vfd6QoeFqLk0DYrtK5qUOzc1w
	Gd/Bd6xt6P1iVm47ltSHNa2pD6SieIJim2gCNOPlMsqZ0a8jmQokVkKJfQxLr2gI=
X-Gm-Gg: AYBFou2UnfPD99wTLpw/s17+zgAAGqRERkGxb8266qcYVvM6KKsr/GGWn3rvz3p3gyw
	bgJTrDLlbXPt/wB338XonIPiF+gO2w7bunvLy4oSvRIX71+mcRC+GMICjC+AkNi0ZMrMKwH8kyU
	5AUzXze2ln7wm0ZyoFRAt8xk8Dc4MOI2JObjKROWT6+JOmSLTONIykht/QfrJi0EZ2trIIQkOGG
	rxWN+Hosvwhg80fXXAR16bJLCleHSw7SfmkE/FR7lzMRKQtvmf00xwyET+Hq9OMT5qdCjQemCo/
	5kOYnz8bWBfC/P11TmNVND/qQw636/3FUNt79yXUqIA9uJ/A3DaE/cp1ejtj/uyZVdsx33jF8y9
	E7uUDIwI7yUutIyiHN5sYtlRZLMXv2m2DMkIGzsm4IsQd98Sq+Qk51WHJfp8TjAp58b7aylIJ8J
	MBk+XNlDNnzUGd
X-Received: by 2002:a05:620a:1990:b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f57f1d8f7mr941932385a.45.1792675710958;
        Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
X-Received: by 2002:a05:620a:1990:b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f57f1d8f7mr941924685a.45.1792675710367;
        Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:02 +0300
Subject: [PATCH v6 7/9] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
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
Message-Id: <20261022-hpd-irq-events-v6-7-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XbnsZm7/G9+6/HZ+XJTOjbptEIAHWIuqiD02f+/AGHg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Yt/vTwOk7t+tp5eoZf2Nf+emM0WXT7iVln2H3mOSzik
 TlX3Z/VyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJnGXkYFjHcl3xl82uvyJ3
 Wp9cXbxrJf/3zrq8wjf81TlV3SGbf9ad392vEaD009si5p+8ZUtBbJPTS4WU/622FvemV++LEjx
 sk3bS7/IxR89aqcQM9cmli4ourm/5eJx5v38RT4Sia+1mHV6tGYuXPt8k8GsK+1QTP+lMkSITM+
 /1Roekl+ucltlmGrnP+aN0iaXg+cdu78w3NHq9669bFx0QcnrZ+40Lt77a97OiX+qhvqUmd58hV
 25yjPmeUnaH5Wt/sX3xmq6k9XlukvCCNSpJ29pONM/SSZdd6LA+zKZM/L7zhwXnix2P5GxKO2zF
 nBgeGdORydXzLuLOpYq1z5yZLjRdlJe4airS/IH/0o8iAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX9MltVb3nk0WU
 btCX5bHOavYN2MZSC9yV8tAsZggvpk8PgyowByiUKVkE3fnn82pnnevGel/uEyIG1QjqCeYXiw6
 CYrryfrNr2IpU/frHWZt33uFHULP37M=
X-Proofpoint-GUID: l7DilmNnGGI9PnijmHvW5Lz_O8vnfjdl
X-Proofpoint-ORIG-GUID: l7DilmNnGGI9PnijmHvW5Lz_O8vnfjdl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX6SDi6DRY0vl2
 MjtFIfY+ZCtvtJepxgZmO4pk6q2Mk+GBcgP4IGVCIUSh0A0q4qlEh2uUSV9wQ/n0ogHBsnYOHsN
 5zHbE2PbCFrIV24SMEaS6yYfv5Czoj1qfe3WcPgUPi6ePA3JPdNkpDvL8tsSPqveH3LKoQQaDDj
 jMx6UnfvMY1mZ6fVDQ+1UjJL3kl19QZWxX6OXy3vulDBmw5ueQJGuTQXfzJXOki/nuWgNq4WMr6
 G0BYGIcQKn328Q/Bw5eMfCbmD7DRp44IZjTHuOliHmM/HBgd16SSYGdJsLZ2AB1tnSU1BbcOUVe
 LiESRuawSTLeel0aENo0etayRCIZHzbNEzc4ER4D8cWjVOefhgESkW1mzUi+va+dHSLWYXUoJua
 zuV/0OP29UvzAISxHttJv+vf7Sz4Ag==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada0f7f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
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
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ce919a26fba2..6a8b3b8e1fe7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1566,11 +1566,13 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
+
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
 	} else {
 		msm_dp_hpd_unplug_handle(dp);
 	}

-- 
2.47.3

