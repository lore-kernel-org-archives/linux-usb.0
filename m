Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C6F4AA1FC
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266184; cv=none; b=ptU92QWcCU+O+iKvX6H2m8HFFnC4+sPtYEj3xTkU7elugMAD3eIcgdHtWJ931j0f1sacTlRtQaDHyJJSKYooy95iXoKe80grqPuoUpN3TZx0EyNx2qokpVw9rX9xH3TGAwueaaW7txIdcAAHxRRAroveEEBU2MUpX2N5Bw+SQmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266184; c=relaxed/simple;
	bh=yZuZnDmB2XU12xUvw34J2jPy0s4woCbAWW0IAWk5q4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQYbZgioAIw7h6l+oHzoAyZeEcfY6XwXeMkFyKktzSs+Cv5ATfyT9W/EeXeMv9j4x8qZ+nT8lVpnTGNiWA2oAewDfbHpEVmW+QRUml7HnBaNM8vdvTWogx/OIJbtGtO+dHT07snhmG0zZVl4QAh98zrNApvaWVi91MWyjv81hG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2/QIBmV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kIb6oPJt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2/QIBmV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kIb6oPJt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeLqc2101455
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z9WuxcAi8q8
	ZfBIJfKM3e6KFMJ27OQbwX6JNe3SQzDc=; b=E2/QIBmVOsVIW6ug77ZGNrxi5SK
	0ftyX5hFdwHZIsZoWqlu5BcdvndGTwItsZP4obHS1cAqsLQjnbIOaxpUYBuWfn5s
	wpnZjmjtvtF3h5cF4ni4Wd3pE925TMK9enonKni5xMmDTQ0n/qBBSoO305EDISd1
	sFvOeXHKuELt+HkEUaNkAzGF+0xbJaVn0cW7BvVedkOv2Cl19CTPZupDM/NLpDsa
	PnvFYEMmwMgX0itsDqVBMLcp+zfJo0GstWSicP+lxpDANlqhJ0YKzb6vuwh56NH1
	x9MfYB+FyerfChR0ssVLqfqVr2716qTzEwfcEk1Unfdfa2YgShPYNczCrMg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e0axh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:09:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-79129463bb2so704404137.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 09:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266181; x=1790870981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9WuxcAi8q8ZfBIJfKM3e6KFMJ27OQbwX6JNe3SQzDc=;
        b=kIb6oPJtxVi3hMMV1tyVOZQ8WI0U/9VjzThxcho6leNBmx2hoOnUAoGZG2HOEaHUM1
         qfu3fjO/6AfPlnXgw8O9bam/STD8Hzq9dYEZYoz7DrxEIEQDFNMuwCSTM5KLUqxxrVyH
         VgZzRKW5M9O5w9AEBA+lyR3TkMX629fBcpYpF9NLK+TxM17p4P0PEw0GFjPSAiFtTFwl
         4533BEQrGjl23/EQxq3us1WHKjy+hFeRlgf+sxQDZxeYggWDrW2Gz42pZOcy5qqmMvch
         mdYQS1E4RNO+ictSL5n923wfJywJJmDfw3Lb2wlbk9uBGPGs9S9Wv53cNhlO0fBgN7cs
         B3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266181; x=1790870981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9WuxcAi8q8ZfBIJfKM3e6KFMJ27OQbwX6JNe3SQzDc=;
        b=CPaAHfe5nEJq/ZpcWSKgIPynXsSCNXmj0sg/28XuBPpoZj+Wrx0uFI4Wn+vDW++p4T
         7WQcj6SLo0JUSYVIVqkSwvXzaOrCN+exls7NCxbPazBDuzBb05aW7mN89XrFbs2cuy8f
         HaoJD95jays0h0qirNLn/qOflTbt4/RmXwf3uRHmBZQ210TtRCxB0YtpCTfh+OMoLKbJ
         3YFV8S0BMx4C+Cv78omqO+osJZvGHDSjyumIFo/goh78a1lIpdDDdpjlgYGmf7MX4l6F
         dBW1cWl4+sxLJA1quzxbfvDzzDdyqGBlSGczeKB9XOUTQ7QB/JAbz+B7zNmeu6fo0cLT
         bq2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQ5CnSK4eSXvhRwUOLC23+ALWYEooHftmRv3j4c+ug4I9bvw0xKUnigZ0Fl1Eglhr2CsqilRGXIvA=@vger.kernel.org
