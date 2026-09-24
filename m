Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9974B0C8B
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266189; cv=none; b=pKTtMPdQJMLgN7aGK7JIoPjGHHpM272LEk60pT78LtkkHv45+CxXaO34ErV6CAWtF1DB9zhD27lxVmZkaJ70NfWMsGeb6moOYVnPKhNu5B+NA83H2+HpVuof2/3dRgK9N+ntwxqA6eXCPB3ah7knIKmOwKBRU0AKwSTBPKOql7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266189; c=relaxed/simple;
	bh=VHzItReQsT4mqHFAvKO6SuXa5oXHt39GBTJzSw4wFWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=By9+zyV8+vMjW265AKEjiDz9Frvfsqq4DjHG3gD4qf6q9JZgPvrqtphPzz5KfkBjQtGpXCYU1ZYc3w1XSVlbSXYHj+xzhVY5CpzjayzGGe8JWK5bV6wGYnqtL6McxFLQzlPFnaJRNPmMU1GSUJ0rBUPluru3XNkDsV89ktnBFUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IW0VtDm0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifqanvSc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IW0VtDm0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifqanvSc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFefIT1907512
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g1KagqPRwMg
	OV8uT8Mgn5RclACyj9Ixknjqi8hRCnXo=; b=IW0VtDm0rS4quDQvXTCmw2Nv+Ed
	3bfh2fMEyzHyQ+IRDgXfETQ8SCRdF1UbRRWsCWz0OQa8AEMr4EVgWroBBAyrHBY8
	IWqADg1EOGcAr2q+eg5wU8+LFjGNddzRpAM2hREdN9H+mH9UQ4BzJj4W6BnANQF+
	ScPoWZ9MSUW6a0Srw9f9kKDgMex1nfQ9ngbQ5WzT2ZQ9TcjoVKzH645e4DuXElS7
	WeLk32UyUuAij3AYW/MSmx2gyJJ5rIRq0zX2NmalXxiD3C3BqpxYcUssunkz88k3
	+9+1azGTIucOZXS37dJAIE4VQVsbfK6UBeIDFAbZSxd11uCFzZwupjAM2Qw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7sg88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 16:09:46 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fb9f59781so1987908137.1
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266186; x=1790870986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1KagqPRwMgOV8uT8Mgn5RclACyj9Ixknjqi8hRCnXo=;
        b=ifqanvScGbLY4ayBh8iqQFJ9PvdDwKiZ+RZP/QaAFxXEUuylKDb5+lsp7Cnt0Sh09X
         nfj/G/6aZ0WNOA4MKq5dRKB3O1ddKPTjUteUgZDMLIMk6MApTvtBSv8X75hhsSt6iIV2
         S8YVBJfmMAg9Yj0kNhYC1qF6Lv5R8SBh5m4BBJ9H90EyrINiKKOJLiH96ZD8i44cnMbP
         Lxgfm2uHh3T6zcauX8ORK/0w3qIrt0QVuc6u2FQ6BOVCrMA6Ebf0ipHLOEk/PkdeI177
         QdI2GxOQKCujwhup7n0rUqnuvO8q4Rdq5tT8RNYdo9yt8h7WQgqOKIypTchI4k8Rlqkc
         HmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266186; x=1790870986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g1KagqPRwMgOV8uT8Mgn5RclACyj9Ixknjqi8hRCnXo=;
        b=Kg7BKUGv66VQWwrRFQA315jEewgdaFJapaD1r3xTf13bBuRc1C5SSNi+2nralR0gCn
         nFj9p/se1/FhOtdAeWZD6dfmPQF5HglRWf54B1GFw7fu7shnLf8jJkfTbBA2X/uhXMmt
         BQY3j4Y04CCoVQELho6r9XoWXc12dQsCOyAC9omCP8wz42d3MW9cw+cOUUkSkFuVdcqN
         fHBiG+jKwjPDM3GCzmYi+1MxNeRZ9zogVx3e1UtUN8huS/sh09v+y0SMutSJKXDJGfwl
         322Es9QH9xS6ofirfpjj1DLD4RsBtzW5mbRzcXoThfdFDxLIh6RrxhdrX+MrquKf7U4f
         tAcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+9jtlQDJH0YwL2nM9JBBbZE8M4VkdgfVk7yape9l3/nSFOUK5G0WY0nmErh0WC/IvpDHPhBHLL3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kInntb/qnYGzKO/ondRqyZ42FJ6Q2MGUFotsgQ+1oYL0pGI2Yn
	2iMCMGoV225HyUVT7ZY+Bt8IDjL4dUPNjYPbXz2Ud4m4mRxP10a/vDeVilwoa5VcHUKj8HGNva4
	X7HCEI7yZUW+hpcOFkPtH3mU5chevQonXK9/EAMBY0G4dpmXxA/4ISJG2nNh499M=
