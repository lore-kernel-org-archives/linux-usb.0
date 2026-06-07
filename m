Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBEC1F7575
	for <linux-usb@vger.kernel.org>; Sun,  7 Jun 2026 21:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868007; cv=none; b=axa28RcJuZM/gOJcqycOR0OgQu0SW4LVyZSHMKCAt3hHbVa2pxAeL6uy32W+q5Ft31HFMUOuI0szVeHLpVR6h8CqXzKYzpQrnwY7sYJLIYfILkwq2W8chZu+KMYU/A2emeMdAkCZcFdmxa+m/SEGvqTDEL/vya0V62dJsdNYpOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868007; c=relaxed/simple;
	bh=Xv8OK5b4aegzohrbDrEYK2LgkMwGQ21VRNuRHpj/5us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmtnS49UyB7/u+8g78U+KYE1i42J7cwfxpKWjVVCVTpsI6QeCz+7tsa1QT/fvwPHuw4Ysbg+g2hI3QKAgmldacWJWhL4RmUSDJNFN9zAi7fZ8jPVAVfjH4VuFAntT5fTYBpCwSX/Qw8rLmstQwJky5rGEexndNvKKnhhzL0PudI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZFyBLWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A09lQJ6r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZFyBLWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A09lQJ6r"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Ek2hB440424
	for <linux-usb@vger.kernel.org>; Sun, 7 Jun 2026 21:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=; b=VZFyBLWNd/Q1/Gt2
	R/3Q0qddH8uIz4xr/Vi2dwaYYKBDTMYdvFLyKqfGmTVm+n7b3jJH2ZVadg9w37v6
	oh2t2/rZ/7+YtF+E67j3kAzm5mA+HdMmCv3vcKCY3oIFyZWYWuvQpoiDSa0h4Q5w
	CGj5YXzNnx3ltVgeypqCiTOMGXalehNIEhlnCzrP6Q/AOo5sHwwXvugiEY0+hbP1
	yBdyPbQX3JxgQoNIecF4tfvIBjtiKMFIE0mO34kHVtmPczqZcOweNY7XCAUDMwUG
	69UrqAZRwMiS9Oovk3Q+8cAfzjbDKul8OzF29C0OQPtMLOKc1QVnUATkfA/zCiYf
	x0rK7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cwahy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 21:33:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51772325a64so50268901cf.2
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2026 14:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868004; x=1781472804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=;
        b=A09lQJ6rb9bGZ9zu3xTQtIPWOY9TzXLZr2m3eJ0d3HDjpFZSxepEylsZC10vJvUNjM
         2K6qKej71+8X3gVxJxnF8zNImPDXEr5l8D4el5bbIwTXJm7qeImYj3EQOMqi2jRPYQ/K
         I0ChsUu+1yJwRZV5AptAHu8qm++obfiA89lq1BUJoDXc8P1sQ8WkPctyhliiIjran6I1
         pVkJ3r92yjvRQ6rv34cdse47fsFur6CUHogMC13wO1WX6NHaNEFABAqMGXYqot6w565B
         +buL1l+dUtmHJgei688cooXmMDw7UTAWjhcSBqDq/w76TnYFUay2iAUrFYsSS3o7yMgo
         zUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868004; x=1781472804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=;
        b=DksKbIFTpKQjNCSj7WGpaKgU7zwYL2QHhu65QHge0bIF5CM3P2zZsNdMqygUbIknQg
         v/DdcqZEUuJ+qwSMzkARqaAN32hhETXp0Iuydd6Jw2qENFWWvmdNz8ko+v3fScppgUrq
         mLIBXdHuFy6x9kq2eOfODEEznOHcJhIcG2M6B5xhvsZL0C86kkmzkIWh4bs4hX3ctbUn
         eWjtNqWGF/Nh91a7QKQsqK7UI82PIK8ffvDw9ZJD3nGwxclbZPdv+lqa7WvF94b2WjQd
         GCZY3TbkOCi4KUYwU1KS7ZRZ71LNQw9/VC0yPlZ/lXNuYUNZPYX99RIJBZtGrLZpl1IJ
         2x3g==
X-Forwarded-Encrypted: i=1; AFNElJ/Kvqk39zm1kydKbix2FNmizsAH5pxPFSIhvVyJa0tlErCMXaOZvefcbgqXHWVq/bc87HZhQPe4gcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuXy37RvmDH5eHUmr34vYnPL+jbBcGmn5ajVGYWIFWYyxxOTe8
	/C178W0Y+5WBZ2sJTV1zh/kwc2FqboXsVuZfN67MyMk2t1BvaNBQRTp271LpgOIo/LJlGPTAOuc
	2zYEJGKJS5n/H2TsKbiRLp9pqEmxt5cRTNTN3a1dyR1Lx81d1RQaq15aaUQD8lOg=
