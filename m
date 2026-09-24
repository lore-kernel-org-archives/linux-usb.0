Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC064B04AD
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266191; cv=none; b=dXa1oBP/gxd+BEhxVZGLE5VEmYLkE69rl5E5ZxYWDB/kQTXtzWucyozFNazAc29eyzEiJB691bCT6uAR6yZswErVKwelDCMgck/u/FlViwJuvrC6AOIcbZQipPlAMX8exz3qbXBgWOr3QOir68X3Eht6R3Xykn8mlA6FxZIvDXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266191; c=relaxed/simple;
	bh=pk2V4jUNSTjGKCXGB45za8wGqVKWQCW/KjcvYozGuhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7R6aw/1Fm1CPSQbuH66lAiR39bayA9im2qEDhuM9T8KCa9Jg2JLqEnmbx9lHB4pUvPytt6pZ2l5tZs60cw4tNCz4WF0YNOZ5YDaXOHt/7JzgSUDftvQn8WZuXch/OIR6lby7Pmnoc3YgDZrA9M/7e+D2fAQcOZFcSd9CtYAM0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0mdizZZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cp8QgKU7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0mdizZZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cp8QgKU7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFexcS3220720
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hyfTN4Bkg9A
	h4c08xNehDYIZ7P3fxnAf+WUmytjVvCk=; b=d0mdizZZgENI+JMNxwyoUbKs/w9
	ppDn6s3plktaMaI3K7ELbKHtnHUbDWYzdlOQi/19rRmKw1ouddmDqwidpAcr9kvh
	h+WrQ1FShi+EhbkHkoC/Dvr+lSTcl+JSwJiU16HPuESski1K+npmIOSPh7leQkOe
	mGuK3QBvhR6ZdcnUr1NvylCvznAET8Q4G4GHJqOy3J60vzFtfWbBzJ0NyqgS7mZY
	GEu6iNHcSO/doKfWfob1z2d3T9Msg8/4Z+Qw5lE3OoceFr6wVYH9dyzwrvHKYJB9
	KzKt+r0Tw02ibSzXsM2Oj3v8yMfLvEjV/YrgQn7S/J66luHqUMF4usuDd2w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s91g41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:09:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-791463ed29dso1930388137.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266187; x=1790870987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hyfTN4Bkg9Ah4c08xNehDYIZ7P3fxnAf+WUmytjVvCk=;
        b=Cp8QgKU72Mw9d2st10dHbXNk4DF7EjmGkwAuYXTPFP3noLZJDoFetImXgY2qrNtEGj
         Yj3BKtdEdVOLDCLpzYYvUIy6JH2vUWdxbxqVVYQBZ5HU/wrF5tzBuZvRkAlSsn/JfB4v
         1dCwvsX61+sHtPoZ+NjddUfQn6KJalr28uF4KuTfDANoApbE/oH+b7fYcaVUB/JECYaE
         FAb/vaOog/I/mvubYA5V9Lx7se/YAXj9QTPogEtiu2crJmY210Q82ns4AHg6ESlgV0RK
         9oS5P5WnB/WK+v2ayaBxO+i36jyTJk2lduZWOkic0xpopiC/54kRwbKcip5uzmXWX9U/
         WQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266187; x=1790870987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hyfTN4Bkg9Ah4c08xNehDYIZ7P3fxnAf+WUmytjVvCk=;
        b=Oo92PwHzpCNKDjYQCGIa49TVHRwN+1ZwoCkwll2TI6GkEvSl+iHgahpETy8nrDWrzv
         BBOeDiJfj7YHEt7TogsDwLL3rqHpqDshfaD92K4hXAHoRxWIm68tNaA8sk/AFcogEBHB
         9BL7rQSm1FZYbt2RS2A93gyC0pja4g3zJf20tpD3uZK3p5TTPD2ZVVTKmzpNfuz/VNJz
         vTuqpJg83Vj5lc+fzTkybGrCRbaoaqBGTuHZXQAMXYZoI3n0KBp8TJ/JNdwmi6nhVqFY
         pqx7HAYWz8D7KeNYOGANU0iIIGuJclD6ctQf+R40lKCp/SwFwzl/HpG3mJ50rhpdEwXz
         84Pw==
X-Forwarded-Encrypted: i=1; AKwUvBxXkIJUbGXX4PMrZOI65lvVCrvy+o+YEaBD4TQZoQp1/Dpp30YaTLVPUzG3QH7fAjnMmzzRMcKBkqM=@vger.kernel.org
X-Gm-Message-State: AFuF++kwfUFxQDvvGHj1xPP9Pdllo4TAU9f9qaphBgyndbPKJAT0mO76
	4+Fs9t6y/q8ZrTYaO5XkhPDr+MM2L+jvFVakh0bKbA7gfpQmC4m66EuIJ311b3Fyj+jTA3ZWoxB
	a2up25/LZuDlbw4jJTgwaz3x5szITZ9NIdFLknSYkKiiEcdiFl2X34UIagZaghL8=
