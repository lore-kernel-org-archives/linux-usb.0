Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675711;
	b=jhPJ/dYLyIh1pCPrTdN93r08mKakszbD6STzlr6bFNUWIVtKYLjjT9QyV6aeL8784bCB
	 PanwCjgKuJGJlTlfWwKSZstc24TCZNJEsN8xoTNX6QqNV8kz6QwGb73lO9luu4nENG2Z/
	 w2nScnKalBwCBfRyxr8B0LZ6SH/fTc0SbwgLWVrCG4+7khJp5x0ekHTdDlS34zy6gtYCG
	 OpcrBQWHMnOnW+XuEcCPHQlpN67iGwB2Me99SCkztBjQz8abkLwTxAc/Dse00+/E6kIKx
	 gO25iiL3mYq5UF1Kbrwbpb9W8Hzhb7wTYN8s1mk0NaiFFQNFcgv10WIxMlxYbOPsdXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
	b=Km3O1Clrz76g2M4ZTInjUleF586fUm8K7BpJiiMxJjW8PLxY9nlhD0fz1PeRQ+R+Y+nC
	 im7zmxBLeQvILz3euftQyUWrmMbtTd+e+IosbIM/G/VD9Ypim8aed80SanE6wBFghLTjh
	 KX2l9aY8giI8uBKFo8gDLzp4CL45H6kUstZ+cAwBvo+a3upKshrIdbqo/Om7dbrxmMFAp
	 NMrXURjt/Rxe6AIpkNT0X0zadQ1Q5hnU1oL1yI/UxAf86gtc+vgXX7/AApboguy1xT4rj
	 sC+DZJepGGoqICSe6hfJMSmELDYScUWeez4cswvwMhQVMtcBVgyX76mEfzIwA24XWrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZY5crMLc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hyQQZbun;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80E360A380A
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B80E360A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZY5crMLc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hyQQZbun
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0bet3923294
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=ZY5crMLc0RdN6Ac0
	w70ny/ZHfSFENHrnhAnoLhyPJXR8HSTKXy/3IX56AZAfRAf+MJDejryHc5gI1Nsi
	Wqhm66LCtcz5o8JIZ2Dr8xC8yXQtWPSxkAWsk55N5saZoHQFWjlo7XXebJCY69Qp
	qFBUjnulQkMYcSYfU8KUOOS+f0Oa8R0ppgQ1Zyj5WXuhVyLYITU6VRWUdXXwkV+U
	tnzMsSf/Uvz2cuLGArchUxG8nvr4nyfRIrRNAKGy0Z77syXsYFaFD5irD/JsMKts
	69unpf9U+b+3dzSEO4oAB4/jMlutYtjGcYkRNu3fW37GG6fRcGple8NqNdspo+Bh
	4qOFuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bkqs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:28:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so415442985a.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675709; x=1793280509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=hyQQZbunKDJB/osh+77vMppNfSsOOcnHxWiWWM1Ibkqbj06i1xkkXgxKzySldfkMPy
         5ShH51rl6wFs1T5MrLVF/N5cnt7b+yd4H4V7SidPYo/RkeOYXaEZQhEy9HQ9TQH7x4LM
         gbP/ED46kUWIG/Nfu7RAwFt0ozJBj5wewTJRHBZss7NHHswl4MyP+LhUWWqWlFKjqhTH
         LtDWR+SYCCz5WKdksSAkfrOVTaX3Y6tG+eddxCZ8Nhyk7/0G5z3KqOSGk1OOJFGxZySM
         b6J8doLqjuYCHXTNHaqyJeRZSmqFl3w45epqe9wGswRGLLZcK7jH3EYHMiQa077uPe0d
         A6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675709; x=1793280509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=y6MhsVDQgIojeBMl6hm1l/n7r/q/KMjpV4xCZEwcdK7PJhEjA+iXFov5q9UjA5vgTc
         KiyxY13dX6W/dPZEvafSf+cc/BUId4DQMQWndrTaHbF7JiNw+LQZIBs1NTyL4oTnGpvc
         N0P3TIPXdu1tQPmJCVGg43/El9HTn3F6mYw3ikMtrHGy3BEEjpa/Lvaqhy/HcCjYT5dz
         bI9C6as4TnMOMlD/zWLsghLmX0BqYvJN5j/zSu8ON5B9g5WRkew3gr5JCwpi5Er6n9jg
         oYdYp1kTgm4nxL1c8gMEPv+Ms804hqv6JhHs8iZfJwgeCabrdrG8XP8G/R6BR4spBW0f
         /RtA==