X-Gm-Message-State: AFuF++lVRNqshqNiitKvlim0uRY0y1jdd8r0zaYvOeD+HrRYYAfEI8P8
	1E3K+Ilye8k382o2cBxZwWifTAg9PlJdBueYjxAzgTvKKnVWSnLUpRpX3BCCAaxq9ld5+lFZltm
	j6AWTJSHeA3PgG2M8y+qI1IjWPPcZrp9hK04WeR9BLMJ2vCAMysWqSO4jCOi+/ZE=
X-Gm-Gg: AYBFou30aQ2f+xHTEsJ9e7ctih3Ds98WQjI07OvW1VY8QqLG5bbTVVH6fJsdT2r5uRF
	etDBfSeAenNjxu6kZzDMClPbUhhmbrqOwB3BqQqA9cy51ubvlR86CBrBwFW4h7ayKDhs4J1hKYY
	cl4mv8X5w0xiLNeG4sm/uw3kHYZH78ItgHB3YA2ix1JiMf+KZHUXcv7+Gee5E8u/F0CTbAV4kkP
	YjZ8wdyuSXa8BrrcHL77X/o6LnuB93e0zShmDVas6O073gl4/n6Rm3clQUti4jUG3h60L6Qk4XU
	a1I+kNq4mesQsfJsNAJQWKDXoEbraTX6WWxEWOhx9KjGM7HYABEPr3OT3rnzdyNpc4I1jt1fRd5
	N19sHmr5nJ4xmKAigH8VVYUK2YEVZlS4=
X-Received: by 2002:a05:6102:3e8f:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7af1f1fe5d8mr1501088137.34.1790266180624;
        Thu, 24 Sep 2026 09:09:40 -0700 (PDT)
X-Received: by 2002:a05:6102:3e8f:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7af1f1fe5d8mr1501069137.34.1790266179949;
        Thu, 24 Sep 2026 09:09:39 -0700 (PDT)
Received: from QCOM-WFsSr66Fqw.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5c4csm328306766b.18.2026.09.24.09.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:09:39 -0700 (PDT)
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: virtualization@lists.linux.dev, linux-usb@vger.kernel.org,
        Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>,
        Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>,
        Anton Yakovlev <anton.yakovlev@oss.qualcomm.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Subject: [PATCH 4/8] virtio-usb: add OTG role query support
Date: Thu, 24 Sep 2026 18:09:03 +0200
Message-ID: <20260924160907.145405-5-igor.skalkin@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924160907.145405-1-igor.skalkin@oss.qualcomm.com>
References: <20260924160907.145405-1-igor.skalkin@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX/J3yOmjFQXR7
 Zk6U0tZpaK4C1UOqbONQwN6Azpw8Ck3Pd+VtbVu6yn8jFaMbZ9Hm+3TE1Tpt7YOheTeAq09JFX+
 d01IyGRlq7PK013lGTodHxrZ7Pd7TbUQjsSR6Df5q7KGUlXO4YMHgsb1hcMD/iTs535ZDQ9SXdz
 0mXCPtffl2dg1Qjm9MJN6Rgwfh3bJzwISiHtY3fMaU+Rc8Ogmbmscf7TabevKQQYHqDYTSAJEik
 utb+kcfnvTtIHfRRGyEM7jsKklznQEEZiJlq+w4m59v9iOd+boXzMDq1saBDnYj9mkvBGsS3ytp
 CHt5rTCtsecwXoVLUcrsXrpIWLRf0okhN+/Ray/GYi3WEx0mqt/M61GHTuElQKoH3d8glHzNh+3
 DLDOb1DP5gwDAhxCbi18YlwT2FZUEkKvwvA7mcheHLpAWadiS++hts3oI41UNZj/7fF0iLeqKSh
 j2bZtLUDT8h+zv6xDlg==
X-Proofpoint-GUID: 7QMB10A2TzIu-fQAYOFfNeHOPMwf5NZm
X-Proofpoint-ORIG-GUID: 7QMB10A2TzIu-fQAYOFfNeHOPMwf5NZm
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab54b45 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=CdQmqEpji_9vp7disPIA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX5vEhBH6oJ2US
 Wer3T+EBMPjz3dxdYQgpuAOC9da86CiKHtBps8JVaMsC+13tdOWhB3PzrOY9wdG+4rEcPoilwM7
 i19VVQhX2BSburdprOZAxIbpAAvBqzM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240066