X-Gm-Gg: Acq92OH+QJQOOJNuLF2behs0S/mO2D3+C66ZLH/aavWbTR5VqJ02jk3SVqWTSVJ3cYB
	Utr/UaPafwaW5gwu6ukq1oPiMWM+vD8QFFtbaxfUYbrHR4YKyz5eTNsoWvW4zsttLtKGHh8Y9wk
	SauY3aUz9nvNu+7qPwIvs4I+UQCeEpsqJOlv7JgDMzB66SZkqW1gN+sp26DBg9Rg/jDTxZL83iy
	/aUPMSBaHtzYTmUraY0p0oBPUEZOai3EKFfb6xquEwpbVu+QMqBwj+Hxl1VItihoVSP1N4n9+Mi
	wtRLDioUcLp5FEOVQ4IMI5xTUgtueKnqeBhFjsm2um5E3rJhPFloMN+6KcDpCvBlFnXUFhaCcRn
	+YB+DyatcZbDaBnr7iXFzsfA59JxEMB0v9oce/KURfepJFNTX5OBc3nHB/c4i6wAKC7xji0+VWk
	z0sJE8hqUwRuDd8ge3DYyDhKX4kRTpgonF3cwmRNkk7m9Syg==
X-Received: by 2002:a05:622a:20e:b0:517:9157:ecf3 with SMTP id d75a77b69052e-51795be129emr193812321cf.36.1780868004011;
        Sun, 07 Jun 2026 14:33:24 -0700 (PDT)
X-Received: by 2002:a05:622a:20e:b0:517:9157:ecf3 with SMTP id d75a77b69052e-51795be129emr193811791cf.36.1780868003426;
        Sun, 07 Jun 2026 14:33:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:05 +0300
Subject: [PATCH v4 4/8] drm/bridge: pass extra events to the HPD callback
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-4-30b62b335487@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5547;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xv8OK5b4aegzohrbDrEYK2LgkMwGQ21VRNuRHpj/5us=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQTkKDpqt97cyPjjeSFT2syRbXebSWwlKv3
 9mydw2N4yiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1QKhB/0bt9RHhoBHoeWzG982WH5dV54vogSpgf/IUDHcvtgk9lubK9mayJlYBeFGJ0ZIBUpzcs3
 jSDS3jSHxob1NPQdfrE4CuJxL1ttAWQ2ltEvFK8DPvdxL3rlQbWb+3vJ2wBhU7qo/SpXd5LyLzX
 z3dy6ikv1Xe0oxmdeOoeE1pztaMX9L2npVlthrH8PJeArW3Ge2WMtvQkWZiPzykgD2tNH67fE1F
 Zv6WdqrGj1pz42HnAvlRjEQ55aEtrGQjtIoM3K6dDw8hDMs1LUS+1536p77CDkRB/FUNi2mmaXy
 YqZSic4Y4eDW+mUWyoxgu1gPNfex2LX4ve6q7jqYnwxwmFhU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX9GY6bn/sjGRl
 9/pgVdLucmSa4vjMHYfEboHNmJY/pl08rvurrQb9PC9n3eRmsv1gihiGpIx+d8g+N2XvpY+Zc5F
 BYxOewsu63DcNgJCuTRcARd0Tjdl4pG1JEhAMtf8sN0kbVabQrmlIasAJXCZzQFWgYCSDi3022Y
 AnHSp1mbnIrmOS1Na5P7wRZZ5S26hn2q01BspF9JNQ+kaEevBncHqmuh1hyh+00BaYMUWAS/mmi
 bOyJN4O5pU3DsnfZWLUlldzIe0AvTTpkFPyo7xIYMjlyeUURF1ETY3k8C7mf6cGNS+7IeILLTLr
 7wAKeVgzzBEDWmsBncY2aToji/EWa3COs8eUhAY+czQ5Xe6k0gN9TwgmLYbj/CjIp3y1gONvfwq
 e5UefM0lqbxfuWKeeb0DObHUUVeFInf/zkpcRYvSsjacZEF12RrEy+sYcBbR6v7kQJonco8AVC5
 vofVM7IWlvxZl9+73aA==
X-Proofpoint-ORIG-GUID: LdwWGcHI3Pri_b8xSak8rya8yIKxiY_2
X-Proofpoint-GUID: LdwWGcHI3Pri_b8xSak8rya8yIKxiY_2
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a25e3a5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=x0urvBsf9yKnxdYdiaoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070217

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       | 3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 5 +++--
 include/drm/drm_bridge.h                       | 6 ++++--
 6 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index a237c65ebd69..35df99b02c9c 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -258,7 +258,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
+			     enum drm_connector_status_extra extra_status)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 729b12b67470..b8e643cf1d4d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -505,7 +505,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index bf4ab4eaf269..e2eedaaa3552 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
+				enum drm_connector_status_extra extra_status)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 046efd913064..a34643d3ddef 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -171,9 +171,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_status_extra extra_status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+	drm_bridge_connector_handle_hpd(cb_data, status, extra_status);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 84e55db5c1fe..3fd3e7bac588 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1445,7 +1445,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_status_extra extra_status),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1513,7 +1514,7 @@ void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, extra_status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 78b0d83ef2aa..6a5edfda2ddd 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1260,7 +1260,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_status_extra extra_status);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1578,7 +1579,8 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_status_extra extra_status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,

-- 
2.47.3