X-Gm-Gg: AYBFou0a3Y0FL0gbXM3GkB1AX+uImGIJr6CeYwHPAqgwM0wj76qeIR/r4iTi4aLOlSF
	Dxg04Ms8NpVlWCYl4moE2f2pCWJ6++05A/hDEwmA2UxoQmX5ZQqjDZBXH9DbjRMCXu5IwEOaBD+
	xQkL6y4MmhR9c58w2vHMFBgK0uMl3NGCX/0WI/9Gr0BpOIo//CPvf6v5B2MU22lB3/x/AcI2yq3
	13rfp89/5SKk4QBFsL2OfXrx5SaNIEgVC7l8BaZh2kN15/rfMBYns9l0tQ/jAF3lk/IxqxZHrTN
	gabVSxyAdJmGbAJ5TL3bGB3CcVO97nZvWW5fYEsBszh9zgBeNvt5EFvlSqDNRbgEDbjxA/tHy7t
	QdPipxXep2Y279cG9Q7UtvaJBHxDNmYE=
X-Received: by 2002:a05:6102:3911:b0:7a2:3feb:9c55 with SMTP id ada2fe7eead31-7af1bf7337cmr1772098137.12.1790266187340;
        Thu, 24 Sep 2026 09:09:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3911:b0:7a2:3feb:9c55 with SMTP id ada2fe7eead31-7af1bf7337cmr1772080137.12.1790266186733;
        Thu, 24 Sep 2026 09:09:46 -0700 (PDT)
Received: from QCOM-WFsSr66Fqw.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5c4csm328306766b.18.2026.09.24.09.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:09:46 -0700 (PDT)
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: virtualization@lists.linux.dev, linux-usb@vger.kernel.org,
        Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>,
        Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>,
        Anton Yakovlev <anton.yakovlev@oss.qualcomm.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Subject: [PATCH 8/8] virtio-usb: support a guest UDC name prefix from the bind event
Date: Thu, 24 Sep 2026 18:09:07 +0200
Message-ID: <20260924160907.145405-9-igor.skalkin@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX4kCeegnUniYp
 gJcaaidzaqhnFYrRZ5dUHtxJdMge0Lza37m/jJSeIcStPKzbbMOmkYqdEdZ+EXobRAx3E1K8bid
 kAMIi3xorQyEH83eLwJuhDU4HLpDVSIfGQY/OJkukwLrOBEatezMAlJFc/U7cPuAWVggL2tSypD
 zQaMpqFkNCM1jsg3iAmOMwyHROWBkESi+lUMs98h4H/8hy2jeoOHOubk77KmPwG3Rs9eUP4fpIu
 BFkJjo62CSg/YLxndCHBwt6l7m916mgDBOnXTp3Hu0RIScIS7n1sRZWshYJ+yqrVEA8VWleKhEn
 qPT5NnTaJaVf2HXceg1Ix8fL2cteFMNOc2Q1yi+qGZBDX1MwvIwhKI3in1Jusa+qxeHGtTylqTX
 4QZUbDfAf7afuWEWM+L1/XI+b4KN/llpeKsH8C1eJyBx78BimqaHlK+hDjx4cNjmPC5/8q9oyvE
 WArioxwZQmraMj/XPAw==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab54b4b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=CuinUPPoDi4M3SHEpdwA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfXxF8S+fB28ZT3
 al9HhxvRy1rKSyFXBCZ4+wW1ciLz6AnYXEyHiyIkXWpxryaCuRG561GLLCtf/Xs0qEuj453NqSD
 7NUXFOTEEL5IBIrSkFZw5HdUW1Mztw4=
X-Proofpoint-ORIG-GUID: GHBm8-UiDK_dy7fZn9lU2aDbKSlyoTyU
X-Proofpoint-GUID: GHBm8-UiDK_dy7fZn9lU2aDbKSlyoTyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240066

Let the host backend supply a name prefix for a port's UDC parent
platform_device via the bind event, instead of always using the
generic GADGET_NAME. When present, the prefix is used verbatim as
the parent device's name and the gadget name becomes
"<prefix>_p<port>"; when empty, behavior is unchanged.

Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
---
 drivers/usb/virtio_usb/device.c |   47 +++++++++++++++++++++++++++++++++-------
 include/uapi/linux/virtio_usb.h |    4 ++-
 2 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/virtio_usb/device.c b/drivers/usb/virtio_usb/device.c
index ee41ea9..fedce74 100644
--- a/drivers/usb/virtio_usb/device.c
+++ b/drivers/usb/virtio_usb/device.c
@@ -1369,11 +1369,26 @@ on_error:
 	return rc;
 }
 