X-Gm-Gg: AYBFou2Eqh7cGSOKa2vYjru7emBF51XGFbHEbtRHFlvRoOCTaNb0ga1Me56JvVR/tXg
	7uktE6NT5vtEj23sXxQlslTzTsRRImflWWFPWSPgmGKkzHAvYEEW3rmQ7t706F+6tguizjsnsiO
	U1mbpQhYWk7V4aoyYWRO9gVQg2o4cFAIGbUk+vG49YJ/jK7fpA8frbShGmXhDS6j13VJ7CgoO5B
	qsx4IWlyixqqZbYKVP2wnafrx3LexhSbpv/eAy/EAVuXSggNdsZqASzU5bs8lvF9c6ZmKo+N9Ur
	o+vJ0ap+MMPXOHZpddfpcJqJ2ML7yKqCJKu/p/Ijy/KcfRvymfDCv+aKuTlzVg/MRdwIAAemz1o
	gtUCSQnh3hV2ZHxAFI+L9oYv+L4Sld/k=
X-Received: by 2002:a05:6102:5613:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7af1ecf76c6mr1370747137.27.1790266185718;
        Thu, 24 Sep 2026 09:09:45 -0700 (PDT)
X-Received: by 2002:a05:6102:5613:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7af1ecf76c6mr1370722137.27.1790266185220;
        Thu, 24 Sep 2026 09:09:45 -0700 (PDT)
Received: from QCOM-WFsSr66Fqw.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5c4csm328306766b.18.2026.09.24.09.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:09:44 -0700 (PDT)
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: virtualization@lists.linux.dev, linux-usb@vger.kernel.org,
        Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>,
        Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>,
        Anton Yakovlev <anton.yakovlev@oss.qualcomm.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Subject: [PATCH 7/8] virtio-usb: add SuperSpeed device-role support
Date: Thu, 24 Sep 2026 18:09:06 +0200
Message-ID: <20260924160907.145405-8-igor.skalkin@oss.qualcomm.com>
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
X-Proofpoint-GUID: wMFP3mEV4yZxZpWgrnTN0_3nDl91KcVg
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab54b4a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=_ndNwgRctBh-bPckawkA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX72jy3MLr8LvW
 9x2V2H6CVIHABfb55ZWmnPtVefhKJHUok4AiYgpHJcmSHshaf/zXuxEFm09Zp2Oeuy3SS4aXBHW
 lh9UdGSV/zhaqk981QbRPd8o1Q4p5FfKrTH5TOTfmcYWGVFM1Gw7C5MQiqWrIoD55jTEdLf27JR
 P3YUaSBIM8vaNGrLJkFN8HYpf2Fb53YNq5T8btJ5HOE7B1FBa7QgyLTqfxHsSF/Rrq1SqcsjMW1
 zr5+2kvbC9cJc8tdN1teQnCZ7fRH3ip6Y6EE9KGXIYJibC51zCbY/Wt/UtIiHGHnr15smmABkps
 yjR955SquARbldpFwRF/cumoupRPLKaMaAw5BVqDzDiTOlLoDgK1vQQ/auY7dlmi7DOyGO2AzHl
 mtRchGk8OLzj7zwYcvCfYGxacvgk5Kz8uzQ9pnyI1ijL9IeHTBWcGsfIYo75q7lG9bnaqC7MjWm
 YblFw4DhrDt4E9tR6hA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX+4feDjj/aUZc
 u47iM9Lr0Jj2vheYvxHHqqgiVNJmXpMpfAQA4XE8HmBQNch83tyTRYonj508QIT5tNSE/Z7ZGjG
 14UIi4l7LPiTp6471puRPLzWn5hY1x8=
