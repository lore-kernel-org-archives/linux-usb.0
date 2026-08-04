Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA9F4457BB
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837802; cv=none; b=ilFWoMhHde5O4/4sGy8RaPaoDBd9iLFfXmG24Hu5PiViyk5EAeAocnEp9p9VExiiwRRGPflSOboiaPRingBZvwYUfJBnZMuUmY8EJEMjRBtGbM0F6pCjBZyot+8Bo+fE1Z5S5j/s1kTs5Q19q6COiQkyBI/oFCo+gQCZLq9rido=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837802; c=relaxed/simple;
	bh=MU350OP6kB1rEDUkj+DOlrGzj1MoS0IisNveTm2dqus=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmSB6Xzj9nT7NsI9MU/ygY8XeoZsZm/McKoUa3bkY0PSyl11zmA+DucigpbVrVeTqci0uhFQU/Y8itta/J57+ZTIE3TcmzY9YTtYh0sDuP0N9Pk/kTgCgc5GGJn9nKijo7vG3jqkUH6tb/a9tcgGZL1hjA7/Mr5DGNfHqCMUsHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDmfPnO2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDmfPnO2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fdd674e17so1456641f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785837798; x=1786442598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mKNdCd7BfihSdT/4/OO50sBOOdXqsgqCXHHpY928Dwk=;
        b=kDmfPnO2ovj/FFsT4TngDNbAfrHWNcx9h7a1sB6WZAMAbEsmDAb8OFvXqxpcceXAJ0
         nvJ/rDu2MEMEHT/TRdcVgW963VpwftwcVDlnlSzl83oK1+s8WEBtFiHsjdKSBvDfOq3L
         VKQZDZUhXimT1CTaz/ZREW/HKsiq8AxYiQlq1TroWAoYOZRzTv8GAtM5HsDu3VvvGOKC
         1FQynDqaSlSepFl3Ux1jvCa2gH9hdUChGm8/DL6TU2fJoB0R54o3POx3+pjrlmZPSfxi
         je+2zfs0DQQYYsbz0wOtGPf0KlhAQFuJzkhivHws3VyO8S3Q13FjwTkPsHkHeeTUb4BE
         1AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785837798; x=1786442598;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKNdCd7BfihSdT/4/OO50sBOOdXqsgqCXHHpY928Dwk=;
        b=qszWRYf1xrUkIno1ib2/bnqo5az+qPqoySoTiXb09ZtJhs69s6hD6rBKpDn8ze7gVI
         ZhqfRAZ3uCDcnDgtn9ivPMdldBc93tFc1Apt/DYhLqm8De/GVwimxWsmM/ky6mvF/wHG
         tKhpQM5/52KGPV/CBxL+Hs7CmRKoIjKkr0TW9QzzoqFgoIz3FDv8MRijm67vMQikXAK6
         s79SrgSnmsB1uZze0U00368tLZZbN7Hv6Mm5A/CkRPjfYZQcrj0vk1kBEWKg278gobOV
         rx/KpwRCOaYH+IkcesJvdN/GeqRN8yoOJD4EGmijV3WpmWtBGuBDQZmOKLOATE2cmTyW
         Eu1A==
X-Forwarded-Encrypted: i=1; AHgh+Rpyvm5LOX+sEvXgdrv2LxhzfOQEXlBmHy8nvrPFcV6WSte1CxFFzu3ktgH/eIYxEw8xId3BfnMRm9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpOcOfQHrx8XE60jqsVIve4Ji6/FjNrk4xy5F9jClJJEeinOGA
	/ml7t+JfgWQcQJ6GCL3rFudkaqo5u5GJw8Nh583zoj8VUabmkd0oNwEo