-static int virtio_usb_dc_parent_create(struct virtio_usb_dc *vudc)
+static int virtio_usb_dc_parent_create(struct virtio_usb_dc *vudc,
+				       const unsigned char *udc_prefix)
 {
+	size_t prefix_len;
+	char *parent_name;
 	int rc;
 
-	vudc->pdev = platform_device_alloc(GADGET_NAME, vudc->port);
+	prefix_len = strnlen((const char *)udc_prefix,
+			     VIRTIO_USB_UDC_NAME_PREFIX_MAX);
+	if (prefix_len) {
+		parent_name = kasprintf(GFP_KERNEL, "%.*s", (int)prefix_len,
+					(const char *)udc_prefix);
+	} else {
+		parent_name = kstrdup(GADGET_NAME, GFP_KERNEL);
+	}
+	if (!parent_name)
+		return -ENOMEM;
+
+	vudc->pdev = platform_device_alloc(parent_name, vudc->port);
+	kfree(parent_name);
 	if (!vudc->pdev)
 		return -ENOMEM;
 
@@ -1421,6 +1436,7 @@ static void virtio_usb_dc_event_process(struct virtio_usb_event *event)
 	switch (le32_to_cpu(evt->code)) {
 	case VIRTIO_USB_EVT_DEV_BIND: {
 		u8 max_speed;
+		size_t udc_prefix_len;
 
 		if (vudc->registered) {
 			dev_err(&vusb->vdev->dev,
@@ -1447,7 +1463,8 @@ static void virtio_usb_dc_event_process(struct virtio_usb_event *event)
 			break;
 		}
 		if (!vudc->pdev) {
-			rc = virtio_usb_dc_parent_create(vudc);
+			rc = virtio_usb_dc_parent_create(
+				vudc, bind_evt->udc_name_prefix);
 			if (rc) {
 				dev_err(&vusb->vdev->dev,
 					"Failed to create UDC parent device\n");
@@ -1456,8 +1473,18 @@ static void virtio_usb_dc_event_process(struct virtio_usb_event *event)
 				break;
 			}
 		}
-		vudc->gadget.name =
-			kasprintf(GFP_KERNEL, "%s_%d", GADGET_NAME, port_id);
+		udc_prefix_len =
+			strnlen((const char *)bind_evt->udc_name_prefix,
+				VIRTIO_USB_UDC_NAME_PREFIX_MAX);
+		if (udc_prefix_len) {
+			vudc->gadget.name = kasprintf(
+				GFP_KERNEL, "%.*s_p%d", (int)udc_prefix_len,
+				(const char *)bind_evt->udc_name_prefix,
+				port_id);
+		} else {
+			vudc->gadget.name = kasprintf(GFP_KERNEL, "%s_%d",
+						      GADGET_NAME, port_id);
+		}
 		if (!vudc->gadget.name) {
 			rc = -ENOMEM;
 			kfree(vudc->veps);
@@ -1480,7 +1507,6 @@ static void virtio_usb_dc_event_process(struct virtio_usb_event *event)
 			break;
 		}
 
-		//vudc->gadget.dev.init_name = gadget_name;
 		vudc->gadget.dev.parent = &vudc->pdev->dev;
 		rc = usb_add_gadget_udc(&vudc->pdev->dev, &vudc->gadget);
 		if (rc) {
@@ -1612,11 +1638,16 @@ int virtio_usb_dc_event_populate(struct virtio_usb *vusb)
 {
 	struct virtio_usb_queue *evt_queue =
 		&vusb->vqueues[vusb->dev_vq_base + VIRTIO_USB_VQ_EVENT_IDX];
+	size_t evt_size;
 	struct virtio_usb_event *events;
 	int rc;
 
-	events = virtio_usb_events_alloc(vusb, evt_queue,
-					 sizeof(struct virtio_usb_dev_event));
+	evt_size = max_t(size_t, sizeof(struct virtio_usb_dev_event),
+			 sizeof(struct virtio_usb_dev_setup_event));
+	evt_size = max_t(size_t, evt_size,
+			 sizeof(struct virtio_usb_dev_bind_event));
+
+	events = virtio_usb_events_alloc(vusb, evt_queue, evt_size);
 
 	if (!events)
 		return -ENOMEM;
diff --git a/include/uapi/linux/virtio_usb.h b/include/uapi/linux/virtio_usb.h
index d89223d..5fff248 100644
--- a/include/uapi/linux/virtio_usb.h
+++ b/include/uapi/linux/virtio_usb.h
@@ -216,6 +216,8 @@ enum {
 	VIRTIO_USB_EVT_DEV_UNBIND,
 };
 
+#define VIRTIO_USB_UDC_NAME_PREFIX_MAX 64
+
 struct virtio_usb_dev_event {
 	__le32 code; /* VIRTIO_USB_EVT_DEV_XXX */
 	__le16 port; /* Device ID */
@@ -227,7 +229,7 @@ struct virtio_usb_dev_bind_event {
 	__le32 code; /* VIRTIO_USB_EVT_DEV_BIND */
 	__le16 port; /* Device ID */
 	__u8 max_speed; /* enum usb_device_speed */
-	__u8 padding[9];
+	__u8 udc_name_prefix[VIRTIO_USB_UDC_NAME_PREFIX_MAX];
 };
 
 /* VIRTIO_USB_EVT_DEV_SETUP */