X-Proofpoint-ORIG-GUID: wMFP3mEV4yZxZpWgrnTN0_3nDl91KcVg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240066

Stop hardcoding the gadget's max_speed to USB_SPEED_HIGH on DEV_BIND;
parse max_speed from the bind event sent by the host backend and
clamp it to a supported set (LOW/FULL/HIGH/SUPER/SUPER_PLUS),
defaulting to HIGH on invalid data. Update set_speed() to clamp the
negotiated speed against gadget.max_speed and configure the EP0 max
packet size for SuperSpeed and SuperSpeed Plus (512 bytes both, per
USB 3.1), while preserving existing HS/FS behavior.

Also send the SuperSpeed endpoint companion descriptor together with
the endpoint descriptor on EP_ENABLE, as an additional scatter-gather
payload, so the host backend can configure burst/mult parameters
instead of relying on the endpoint descriptor alone.

This aligns the guest-side speed configuration with the host's
capability and enables SuperSpeed path bring-up.

Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
---
 drivers/usb/virtio_usb/device.c |   54 +++++++++++++++++++++++++++++++++++-----
 include/uapi/linux/virtio_usb.h |    8 +++++
 2 files changed, 56 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/virtio_usb/device.c b/drivers/usb/virtio_usb/device.c
index 9ee1f05..ee41ea9 100644
--- a/drivers/usb/virtio_usb/device.c
+++ b/drivers/usb/virtio_usb/device.c
@@ -439,12 +439,14 @@ static void vep_enable_work(struct work_struct *work)
 		container_of(work, struct virtio_usb_ep, enable_work);
 	struct virtio_usb_dc *vudc = vep->vudc;
 	const struct usb_endpoint_descriptor *desc = vep->ep.desc;
-	struct scatterlist sg;
-	struct scatterlist *psg_data = &sg;
+	const struct usb_ss_ep_comp_descriptor *comp = vep->ep.comp_desc;
+	struct scatterlist sgs[2];
+	struct scatterlist *psg_data = sgs;
 	struct virtio_usb_dev_cmd_hdr *hdr;
 	struct virtio_usb_cmd *cmd;
 	unsigned long flags;
 	u16 endpoint;
+	u8 n_sgs = 1;
 	int rc;
 
 	if (!desc)
@@ -461,7 +463,13 @@ static void vep_enable_work(struct work_struct *work)
 		goto done;
 	}
 
-	sg_init_one(psg_data, desc, sizeof(*desc));
+	if (virtio_usb_ep_comp_valid(comp))
+		n_sgs = 2;
+
+	sg_init_table(psg_data, n_sgs);
+	sg_set_buf(&psg_data[0], desc, sizeof(*desc));
+	if (n_sgs == 2)
+		sg_set_buf(&psg_data[1], comp, sizeof(*comp));
 	hdr = virtio_usb_cmd_request(cmd);
 	hdr->endpoint = cpu_to_le16(endpoint);
 
