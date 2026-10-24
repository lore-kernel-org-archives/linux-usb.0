Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802177;
	b=sDugncx0WjwyM9xHuuQ7RD4tunTI90fsy7ck11UoOIKs7pILbLI40wVopUFHJWgAbyLs
	 49+W9OivEUFJ5EHSajfWx0CPe8Up7Q4Hari5EAwgsZKSwcdJiFg2UvFGrekP3XsPykS8/
	 tJRD+ngXT0YpTvEZ+T6Vcd6iRykV6ACx+/RSi/YiCfyJCITz99NPUkJ2k8JkoLA5DJIa4
	 6coP1Wiks+pFiChy8iG3g2sh651tvlY+BzZ5IUx/d5fYYNbvxuLGH5p89y54/Y+gESAr4
	 TiVrvt1UXu3MhuCkytSuqDPtKPa9YE4fXxpkgaRoZYt4b2NlJKtPZIiOWm83odsct8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
	b=UI3dPWp5SHLNf6znoOW5n9WAClSiN3EAZzF9kmF1Iz61wHY16tbyS5euThC+PL9f2kqc
	 UhsPmKldaeNY48R/L9/V7O/+aNngARsNU0sF6RMBUGomLnXhVTGsJFejUUYA5EaFKXdhG
	 G0eCGOqdPZ7A8NdmGzFXUewYoeU7GImWD7cCDkmm7YkJHZ0jSuixntoslkEmdU/VDJiIH
	 pNppRDt0Qmn9h5HZXIsBH7ENG3FV7Q+f3KeuB44COC4UUd035Oy6IeqLAgT3geGagvQHF
	 F6RoSBHLBcaGv88PuhrsXbHIVxxxW1+MsPLPWC8j5u9p62NAeLzwMUaH3PYBo0kp88Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RMBaUzhb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=czCuKc7Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B505606A31B
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B505606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RMBaUzhb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=czCuKc7Q
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLuoCT3115323
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=RMBaUzhb5M7n9n2K
	7qlHeN9QBrAgLOr2o1DamNJDY5OTVrTrOlMly9pzeu7ACQCd/0+QBst1zBlclz3s
	5zYQTOeJDoG0gFSXXqGes09udTYU8DDv054WQ8BY6HUcqj7cK+2aeUd6uHXwzmXN
	2AjILygpCk0uYvzUgSAhOsI43ghQYtDKUSf843zxc2J4Dj/Hxg0wtLVBABaKQ29Q
	ytlFTUr+GIGA88giMtUPP/UjHwfcb9+Xfs4QzjE+ep8TZdqduqdXHZDwHFWhMOal
	Up5oQZ3obou0HzFGXkPCg70IjHKcrXRLnX09W74ke3rH+nQLgqoIzwiLwjUnOA4R
	J4E3Hg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrt91au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:36:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b7e90fef1so49563666d6.0
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 17:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802175; x=1793406975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=czCuKc7QAilTVhe5Z9MYTVnVYNzJWBl4vsLIotU4qYwB8ssL/4715YT8dUmHVQ8vLh
         4+kj1C30NUw9eNdu+GgJKoVgBlT97TPko67LQBprYEIyCBgkozX7nfVzp82KCtX4PUsA
         s9BcqH5elrFmj92fkWSWkbBKmhTxSH3RpoTeNGYX5UZEdD59kX8dls+0oSBGB30GHb3n
         rwKgRnglCcxn8/hGzl+p9dp8/Le2CU+OyoqNcDk4GivzN9jDS73UE+xxvZ3FUvKFTcpc
         dE6TDGls+r2OiVZH53Vl2YQ3fwNpYYaNGcGukOfW2VPCBcm6OZ3TjqSKeRynCmNMZddZ
         sQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802175; x=1793406975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=sgCNgr3zlkVXo+jQp1KwjdIdah0C9T7CeUGzFDqs0Nv3OKb9pCnAqjkMqSzYh5YOPF
         KUAI6JLV8Y2/3YYK4dauDwJG0lrz8e0KVBUJHhc8TJhGFJpTG/OYkgajwOoSmOMxmJAN
         54+S1qc1gFABKP9b1uqjJQkVZVLlOUR9aQ1MJGIIasFRlsdD04qELSTODoPoFlJrmbds
         f9MzrUqiR0c2RQJSMMWmLupGbROO3BpSZ9RTLzkcAN5alTboQ5J+PIkjymTTWi1BU+pg
         /qzc37eY9DWeFCf4aLRUw0fkYNU3X5DOJIE8jFVLnGA5MAfekOyTpAy1lL/ptThiCJCE
         FnJw==
X-Forwarded-Encrypted: i=1; AKwUvByhkVJk+JQV67IeiiIDCXPPr0+4IEtVlosVlmQf29edp3viR/lWEYGM9fJvPcI4HltoTscty12infQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYILD2eTfywOvHjRvqTeGSfT73EFTUST5mrfRkM6HkhjlbwmoiJD
	WZJ8z73oWh4GBw8Xs6hN0hIh9cvuD/zSQNdqff6WbMAxM5zp3nBkrWHJWgzhfmsBarsfby9s8sx
	JHIhC8L7WZMZywf6MZH6SiyXXCGsSK1uTwkMiRYwxfFqTzSx1eMyxpZoa869ztPI=
