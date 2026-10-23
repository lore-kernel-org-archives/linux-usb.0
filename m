Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762808;
	b=NWT5QMabzWv+sFD725BgasGA7kQSDtBJwha3sZlTqSTE/TQL1/1qpFkVCFWPlO9Z8BAF
	 Rq0re53GNiJPW708exBqqjOYz1to4xBx2bEl2c3eyonoXd49f4wsP4cqfJfABLvQke8mn
	 hg/pJvtGhxX85KczwW+3a5cDEoi+dBUX+FspL04oo1+4k0W2rps7Jr1FcfIWS1yACh+oO
	 Is1QMDxB33glKa3yNzs6HhJW6jlnDhNozfaUZc6e0W96ksmf6BdZKErywJi6yX1bDzR0j
	 oTpbfeCCfEA+A4hvz2M9O2pYEoyu8BhJfYgFh6KIr6zOlGjUMSQCPsHWymP+jpCHYSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
	b=DLvUj+7DoX0OMGQfJi+HG70gjrKwbe1aY4zMUjrVJWuUoRh0u79kt9EChJFWO8u67zKR
	 e2HE3h9ttJEFubuusETtnHpwTTLi5/F7WDGJ6Ua278XL6myi1iDMvNcltzQLMq8fwZssm
	 6uNdW1UZo/QzLBk73ODLt6DOr2rY1Q1jyFHYgbTkZTSwygGsUiRQDL7fdff9NX0/pmc/6
	 wvhuTfFRC2dTZA3256BuYQZv06s1lckQ5EEaUWYM6Q1Z5WFlLwGvKeq8sWurZZVhm1N7P
	 YU1pETXBxiFW19E4QevOFIttQiyE8BW7W5MYeSCnQyHhq2Nh/OCtief72Ab6qyeMaPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P31PHVwR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UeCzmUwo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23137606A31D
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23137606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P31PHVwR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UeCzmUwo
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYTW1948474
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=; b=P31PHVwRYQccQJp1
	YfPvdd/Rx+B9YnicsQlLcEXxmsSxZ5n6IA8SKCfiUcq9orWx17kPS0yJvrS0lzLj
	2EX0QTOCKKkoayAYomTYY+fZ/9CtG/5WmfJrAF/KU1RomeuJy/K+fbQM99ABgj8s
	gtDvq4PdhITMMgp+uUG+t/kvtsmaW6jdPKzsziZwPf5IjHG6pdrLgT5yzY0UM/Gn
	CDgbXdTbS+gtI1bAuKbg3jZ1l5Gi9CD461QuXeR5I5SRQg9ebbFbTdxsS0l87zh6
	us3JRiSasCicKfsM3QHkARmdF8aivcn7xp4ugtbTDZQenRiZkLsuLXM6xXRdv6JL
	V7lUQg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtuwus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:40:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c25513b2aso19458416d6.3
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762806; x=1793367606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
        b=UeCzmUwou7EJM5r0rvU+orsh9ajz6mhALtkzBF3rsXb+0DOxTFTxjBB7cA4fcKlmEb
         8qC9dCciIrk+PkAryhVBhLwJbFAdGF5u8Qxq/S5hy8qSfflJpPW1zdXdqQ+1o0dACWVD
         OuTm3nlcJO9FFv9vE50S+DZ97CaYWDFaol+Ebm8lMI/yX3NjLzJ1/OlET2xdubFprfIT
         JU56F5UgbHPkc2uFUF267+TDo3grdKWaJe1UHjZDLnJW1JZwb/dtERcc1lX6tOaTFaqu
         IJKYWMhIF2YeRX+LdMbcT9uDifgzyeLRH9yTypMfWhtgiAY7yjxENDw7EorVooGAMA3k
         2PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762806; x=1793367606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
        b=1JhvTpYDCq5vs6gf4igSvVsOCkEqY79goEsHAbpcpOzzZR7fcoY7YdBLJ4Gs8vOuqF
         xCdrbT1ICdYcpbZybJbGJqkimKCaZGCL9Tw7OC+pjaHm76H+p7tPQLVqJnhU/Ud+D0KN
         JSQVy9BDqGaB3DV1we1bZuEy9rrDX2ONXDQCMXBo6BvzwAgLzRe04nwe8HEIDL0pFQYZ
         Rnntoz/6baQYZdXVvzixTQYCGwNVUnTfV1MGOlKbUmjYmQSy03mBlFrgbSP21m93Lgk3
         u8dYKDlF2deerv7y3oklos1l1300el+4NHLJH3CXN9/L8aGdoqkJHAZ7Oz79KthkCnek
         GmJA==