@@ -564,6 +572,7 @@ static int virtio_ep_enable(struct usb_ep *ep,
 {
 	struct virtio_usb_ep *vep = usb_ep_to_virtio_ep(ep);
 	struct virtio_usb_dc *vudc = vep->vudc;
+	const struct usb_ss_ep_comp_descriptor *comp = ep->comp_desc;
 	unsigned long flags;
 
 	spin_lock_irqsave(&vudc->lock, flags);
@@ -579,6 +588,16 @@ static int virtio_ep_enable(struct usb_ep *ep,
 		return -EBUSY;
 	}
 
+	if (comp) {
+		if (!virtio_usb_ep_comp_valid(comp) || comp->bMaxBurst > 15) {
+			spin_unlock_irqrestore(&vudc->lock, flags);
+			return -EINVAL;
+		}
+	} else if (vudc->gadget.speed >= USB_SPEED_SUPER) {
+		spin_unlock_irqrestore(&vudc->lock, flags);
+		return -EINVAL;
+	}
+
 	ep->desc = desc;
 	ep->maxpacket = usb_endpoint_maxp(desc);
 	vep->state = EP_ENABLING;
@@ -1119,9 +1138,13 @@ static void virtio_usb_dc_set_speed(struct usb_gadget *gadget,
 	struct virtio_usb_dc *vudc =
 		container_of(gadget, struct virtio_usb_dc, gadget);
 
-	vudc->gadget.speed = min_t(u8, USB_SPEED_HIGH, speed);
+	vudc->gadget.speed = min_t(u8, vudc->gadget.max_speed, speed);
 
-	switch (speed) {
+	switch (vudc->gadget.speed) {
+	case USB_SPEED_SUPER_PLUS:
+	case USB_SPEED_SUPER:
+		vudc->veps[0].ep.maxpacket = 512;
+		break;
 	case USB_SPEED_HIGH:
 	case USB_SPEED_FULL:
 		vudc->veps[0].ep.maxpacket = 64;
@@ -1375,6 +1398,8 @@ static int virtio_usb_dc_parent_create(struct virtio_usb_dc *vudc)
 static void virtio_usb_dc_event_process(struct virtio_usb_event *event)
 {
 	struct virtio_usb_dev_event *evt = virtio_usb_event_buf(event);
+	struct virtio_usb_dev_bind_event *bind_evt =
+		(struct virtio_usb_dev_bind_event *)evt;
 	struct virtio_usb_dev_setup_event *setup_evt;
 	struct virtio_usb *vusb = event->vusb;
 	struct virtio_usb_dc *vudc;
@@ -1395,6 +1420,8 @@ static void virtio_usb_dc_event_process(struct virtio_usb_event *event)
 
 	switch (le32_to_cpu(evt->code)) {
 	case VIRTIO_USB_EVT_DEV_BIND: {
+		u8 max_speed;
+
 		if (vudc->registered) {
 			dev_err(&vusb->vdev->dev,
 				"port %d: BIND while still registered, ignoring\n",
@@ -1405,6 +1432,8 @@ static void virtio_usb_dc_event_process(struct virtio_usb_event *event)
 
 		memzero_explicit(&vudc->gadget, sizeof(struct usb_gadget));
 		vudc->gadget.sg_supported = 1;
+		max_speed = bind_evt->max_speed;
+
 		rc = virtio_usb_dc_get_endpoint_count(vudc);
 		if (rc) {
 			dev_err(&vusb->vdev->dev,
@@ -1436,7 +1465,20 @@ static void virtio_usb_dc_event_process(struct virtio_usb_event *event)
 			break;
 		}
 		vudc->gadget.ops = &virtio_gadget_ops;
-		vudc->gadget.max_speed = USB_SPEED_HIGH;
+		switch (max_speed) {
+		case USB_SPEED_LOW:
+		case USB_SPEED_FULL:
+		case USB_SPEED_HIGH:
+		case USB_SPEED_SUPER:
+		case USB_SPEED_SUPER_PLUS:
+			vudc->gadget.max_speed = max_speed;
+			break;
+		default:
+			pr_info("virtio-usb: unrecognized max_speed %u from host, defaulting to HIGH\n",
+				max_speed);
+			vudc->gadget.max_speed = USB_SPEED_HIGH;
+			break;
+		}
 
 		//vudc->gadget.dev.init_name = gadget_name;
 		vudc->gadget.dev.parent = &vudc->pdev->dev;
diff --git a/include/uapi/linux/virtio_usb.h b/include/uapi/linux/virtio_usb.h
index 29cec5d..d89223d 100644
--- a/include/uapi/linux/virtio_usb.h
+++ b/include/uapi/linux/virtio_usb.h
@@ -222,6 +222,14 @@ struct virtio_usb_dev_event {
 	__u8 padding[10];
 };
 
+/* VIRTIO_USB_EVT_DEV_BIND */
+struct virtio_usb_dev_bind_event {
+	__le32 code; /* VIRTIO_USB_EVT_DEV_BIND */
+	__le16 port; /* Device ID */
+	__u8 max_speed; /* enum usb_device_speed */
+	__u8 padding[9];
+};
+
 /* VIRTIO_USB_EVT_DEV_SETUP */
 struct virtio_usb_dev_setup_event {
 	__le32 code; /* VIRTIO_USB_EVT_DEV_SETUP */
