Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964A73C3F71
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916509; cv=none; b=Kgxe97ih/nDoOkJsBwlcdYFMvVQ148dkCCQSRP1lZ4p5B4zpcTzIPgNYQDgRnmfkT2a5iAO+r0P5qxLfbk38m05UZRKp3cfKjF9cmUEo89v+qkz63JFKxZhGKdo3D9WWuFWcaQDE3EMoJwa0OU/ohsgOuvZ/nmvptOvO5hteK6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916509; c=relaxed/simple;
	bh=LqgxKNIayCd11yT2swAvULzdCTzONMVvVLs923p01rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obIXBKd4yjtF7L9g00AZ2f6qjuvfCZAvtR5gaMisAXAJ+BcQflegb5+wm1TSn0Iq0575kdzx8tiZriEzyNc+3aFFgp3JY0LuDL4NDqGdvdmLuD6Q4zm72gRNCbrrHC3VOgRxplAfeuWq3QuSCnps1QBLP9QhXuorOuSlWMz5vHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDwitiGU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VR/kYRcN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDwitiGU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VR/kYRcN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBogvx1640499
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zILDMV5aJdTVWYsuq5jrS2SETL41wPGqdO9GUGkM2FE=; b=fDwitiGUAlmn+T3A
	wgOVHrwULnPTDg9jDbWTok799UNFv16tdbaqlNDnLjhMmTZ4b/rU7ICOL2q5n0ZH
	AEDkUcQGXBbvDcKLQBGELs3KXEfYcQzEHcH2eUYXfIpa5OTilkznskHsMWSSBgTV
	A+h/z9K45JMRA616ToMAoA6PfP3WOh1qYXSYGEZQztA+1MFiVP14eezAXuRPcUt5
	ZqlmlL03hNR6ZQgBZgua1syuym1OVKxvGp2EGHog1lVZ7YoxlL2UOtG8Qs4BT/G6
	JMqimxdRVwbv938mTFpEAiGczcn+pNEXuvnZE3zw8fAVJRae1FL+UYbzbs4NOc0/
	lkRxrQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs835s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:01:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79129463bb2so644928137.0
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916505; x=1790521305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zILDMV5aJdTVWYsuq5jrS2SETL41wPGqdO9GUGkM2FE=;
        b=VR/kYRcNSt+4J7hPa+ogRbAYLi81PBu3UJIo3Woa4HVZ3M5xSXohiyXj7IPYu9VhfK
         kZbsTX/vO62NjBiqF0LpbyfqqfKkFjtsLE3YxlSmqUVAjOyQ0tuoz5tOLlrLZsdMrcil
         N1hIJ9zUwWeQvAsiHrXUEXXMpVmL2jSpApX66VVuhc07kN7Zaqf6bJ5N7w067qxKYqwU
         V8gOo3tB+gyNKesOGqYLAC0U0H8/p8kW+jglz/ubnFYk8xXA9dNcyZdmKfj6XEkj9C98
         u5vakwP+Q08gvXSVB8fCpPm3VrkEmzhdFR1mwv8DUIkMdjRa8vFkXqWWsZqTq4JyWJlu
         fsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916505; x=1790521305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zILDMV5aJdTVWYsuq5jrS2SETL41wPGqdO9GUGkM2FE=;
        b=DbzOYZVR/46g6HBMTbloEQxpWRXfD36pPUC5UkK/UYEf4KloKtF68l0GpDXcCYzNzX
         AOHNdVDVxWTois9dASb2iRTw+mf0F8ov3mSC3VBCXcZHOUsHxW52ov7VgZGN38VXmcZt
         fusXHrReqYGNJJUH0pYurMYdesPBVTIzfPoQtsMEysSvlfZRlmOfdahruRpLafnTi52d
         GSU8o494QSCHFeZMeZ+EnnpajGOMBXsHrS5pxlsvdquvhn7GStjrIJrlx0G6xfv5DN96
         X7K6RtHGV+/lO/W542BsMo7FeFSMRTv1QtRERpHL92pTN368uY7jKhOi3cGu19zaiu/O
         hN0A==
X-Forwarded-Encrypted: i=1; AKwUvBwniKRP0DdMS54EX1F6LfG/g8nNE8V/ga4l85oXcMirUwmmkaji7FJX9P5ny21nfgr/6Aa8+mRChLY=@vger.kernel.org
X-Gm-Message-State: AFuF++m7jMySC5owZI4GeaXCwWxdWSUaMi5Xri3lPfOOglTCH3dtaDBM
	0JEEVf1PJ3VYlGsW1/X5FYaeF5XKueUiVVRBCCI701RGzI9z6VJ7GdsSumQ1swMTj6GfbbKXAbA
	BWoA2Cn70sRaX6IhdTEkFRJoDoZPKdlo+1kD6bkWX0cRqC08Z25YDxBXCvSFZU5c=