With both host_role and device_role negotiated, a port's own role is
ambiguous (host|device) - determining it requires more than reading
the two feature bits. Introduce a minimal OTG command/event queue
pair (otg_vq_base, otg_vqueues[], otg_init()/otg_deinit()) and
otg_get_role(), a synchronous VIRTIO_USB_CMD_OTG_GET_ROLE request/
response exchange, and query every port's role individually during
probe instead of the alternative of overloading the config space
ports field with role bits.

This replaces the previous commit's DEVICE-only placeholder for the
both-roles-negotiated case with the real per-port answer.

Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
---
 drivers/usb/virtio_usb/Makefile     |    3 
 drivers/usb/virtio_usb/controller.c |   87 +++++++++++++++---
 drivers/usb/virtio_usb/controller.h |   11 ++
 drivers/usb/virtio_usb/otg.c        |  168 ++++++++++++++++++++++++++++++++++++
 drivers/usb/virtio_usb/otg.h        |   26 +++++
 5 files changed, 277 insertions(+), 18 deletions(-)
 create mode 100644 drivers/usb/virtio_usb/otg.c
 create mode 100644 drivers/usb/virtio_usb/otg.h

diff --git a/drivers/usb/virtio_usb/controller.c b/drivers/usb/virtio_usb/controller.c
index 0646807..59af5cc 100644
--- a/drivers/usb/virtio_usb/controller.c
+++ b/drivers/usb/virtio_usb/controller.c
@@ -12,6 +12,7 @@
 #include "controller.h"
 #include "host.h"
 #include "device.h"
+#include "otg.h"
 #include "vq_common.h"
 
 u32 virtio_usb_cmd_timeout_ms = MSEC_PER_SEC;
@@ -130,12 +131,12 @@ static int virtio_usb_probe(struct virtio_device *vdev)
 
 	/* Only allocate/negotiate the virtqueue triplets this instance
 	 * actually needs: HOST_* only exists when host_role is negotiated,
-	 * DEV_* only when device_role is negotiated. A pure single-role
-	 * instance therefore has exactly VIRTIO_USB_VQ_HOST_MAX (3) or
-	 * VIRTIO_USB_VQ_DEV_MAX (3) virtqueues, not a fixed layout - queues
-	 * that don't exist on the wire must not be created, since a peer
-	 * with no host-role VP has no host command/event/data queues to
-	 * negotiate at all.
+	 * DEV_* only when device_role is negotiated, OTG_* only when both
+	 * roles are negotiated. A pure single-role instance therefore has
+	 * exactly VIRTIO_USB_VQ_HOST_MAX (3) or VIRTIO_USB_VQ_DEV_MAX (3)
+	 * virtqueues, not a fixed layout - queues that don't exist on the
+	 * wire must not be created, since a peer with no host-role VP has
+	 * no host command/event/data queues to negotiate at all.
 	 */
 	vusb->host_vq_base = -1;
 	vusb->dev_vq_base = -1;
@@ -148,17 +149,15 @@ static int virtio_usb_probe(struct virtio_device *vdev)
 		vusb->dev_vq_base = nvqs;
 		nvqs += VIRTIO_USB_VQ_DEV_MAX;
 	}
