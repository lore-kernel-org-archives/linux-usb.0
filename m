Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D3EC10F03
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 10:44:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3FB06206BA
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 10:44:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Y13MLzMw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbfDYKoA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 06:44:00 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5105 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbfDYKn7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 06:43:59 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cc18f550000>; Thu, 25 Apr 2019 03:43:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 25 Apr 2019 03:43:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 25 Apr 2019 03:43:59 -0700
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Apr
 2019 10:43:58 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Apr
 2019 10:43:58 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 25 Apr 2019 10:43:58 +0000
Received: from henryl-nb2.nvidia.com (Not Verified[10.19.108.180]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cc18f6d0001>; Thu, 25 Apr 2019 03:43:58 -0700
From:   Henry Lin <henryl@nvidia.com>
To:     <mathias.nyman@intel.com>
CC:     <linux-usb@vger.kernel.org>, <henryl@nvidia.com>
Subject: [PATCH] xhci: update bounce buffer with correct sg num
Date:   Thu, 25 Apr 2019 18:43:52 +0800
Message-ID: <1556189032-28188-1-git-send-email-henryl@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1556189013; bh=/jpiuncDNzDbRzxWOCxvVLuMRqq4QNciYOCBkq56u50=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=Y13MLzMwo0TeenyhIid2gCZEbWog8AeiePDMfqZEUIAnU2ZF5G+5jCqiBI1AGkXGT
         lkqurW8XlulEzVr+VBIr90CVoGHy6WbArlB91DsSlYGRm87EJmb6PBGDh9qYp5e7ZP
         lm0paqJm/7Y/UgUheox7+HoKQeOlSB5zl4WEXoZV5AEr47ECM+o3lK0jaQDNtrpy/n
         BFVQglWOINlPN99Dy/QbL459rTbKE+s/E9NTFLuo7k944OEsp/5js6CzzR6sDxiHv9
         8cv1Pjawts8LIkhTNGqCZxXh5fNIUmhAvDJsvLPLL+thhzq7IAYN51x+GamWBwjty6
         lrdSnvFxRVrJg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425104352.6U-ZU9IuAdPOPqSfprgjGMmQTiVJ2g1t3LNkWfGJWf0@z>

This change fixes a data corruption issue occurred on USB hard disk for
the case that bounce buffer is used during transferring data.

While updating data between sg list and bounce buffer, current
implementation passes mapped sg number (urb->num_mapped_sgs) to
sg_pcopy_from_buffer() and sg_pcopy_to_buffer(). This causes data
not get copied if target buffer is located in the elements after
mapped sg elements. This change passes sg number for full list to
fix issue.

Besides, for copying data from bounce buffer, calling dma_unmap_single()
on the bounce buffer before copying data to sg list can avoid cache issue.

Signed-off-by: Henry Lin <henryl@nvidia.com>
---
 drivers/usb/host/xhci-ring.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9215a28..f5d0908 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -656,6 +656,7 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
 	struct device *dev = xhci_to_hcd(xhci)->self.controller;
 	struct xhci_segment *seg = td->bounce_seg;
 	struct urb *urb = td->urb;
+	size_t len;
 
 	if (!ring || !seg || !urb)
 		return;
@@ -666,11 +667,14 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
 		return;
 	}
 
-	/* for in tranfers we need to copy the data from bounce to sg */
-	sg_pcopy_from_buffer(urb->sg, urb->num_mapped_sgs, seg->bounce_buf,
-			     seg->bounce_len, seg->bounce_offs);
 	dma_unmap_single(dev, seg->bounce_dma, ring->bounce_buf_len,
 			 DMA_FROM_DEVICE);
+	/* for in tranfers we need to copy the data from bounce to sg */
+	len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs, seg->bounce_buf,
+			     seg->bounce_len, seg->bounce_offs);
+	if (len != seg->bounce_len)
+		xhci_warn(xhci, "WARN Wrong bounce buffer read length: %ld != %d\n",
+				len, seg->bounce_len);
 	seg->bounce_len = 0;
 	seg->bounce_offs = 0;
 }
@@ -3123,6 +3127,7 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
 	unsigned int unalign;
 	unsigned int max_pkt;
 	u32 new_buff_len;
+	size_t len;
 
 	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
 	unalign = (enqd_len + *trb_buff_len) % max_pkt;
@@ -3153,8 +3158,12 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
 
 	/* create a max max_pkt sized bounce buffer pointed to by last trb */
 	if (usb_urb_dir_out(urb)) {
-		sg_pcopy_to_buffer(urb->sg, urb->num_mapped_sgs,
+		len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
 				   seg->bounce_buf, new_buff_len, enqd_len);
+		if (len != seg->bounce_len)
+			xhci_warn(xhci,
+				"WARN Wrong bounce buffer write length: %ld != %d\n",
+				len, seg->bounce_len);
 		seg->bounce_dma = dma_map_single(dev, seg->bounce_buf,
 						 max_pkt, DMA_TO_DEVICE);
 	} else {
-- 
2.7.4