X-Gm-Gg: AR+sD12NL41OBE4IMhDbMgUUXGsYrE631cPGdX19o/8cIwruOeOTyc1PhgbhQ51Dcbb
	f2QHOWBym0c8Bt4H814pnw6lRc9fRjZpSimSh0MJO1RfY3vnKoibWqtv83Psy8cy1hc2l3GxbIj
	dgZvIIyV5JW0YAv+tn3vgnCWL8SK9lWQeGDZUTTC/d8IyVUtXk5prRYPfqh5EKtFdt6kh98qXTn
	Vzt61gtKtfizdX1kOypbgBn8Xl/EIFT8y5wS1q5L+EV6Exl30bmWFZKhZ83zomxVPnHQhmVC6Qd
	d4+BRiyB3pDHgnviL1uGhDWtH5C2yFlbLCL8vE+JCLvXMrLS4ReHvOVfKS2CDbwM7lqV4hoRv5V
	9zzonHXzY921IxVXRqvN2opXYli/C3vvIzJcGa9lM05Lx+aVBhF65fEvmSoj2P+JONnQxjvCk/T
	kAsjeNi5HOqjk78x1/zTq51RgLRcwpSXZbod0k8Y36OljzZzJ9YvHoJsF4OgQVyfALC9tWziv6
X-Received: by 2002:a05:6000:4693:b0:45e:73eb:5119 with SMTP id ffacd0b85a97d-47fd72d4819mr26233578f8f.22.1785837798381;
        Tue, 04 Aug 2026 03:03:18 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91bfsm44715531f8f.15.2026.08.04.03.03.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 04 Aug 2026 03:03:18 -0700 (PDT)
Date: Tue, 4 Aug 2026 12:03:14 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Bart Nagel <bart@tremby.net>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] usb: xhci: Guarantee URB giveback on Ring
 Underrun/Overrun
Message-ID: <20260804120314.0a3203e7.michal.pecio@gmail.com>
In-Reply-To: <20260804120110.01bda0e2.michal.pecio@gmail.com>
References: <20260804120110.01bda0e2.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

In this case we know that the xHC has released ownership of all missed
TDs, we only don't know which were missed and which were queued later.

URBs are queued atomically, so we can safely give back all TDs of the
currently executing URB. Unlike the previous policy, this does actually
ensure that the class driver will learn about the error and won't see
all of its URBs still in progress when all TDs are missed on xHCI 1.0.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 38a0f895553a..8eed56b72c30 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2630,6 +2630,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	unsigned int slot_id;
 	int ep_index;
 	struct xhci_td *td = NULL;
+	struct urb *missed_urb = NULL;
 	dma_addr_t ep_trb_dma;
 	union xhci_trb *ep_trb;
 	int status = -EINPROGRESS;
@@ -2849,26 +2850,31 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					return 0;
 
 				/*
-				 * TD was missed, skip it. Core already initialized frame->status
-				 * to -EXDEV and frame->actual_length to 0, nothing more to do.
+				 * If skip flag is still set at xrun, we are on xHCI 1.0 and our TRB
+				 * pointer is zero again. All missed TDs can be given back, but we
+				 * don't know which were missed and which were queued after the xrun
+				 * occurred. We can safely give back the first pending URB.
 				 */
-				xhci_dequeue_td(xhci, td, ep_ring, 0);
+				if (ring_xrun_event) {
+					if (!missed_urb)
+						missed_urb = td->urb;
 
-				if (!list_empty(&ep_ring->td_list)) {
-					if (ring_xrun_event) {
-						/*
-						 * If we are here, we are on xHCI 1.0 host with no
-						 * idea how many TDs were missed or where the xrun
-						 * occurred. New TDs may have been added after the
-						 * xrun, so skip only one TD to be safe.
-						 */
-						xhci_dbg(xhci, "Skipped one TD for slot %u ep %u",
+					if (td->urb != missed_urb) {
+						xhci_dbg(xhci, "Skipped one URB for slot %u ep %u",
 								slot_id, ep_index);
 						return 0;
 					}
-					continue;
 				}
 
+				/*
+				 * TD was missed, skip it. Core already initialized frame->status
+				 * to -EXDEV and frame->actual_length to 0, nothing more to do.
+				 */
+				xhci_dequeue_td(xhci, td, ep_ring, 0);
+
+				if (!list_empty(&ep_ring->td_list))
+					continue;
+
 				xhci_dbg(xhci, "All TDs skipped for slot %u ep %u. Clear skip flag.\n",
 					 slot_id, ep_index);
 				ep->skip = false;
-- 
2.48.1