X-Gm-Gg: AYBFou1DuWSveLeaqMKM+wkx8wCmgZGZEQfepxPswlO2z2LiHQg6qe0rzOY1VLT9NvU
	v+l5anvgaS6ppFdMBbyfonn8F2bOZ5qTv60HPBJjzb9sCsV11+bDG1mwQjscODjoN2NTP5Vm9aq
	R7m3llwK80sTDEcjA45zR2IL0aG8LcV1a3HOgcDKgfTEiZCbauiVuD1Betvt+ByDRkJCWZSnzJ1
	E51i+u/cZeAOvFCVtYIFqZeYnKPVIJCdhHTCLGaffPFOBX1keIyY2tiQ2lPi6TtZUr2cl2o7MXi
	sncgBfZ0i2lJhvRUTVLQnGeKtf8or6Ms6JJ2kxS3p5ia3/xpZmmjzTLgODPEYIItGfC+bN4Sb/p
	BHLwNbVcYbn5glppP0T+ac1WwXoJfvPrR9O+ALo/Uu+tDcg4J/BW0WwQ5+MmgJRoGFdNC5uZKhP
	Kx26/h1HhNc955
X-Received: by 2002:a05:6102:148e:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7a7196a9b84mr1109489137.30.1789916504270;
        Sun, 20 Sep 2026 08:01:44 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7a7196a9b84mr1109380137.30.1789916503710;
        Sun, 20 Sep 2026 08:01:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:30 +0300
Subject: [PATCH v5 5/8] drm/bridge: pass down IRQ_HPD to the drivers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-5-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
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
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LqgxKNIayCd11yT2swAvULzdCTzONMVvVLs923p01rQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VH0X+ZgDiNdgzP7ztTorDWrfF/sYFMWjIJ+
 AFYEh8ij4KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1dpmB/92Rev8krCBc9OkmzcO4nICFFJMqs1wwor+LYDE1FIuzYroa9qKYU+ewIsPOeIt8K8t7Hp
 Gxp6nAMJTPtAjZdxhgkdecOWQfp4RIJhtTsa3ahM4r8zY5uuXzrEaGYJ+ZGNb6j8FtRUK8EgEiP
 hOpLZguncW4ZDHTzc3E02aMh1s5I/f7f2CCqHzJRxB+H5rYG4EXSBWER3OuELSZ2vqKLTcEqQeg
 y1KaNlpG72U/h2VtMdheehS2cDOllI4OKq/e3bBGrsryLHSF2rSVptWk/gJ9j+M8heIaZdyT4oT
 9ardZe07B+qSesrCWyyiQcefaFdPO9NmF0V/cmMAPR2I2+bi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Xt9V7tgD7vA0QWrdGAPMB18K87dqoUo0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX6riGQsfqBv+3
 de0xkifuM/F2ZCZsESrvy+hBfMwQRapCnfYuXCmGgeeFJDwOwDfP0qvJN6L5CKPWaruC/Apm+XP
 Ye56LUe12ae40IuKou9PpQYrk3CbD3E=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaff559 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX7GTd5bBFQZ1j
 BKhN+aR2ZDiCng6B3LiKYt2Jwe2+JKm2NsMB1unD7nUfQig0qiZR2/kMOO6g63zJZ/Wgmfd9ju4
 w6Bgzg6TP8Ki5vBLVZ9IK3/pmkQuvSwWRB1SE0xGZ/rTLNrRDfv32OmEKNP8TmZFn7qXenEmtMa
 frbvrscE6GvWH0xOhZO3qdNL/sN2G49IqjAI+/i+VyOfvVAl8byC6X2UqwGOZEKqozQRM87BJOf
 oolc7P/hiz3lfJca+ruGDjwpY54IAW+IUUDJQLcRUHmi8ZXu+s+F2aZMN9VJU7NqZhGrUkUTOZx
 n3rAvKZkP4v6Y5jcmqgAz9O5D5kjecQhLQS020sqy5h+Vfj+zBk/6JWvrL2Yok8ryx/19BhdlYI
 n0a6X5mLVdxoh+rhavsnnZTsYDNOz2zMA8ocIZbntcUc2c6trp05WwCI59LdBnrorb7CjRI/IT8
 EgE/QS3DeF+/ZWwcqCw==
X-Proofpoint-GUID: Xt9V7tgD7vA0QWrdGAPMB18K87dqoUo0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side. Pass down the extra status to the bridge drivers via the
hpd_notify() callback, letting DP bridges to act accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b3bb7f2cebb3..b1ffbab89a16 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index f8aa2dd1cde7..083d70017f02 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -150,7 +150,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, event);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c4355c5cc340..a637613ae2e1 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  enum drm_connector_dp_event event)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4dcbd9b99d06..9308e373447c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1540,7 +1540,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index da412c788503..8f2f4201da60 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -31,6 +31,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index ea0d749265d1..47fb10628125 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -430,7 +430,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index ed9f77a2597a..2b3cad4bedde 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -509,7 +509,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   enum drm_connector_dp_event event);
 
 	/**
 	 * @hpd_enable:

-- 
2.47.3