-
-	/* Resolve every port's role. With only one role negotiated, every
-	 * port unambiguously has that role. With both negotiated, a port's
-	 * own role is ambiguous until a later commit adds an OTG-based
-	 * per-port query - default to DEVICE for now as a placeholder.
-	 */
-	for (i = 0; i < vusb->nports; i++) {
-		if (vusb->host_role && !vusb->device_role)
-			vusb->vports[i].role = VIRTIO_USB_ROLE_HOST;
-		else if (vusb->device_role)
-			vusb->vports[i].role = VIRTIO_USB_ROLE_DEVICE;
+	if (vusb->host_role && vusb->device_role) {
+		/* The OTG command/event queue pair is needed whenever both
+		 * roles are negotiated - it is how the driver asks each
+		 * port for its actual role via otg_get_role() below, since
+		 * a port's own role is otherwise ambiguous (host|device)
+		 * until then.
+		 */
+		vusb->otg_vq_base = nvqs;
+		nvqs += VIRTIO_USB_VQ_OTG_MAX;
 	}
 
 	vusb->vqueues = devm_kcalloc(&vdev->dev, nvqs, sizeof(*vusb->vqueues),
@@ -192,6 +191,18 @@ static int virtio_usb_probe(struct virtio_device *vdev)
 				dev_vqueues[i].stop;
 		}
 
+	if (vusb->host_role && vusb->device_role)
+		for (i = 0; i < VIRTIO_USB_VQ_OTG_MAX; i++) {
+			vusb->vqueues[vusb->otg_vq_base + i].name =
+				otg_vqueues[i].name;
+			vusb->vqueues[vusb->otg_vq_base + i].callback =
+				otg_vqueues[i].callback;
+			vusb->vqueues[vusb->otg_vq_base + i].process =
+				otg_vqueues[i].process;
+			vusb->vqueues[vusb->otg_vq_base + i].stop =
+				otg_vqueues[i].stop;
+		}
+
 	rc = virtio_usb_find_vqs(vusb);
 	if (rc) {
 		dev_err(&vdev->dev, "%s virtio_usb_find_vqs() error(%d)\n",
@@ -199,6 +210,46 @@ static int virtio_usb_probe(struct virtio_device *vdev)
 		goto on_error;
 	}
 
+	if (vusb->host_role && vusb->device_role) {
+		rc = otg_init(vusb);
+		if (rc) {
+			dev_err(&vdev->dev, "%s otg_init() error(%d)\n",
+				__func__, rc);
+			goto on_error;
+		}
+	}
+
+	/* Resolve every port's role. With only one role negotiated, every
+	 * port unambiguously has that role. With both negotiated, query
+	 * each port's actual role individually via otg_get_role(), since
+	 * it is otherwise ambiguous (host|device).
+	 */
+	for (i = 0; i < vusb->nports; i++) {
+		if (vusb->host_role && !vusb->device_role) {
+			vusb->vports[i].role = VIRTIO_USB_ROLE_HOST;
+		} else if (vusb->device_role && !vusb->host_role) {
+			vusb->vports[i].role = VIRTIO_USB_ROLE_DEVICE;
+		} else {
+			u32 status, role;
+
+			status = otg_get_role(vusb, i, &role);
+			if (status != VIRTIO_USB_S_OK) {
+				dev_err(&vdev->dev, "%s status(%d)\n", __func__,
+					status);
+				rc = -EIO;
+				goto on_error;
+			}
+			if (role != VIRTIO_USB_ROLE_HOST &&
+			    role != VIRTIO_USB_ROLE_DEVICE) {
+				dev_err(&vdev->dev, "%s port%d wrong role %d\n",
+					__func__, i, role);
+				rc = -EIO;
+				goto on_error;
+			}
+			vusb->vports[i].role = role;
+		}
+	}
+
 	if (vusb->host_role) {
 		INIT_WORK(&vusb->vq_host_data_rx_work, virtio_usb_hc_rx_work);
 		INIT_WORK(&vusb->vq_host_evt_work, virtio_usb_hc_evt_work);
@@ -286,6 +337,8 @@ static void virtio_usb_remove(struct virtio_device *vdev)
 	virtio_reset_device(vdev);
 
 	vdev->config->del_vqs(vdev);
+
+	otg_deinit(vusb);
 }
 
 static const unsigned int virtio_usb_features[] = {
diff --git a/drivers/usb/virtio_usb/controller.h b/drivers/usb/virtio_usb/controller.h
index ec59922..4d9e0e2 100644
--- a/drivers/usb/virtio_usb/controller.h
+++ b/drivers/usb/virtio_usb/controller.h
@@ -18,6 +18,8 @@
 struct virtio_usb_hc_vp;
 /* Forward declaration - full definition in device.h */
 struct virtio_usb_dc;
+/* Forward declaration - full definition in otg.h */
+struct virtio_usb_otg;
 
 #define VIRTIO_USB_VQ_COMMAND_IDX 0
 #define VIRTIO_USB_VQ_EVENT_IDX 1
@@ -25,6 +27,7 @@ struct virtio_usb_dc;
 
 #define VIRTIO_USB_VQ_HOST_MAX 3
 #define VIRTIO_USB_VQ_DEV_MAX 3
+#define VIRTIO_USB_VQ_OTG_MAX 2
 
 /**
  * struct virtio_usb_port - Per-virtual-port state.
@@ -54,6 +57,12 @@ struct virtio_usb_port {
  * @dev_vq_base: index into vqueues[] where the DEV_COMMAND/EVENT/DATA
  *               triplet starts, or -1 if this instance has no
  *               device-role VP.
+ * @otg_vq_base: index into vqueues[] where the OTG_COMMAND/EVENT pair
+ *               starts, or -1 if this instance has neither a host-role
+ *               nor a device-role VP. Used to query each port's role via
+ *               otg_get_role() below, since with both host_role and
+ *               device_role negotiated a port's own role is otherwise
+ *               ambiguous.
  * @vq_host_data_rx_work: Kernel work draining the host data queue, shared
  *                        across every host-role VP.
  * @vq_host_evt_work: Kernel work draining the host event queue, shared
@@ -73,10 +82,12 @@ struct virtio_usb {
 	bool device_role;
 	int host_vq_base;
 	int dev_vq_base;
+	int otg_vq_base;
 	struct work_struct vq_host_data_rx_work;
 	struct work_struct vq_host_evt_work;
 	struct work_struct vq_dev_data_rx_work;
 	struct work_struct vq_dev_event_work;
+	struct virtio_usb_otg *otg;
 };
 
 /**
diff --git a/drivers/usb/virtio_usb/Makefile b/drivers/usb/virtio_usb/Makefile
index 2222222..b7ee9e8 100644
--- a/drivers/usb/virtio_usb/Makefile
+++ b/drivers/usb/virtio_usb/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 virtio-usb-y := controller.o \
 	vq_common.o \
 	host.o \
-	device.o
+	device.o \
+	otg.o
 
 obj-$(CONFIG_USB_VIRTIO) += virtio-usb.o
diff --git a/drivers/usb/virtio_usb/otg.c b/drivers/usb/virtio_usb/otg.c
new file mode 100644
index 0000000..557dfae
--- /dev/null
+++ b/drivers/usb/virtio_usb/otg.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * virtio_usb: VirtIO USB device
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mutex.h>
+#include "controller.h"
+#include "otg.h"
+#include "vq_common.h"
+
+int otg_init(struct virtio_usb *vusb)
+{
+	struct virtio_usb_otg *otg =
+		devm_kzalloc(&vusb->vdev->dev, sizeof(*otg), GFP_KERNEL);
+	unsigned int i;
+
+	if (!otg)
+		return -ENOMEM;
+
+	otg->vusb = vusb;
+	vusb->otg = otg;
+	for (i = 0; i < VIRTIO_USB_VQ_OTG_MAX; i++)
+		otg->oqs[i] = &vusb->vqueues[vusb->otg_vq_base + i];
+
+	mutex_init(&otg->lock);
+	init_completion(&otg->completion);
+
+	return 0;
+}
+
+void otg_deinit(struct virtio_usb *vusb)
+{
+	struct virtio_usb_otg *otg = vusb->otg;
+
+	if (!otg)
+		return;
+
+	/* Wake potential OTG command waiters before releasing OTG objects. */
+	complete_all(&otg->completion);
+
+	vusb->otg = NULL;
+}
+
+/* Send an OTG command and get a response.
+ *
+ * The function is implemented as synchronous. Design pattern is
+ * virtio_can.c/virtio_can_send_ctrl_msg()
+ */
+u32 otg_get_role(struct virtio_usb *vusb, int port_id, u32 *role)
+{
+	struct scatterlist sg_out, sg_in, *sgs[2] = { &sg_out, &sg_in };
+	struct virtqueue *vq =
+		vusb->otg->oqs[VIRTIO_USB_VQ_COMMAND_IDX]->vqueue;
+	unsigned int len;
+	u32 status = VIRTIO_USB_S_ERR_INTERNAL;
+
+	struct otg_get_role {
+		struct virtio_usb_otg_cmd_hdr cmd_hdr;
+		struct virtio_usb_otg_cmd_role cmd_role;
+	} *msg = kzalloc(sizeof(struct otg_get_role), GFP_KERNEL);
+
+	if (!msg)
+		return status;
+
+	msg->cmd_hdr.code = cpu_to_le32(VIRTIO_USB_CMD_OTG_GET_ROLE);
+	msg->cmd_hdr.port = cpu_to_le32(port_id);
+	sg_init_one(&sg_out, &msg->cmd_hdr, sizeof(msg->cmd_hdr));
+	sg_init_one(&sg_in, &msg->cmd_role, sizeof(msg->cmd_role));
+
+	mutex_lock(&vusb->otg->lock);
+
+	if (virtqueue_add_sgs(vq, sgs, 1u, 1u, msg, GFP_ATOMIC)) {
+		pr_err("%s virtqueue_add_sgs error\n", __func__);
+		goto exit;
+	}
+
+	if (!virtqueue_kick(vq)) {
+		pr_err("%s virtqueue_kick error\n", __func__);
+		goto exit;
+	}
+
+	while (!virtqueue_get_buf(vq, &len) && !virtqueue_is_broken(vq))
+		wait_for_completion(&vusb->otg->completion);
+
+	status = le32_to_cpu(msg->cmd_role.status.code);
+	*role = le32_to_cpu(msg->cmd_role.role);
+
+	if (*role != VIRTIO_USB_ROLE_HOST && *role != VIRTIO_USB_ROLE_DEVICE)
+		pr_err("%s - wrong role (%d)\n", __func__, *role);
+	else {
+		pr_info("%s otg_role %s\n", __func__,
+			*role == VIRTIO_USB_ROLE_HOST ?
+				"VIRTIO_USB_ROLE_HOST" :
+				"VIRTIO_USB_ROLE_DEVICE");
+	}
+
+exit:
+	kfree(msg);
+	mutex_unlock(&vusb->otg->lock);
+	return status;
+}
+
+static void virtio_usb_otg_cmd_notify_cb(struct virtqueue *vqueue)
+{
+	struct virtio_usb *vusb = vqueue->vdev->priv;
+
+	if (!vusb->otg)
+		return;
+
+	complete(&vusb->otg->completion);
+}
+
+static void virtio_usb_otg_cmdq_stop_cb(struct virtio_usb *vusb,
+					struct virtio_usb_queue *vq)
+{
+	unsigned long flags;
+
+	if (!vusb->otg || !vq->vqueue)
+		return;
+
+	/*
+	 * Wake sleepers in OTG synchronous command paths so they can
+	 * observe started=false and exit.
+	 */
+	complete_all(&vusb->otg->completion);
+
+	spin_lock_irqsave(&vq->lock, flags);
+	virtqueue_disable_cb(vq->vqueue);
+	spin_unlock_irqrestore(&vq->lock, flags);
+}
+
+static void virtio_usb_otg_evtq_stop_cb(struct virtio_usb *vusb,
+					struct virtio_usb_queue *vq)
+{
+	unsigned long flags;
+	u32 length;
+	void *buf;
+
+	if (!vq->vqueue)
+		return;
+
+	/* The OTG event queue is not populated yet at this stage (no
+	 * VIRTIO_USB_F_SWITCH_ROLE negotiation, no CHANGE_ROLE events),
+	 * so this only has to make sure del_vqs() finds the ring empty.
+	 */
+	spin_lock_irqsave(&vq->lock, flags);
+	virtqueue_disable_cb(vq->vqueue);
+	while ((buf = virtqueue_get_buf(vq->vqueue, &length)))
+		;
+	spin_unlock_irqrestore(&vq->lock, flags);
+}
+
+const struct virtio_usb_vq_desc otg_vqueues[VIRTIO_USB_VQ_OTG_MAX] = {
+	[VIRTIO_USB_VQ_COMMAND_IDX] = {
+		.callback = virtio_usb_otg_cmd_notify_cb,
+		.name = "virtusb-otg-cmd",
+		.process = NULL,
+		.stop = virtio_usb_otg_cmdq_stop_cb,
+	},
+	[VIRTIO_USB_VQ_EVENT_IDX] = {
+		.callback = NULL,
+		.name = "virtusb-otg-evt",
+		.process = NULL,
+		.stop = virtio_usb_otg_evtq_stop_cb,
+	},
+};
diff --git a/drivers/usb/virtio_usb/otg.h b/drivers/usb/virtio_usb/otg.h
new file mode 100644
index 0000000..a34317c
--- /dev/null
+++ b/drivers/usb/virtio_usb/otg.h
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * virtio_usb: VirtIO USB device
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef VIRTIO_USB_OTG_H
+#define VIRTIO_USB_OTG_H
+
+#include "controller.h"
+
+extern int otg_init(struct virtio_usb *vusb);
+extern void otg_deinit(struct virtio_usb *vusb);
+extern u32 otg_get_role(struct virtio_usb *vusb, int port_id, u32 *role);
+
+struct virtio_usb_otg {
+	struct virtio_usb *vusb;
+	struct mutex lock;
+	struct completion completion;
+	struct virtio_usb_queue *oqs[VIRTIO_USB_VQ_OTG_MAX];
+};
+
+extern const struct virtio_usb_vq_desc otg_vqueues[VIRTIO_USB_VQ_OTG_MAX];
+
+#endif /* VIRTIO_USB_OTG_H */