X-Forwarded-Encrypted: i=1; AKwUvByQ649NUTbXSQQO4PHYV1u7p8drOK28F+fxyu0EuyjoPJyoFp9kt7Er4atBm3LwYD9F3HkjXUo+Xm8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+ZThyw/WaL7FWCq+tk1J/eGUotmanSTmUwes5ydhhrF5fyp+o
	3RFGXLOH6HBafyK232ZvqBbPNHl1UTMmK41pJRYS2PebOvSOXnG/IiPAVZMGjrZ5ZFrTlViuy6D
	KfSVfgWVc9vZsIZZa4GiamsTiOhFM9QizFd/yUczrzPpu28OJOKOIwIYnI8GFAOE=
X-Gm-Gg: AYBFou346x1QiBkG9yWK6YNNeMbiHHMAPdnYJ/P7WIM4ll9hOSkU8w6HgIxevRYMFWq
	tBztrY7oe8aD8xJF6MFGe1vfYN/6jvKId082DshCvvbvVQLbA67u/0a4+B3lH9JFDoFFBCP6oXK
	b2y+vKUcjvIPF/h7b8fAA4pXHmII+r8IZ0OyWJ85l+Ufl4TmocSbT6LSDHdVLVYn2BbRHHMcskV
	IdxN47T4fAuSESHyhtvq/5XDpWHCoOkmRy2itgoNFEuzkzve4I49JwomaB7zPwJ/yq+kuaw7ZPv
	wqVfHvdc41/zHjSpj7Z7njV9BqwVRC6V1EaU+o9YCYWMPOvfuNQEQ9yMIM9iLrVvvgdZbHsX0FS
	Dbg4IVVGwTrh/2dFkEjo4bPe6Nln6ULTc0GTgR0/wN4e0JJgHdVi8XkprgrAPh5BxIwqgy2J63T
	UQ5BPeIKmLQuLW
X-Received: by 2002:a05:620a:2853:b0:93e:7ddb:7b99 with SMTP id af79cd13be357-93f6f58a84dmr402127085a.3.1792762806107;
        Fri, 23 Oct 2026 06:40:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2853:b0:93e:7ddb:7b99 with SMTP id af79cd13be357-93f6f58a84dmr402118285a.3.1792762805414;
        Fri, 23 Oct 2026 06:40:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:41 +0300
Subject: [PATCH v7 1/9] drm/connector: report out-of-band IRQ_HPD events
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
Message-Id: <20261023-hpd-irq-events-v7-1-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OlyhiT0RO9IWSdSg1DRyrcjCs61eY4Y2GSK
 lHqYSLDYzuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjpQAKCRCLPIo+Aiko
 1VLdCAClXvDTBPnhRvI1lJ9bpuggop2DWVbS3MG8bSQOkxNuUpinFzUppZ/zhOAVB0niRaRzdj0
 kOfrG054ct0eGQkog9cVyySdnKEtOt4tMQCUeclGNKSMvgKfftnQFDWAGyfvGAuarqnNP4i6Dmh
 36AHtDqAGYMzPNu2DQm+1kkW+bFNcd7dWD3AasJ0mDTSm47YteRkuZpUm29T7M2YT7jDpWmanTg
 aOCAvJrs+vvkDxhwqVbVFwWOaoAziNZL/3tNIKn8vu+i7+sc0qaDOEvE6QqIvCrhC28yLbOuQsP
 RAjC+3uqQk0VB2Aaw3AmiYEuh9yU3Z5jWhBBeEKh3zOXFVVe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb63b7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=IejCAnqV6A546-KFDggA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Tju57h9XNzUvhgYHMAVdjMwbIsIsIw_8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXxjwBZ+3JyQad
 tDY7ykVx0ybz/520hzvaeeLChUAG2VEhCcR8cpkCCDDG4VZgEeeZwozPcxpG2Ipuj/jp6eerp0Q
 HezfnWf97bhL8ZUHA5IVvHRCIarU3Ync5p2+K2LRZg05BVj4kNAjNMi4Z2CFifDYLpxF4yEbXiL
 jjuQdTp7TVISVBHtmG5ONv2fVT6EsVPf/EbblZ4rlpQaICpJasb5k1Zo7yGspm68iXihlBBALy7
 tIsGqS1hJNK1b4Hmf7OCGhU8B9W5YBz2JPz2NsH7ubeI42f07i0WBP0jKdyxD4adCXq8XsZGEGX
 U9rsBkqw+labu/ydJpxEAFkytu/q5nUG1GDJOqJQZWlEBSPKL1dwhM/YjGYAVl5+TdtdHivlU7g
 7Q3fV1jZvrBw6/DYuJnLtEJ9BcGrRahqmprIDJwUO/f+S1ECUr2gpp7zmYH3Sm199e+65SLdLQR
 pV0iD9SiMsQPKhJ3nnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX3iMnU4J+1HB2
 o5qJXC3T8oFSjyyGZPSs88FKouo8owL3Yh6gkYGRKOnjezg5kuWpAmR9DnTK+0cAec7gGDx6Qvh
 87jstqpJg3TkZgeeKjPqP6anDIAZ62g=
X-Proofpoint-ORIG-GUID: Tju57h9XNzUvhgYHMAVdjMwbIsIsIw_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053

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