X-Gm-Gg: AYBFou1g8TUMYvv51vrwGI4Y6GdSV6FLRPt5TUwGoEVPzxe9B2RXuKwyF9SVdFetyzZ
	d/2MCF8qIlKDsnygcmm8pjPrcw4/cUxh4jFpCBv0B0/TpS2heAS9+i9ldYpN40Aj6bMi34rZX7G
	8ZbhzEg7Wm8GdfwSrTGNp9pGQQjWm+9VRL+fK0ULW3B2ieryrBSSmYGFp+LHTc/6q7OCSQ0JPSm
	2JoWwMKhfT1GacoBwe0NtMTG19wjNnR516N5vW8ezvIejY3mtUkhoHOdaY90FNzLLfpNuRTUmGg
	ekb0acweZwqU2ePGZvBdmJOzD3IgwSlXIARb/aUIMDyi6XYxDTqHO5C4jn6El4K0NuIogfsnKtp
	xAHj8t8mjv1scfWUCNUpBczGR/IJjxRPZPGIdDJjHb1u9kfrK4BIQioMSIG23vKvaXCwCWaedAV
	15rKuCOeTKBcsI
X-Received: by 2002:a05:620a:3714:b0:93c:5952:5765 with SMTP id af79cd13be357-940ef7d3e5fmr99109685a.6.1792802174855;
        Fri, 23 Oct 2026 17:36:14 -0700 (PDT)
X-Received: by 2002:a05:620a:3714:b0:93c:5952:5765 with SMTP id af79cd13be357-940ef7d3e5fmr99105785a.6.1792802174363;
        Fri, 23 Oct 2026 17:36:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:25 +0300
Subject: [PATCH v8 9/9] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
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
Message-Id: <20261024-hpd-irq-events-v8-9-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1Vj92nG8f9DdF9Mj0lE9H9CWxc2QVarSsPq
 X/6E4ln16OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9VQAKCRCLPIo+Aiko
 1TdbB/9kUbzi0zBSP8iFmpiyHhq+5vd7f0SgWlQeOKEdcvbh41d2YGLywyh3Ghui5TxWHyxZnE+
 qJaN+BvDuOrgUtJvLgrIiuLGIBwhIKMltwQ0hYeX38KBCNn7xvHTRkCDkTjMZECnH/UCPa+CFjd
 gaBfsUhoeSzFrqvXZvV+QjziPNwL0DPRqSueHeq0zJe2ElLryzBxpxof8xrrU70pxA2uNUY6PSu
 8Gouxh+OkVkupdZGTkRkVy6HWlyj7npO2Do7rrfZIXrc8TChTH229Ry4k1ayA1xdKmTKohgC7le
 UU9+PxeK3381gpDvQH9EfWfpWGE1MH2LK3SsoJDK9f5dSP63
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXwmfZGIxdbyPK
 lqUVzhCfFCRWLs/Slw9cXwKytEcvKjTGQzpIhw/sEUAriq+YkH8Aw7fwBemJf7I8Ap9MbpiQeTB
 RiINAbkgkadUSC3WLSvmwx+QN2cOfsE=
X-Proofpoint-ORIG-GUID: fEInxVwXmLO5YkkoF4NCo_WhAd6HPViO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX2GhYRLcjR2Li
 ww4I0M8hJlljh8aukVG52o6T0VPygBMFyj8whnyzXUbBKosXxZkE3HDiTL9TM4wEKVCeJojy1XT
 a/bDoTUpPs44/GkzekHwcrZOMHWOSIfI0Uo0ce6hL3hwoTnqxg/PN2AQiFKLPDfgMmv1sHwRq25
 3WkmDlJ7QYnytJINQhcOEg6x/eYVlG9tNzKu3XOs64wSiUVmC5iD55KHnvs/HwXFi6eJe6cTpxU
 2emmhBGbIpKCOB3jEJCo0SJgr6SHaZro2/mG+sMnb+n8B87M3ZYqhP4vpkBMfKTH4T8JOBQ+TF0
 whbEjBf/7PuIfb25Xzp9vSyU+ISRPyy0pjyvCNm3P6yactWQ1YcQ5WU412q9aijyWCs0TuV2GlT
 4wNu56YVOL+Dh8mhjQ2IMjiLD0nn8bQd6AAnxYT8gkGcqGJ0zRQQJdjtMIG9ill6C5eiUW2NR+D
 +0yITWmsuW3A2ENnScw==
X-Authority-Analysis: v=2.4 cv=E7lYNqdl c=1 sm=1 tr=0 ts=6adbfd7f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: fEInxVwXmLO5YkkoF4NCo_WhAd6HPViO
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

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..cb0312e2b8dc 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -316,10 +316,13 @@ static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3