X-Forwarded-Encrypted: i=1; AKwUvBznk7FPuuVfl5bjb7LgJ+k/p0QV+yGcjDoM43pBcpLfvMsYTx9kUBhNp6jCERIUDC08RsFqj5/yMq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjPrN2g3tOb2ssKDPq/hdN4yTO0en8/QO/wkXu6f752dZTE/Lt
	dcre6Ya3RQ7+zBWR9w/7QfA+yRmK9IM+Kx+SEbAOKuVSRcukMt+zps2nwEJZ2Ha8lkA7OUqzvhB
	6TdgAUpOma97IiZLZPiuqdgbjRvoCEVp5oS6adVoyrS9hIcKFpMFZ2d22KTwYrUo=
X-Gm-Gg: AYBFou2iqCJhdyPJWceKM2cUCDfK/wavviX/a7FP1y0+SEEQiptJZL0wV9P5eZUX4tE
	ac7iGSUoZHlhqGZO0jiXKFkI349z9E/KJ11rBhRgWrHg1sPVUK3kpzxuWO+e8jdt5uQ3dO1KQX4
	fa1zUoLyEiig5mkv6Nf1WbKxkCiaCCTXVN4Nz/MMb5NT5Jj0pd3Fw3UH74beEkVUcCRe+0CF4xe
	7IBbh24jI0Zobvzo+KxrCXaRiQUY54NquHOYOvKe/oUHY9WpDHnfJPhbfYTqVOWBYI83AuRO4DW
	lHj0dWRy1wIIxh4cVejqS5kObODYwKpQN0eMo1GNKPSh2UDD7ldp1Ns/uZgIWPfViUbo8zkWxp0
	q2Dzwym75jkxtgmbDZLloP2tYqQn21a2HLKIHI1jtqxhonqLFOO/RHgzwdbhcMrE1yfg4sXDvwU
	MW8HTF2xocMcU4
X-Received: by 2002:a05:620a:4504:b0:939:fde0:a71b with SMTP id af79cd13be357-93f57d6fe0amr961377285a.0.1792675709049;
        Thu, 22 Oct 2026 06:28:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4504:b0:939:fde0:a71b with SMTP id af79cd13be357-93f57d6fe0amr961370785a.0.1792675708354;
        Thu, 22 Oct 2026 06:28:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:01 +0300
Subject: [PATCH v6 6/9] drm/msm/dp: don't take extra references on multiple
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
Message-Id: <20261022-hpd-irq-events-v6-6-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9mYaSuX40bR5awBoUJ+yVcQNZ86P8rY1ul9
 gx36R5zT7KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZgAKCRCLPIo+Aiko
 1b7VCACwuu0XJB0SDYYnJaMPkQQJp4epfFvL2A8BbhoeeUkJxhpxOVsnuymLALMdK9C5Zp+RGrT
 Q8yGJuTHbZI7/BlNrAHb4m9mYAyiPXPNVpLyMCrH4EMXs7axplxd3M7EKjQ6JFaodn/DBje5zAj
 z0TKPh/LAVBSLdkEHMBKS7r3xFwn8q5l9ktLyhrJW6u6JOEmW3xtka45Bs7qCgBHHkPqG/wGYEX
 BFb9KR4xW9M3ZEhiTatIIZofZV1DhBQqEa19haQvTXcaw0CRJrzm9fgsRGVTMdLYX0l9pAUBE3W
 jxJ3xlzvjy4cBPeL90Q4VfJZSVXoYFh+Ph2xeoq5YptpjfjC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX+bZze0+Y1QDy
 +h+j7V+LOJ4D69wY9+flUG75/Fi1Y5T2Ny0BVlii547MBWr2sJp9Rt9P0vBxxiliCN1vo7RdOCU
 qDnU5wgGkTeHhjnvbs9wcXeFBkNLgDvWg6U/vboL0+sH8jM9SWJgYT6OpC7iVTKr6LxobsH/NZH
 p8YRDi+7GiNp3Hgu67lFjD91jmZVVtdvLO1cYrDsebtR4/AuIp4zjHgwFQIbnktNFH4Y9NtJEGw
 0/7F49OahCXPxDfreANNua89+XkZW6KgTrEcLnz3Ad8cSva+Ix6AuudlK/q7wjPNJGxgEgjU5O2
 4FvXoGEju/wW0Inw/Wbwws3tiInxpXmbR/Lzqi31F2RCbbJjn+cr3BB+CrmXUnqtsqwbLE2gIZJ
 OBGruIRQVMSWLDIqQa21ClWzHVDe/g==
X-Proofpoint-GUID: KhbIZgNvmvxDP6C1UKByEwdBQQ35-oFT
X-Proofpoint-ORIG-GUID: KhbIZgNvmvxDP6C1UKByEwdBQQ35-oFT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXwB10H/ntMkGi
 UKwTgC4uue/FMDVO6AlJO1KrOIXTsm2iwwCrraOKa5a2nDYg8SaB8FBH11bpaaB1ntSHZqN6E4L
 zPbkX/FI/0MQV94rtIIn9ZrxGjAXATc=
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ada0f7d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053

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

