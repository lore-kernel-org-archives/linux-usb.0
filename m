Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF00476CF2
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348311; cv=none; b=D0UDFSOJWMAFkZH8oTmXx1Frc8y1YaAh2T53EQ0AxcMNmA6RnJTRHhRTkHrIhoCQ8wiH+YrxnE4/8V1qfvOZm/ClWe0QkLnD62aWACHgk+KCbnYPDKJO/6VtooEUNSPyjFCI+1oz2PsW+MGXblU9akXXakE+3mbYuvFh1kO1izM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348311; c=relaxed/simple;
	bh=lFtxf8JZBoasBd9xvqhcN50c8gfwx5WqOr6trxt5JU0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XBp+GmhUjR29n9bGH4pOYQ7JODfVqrpyOCuIKsoRQJ5OnAdxNv5yFFhiartOA91dPqDM06hkgOL0Z3v8bbQyQrgzJv42jeQNLL/JE+Y1RLbLN5d10Ni8vyC58Sk/iRjcZho052oIugDUgrOfIQP+PMXOkzxQ21lZKjcg5IZXrqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSSvD/LV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSSvD/LV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47de0093c42so1028045f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 04:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788348303; x=1788953103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qndJplFw7niD9IAJKi5k3Tb9rHK8G3tVrEh0TSYMEcY=;
        b=bSSvD/LVthgXzLaJ1DoL0vVuokofjLjiJUeNcdCQgnPm9w63xywaYTn3HC4GFcgykS
         pi1D6RLCVmtPuOpn9iWAJ1b3w46qJjPnlDn2KvNxV7GBAsfpqelkwo3pnog3WRuKCSYk
         pFCOdrb7OVagFuxZ+5QewSLxQea1glHxoduaeVHknkcdIEtlNZvGAy/QXMQxApBY/8vl
         k2tho5eraeBLp6QacRk9yaX2oohtS7pLmSxzPeXE8EOx2SNqQKSdLP3gmDNv9ZUfB2zg
         hrzf3DlgyB6hulvzFc1M6kMVeHtrPyo67zx+CDyGNBYdes1I7hDXNh7RNMMGmHm/jRym
         lfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348303; x=1788953103;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qndJplFw7niD9IAJKi5k3Tb9rHK8G3tVrEh0TSYMEcY=;
        b=K5h7nvI4Mdn5vs/aSYemAskCb/YwUbBdUy4uuw9Iq2M2+1Ywc7NwcMGjh0S1PsVt77
         0LIBsAHmLNO1gPZ8enyoCibq/VORNVuyrheBbqkRAIP5LuQtOaNQ2w64SionF+fzoQBS
         JW4Md712hUYliriNeNqClKRHcaJ+80xCCaytb9ozKke1tJ3z0VPcPUdGma+rDiQytb8U
         U0WaUixfiE1gx5jXDUcOObqUj9W9L2w40uNRuNrrqD+yEC0Iz/l9HTuouxDJKYWuxGul
         W+z7xEUOl0slWuAyB5jvEwl1/3+4xYXRNtNCfzQ7x/ORMSq+D5mixx+IxyU/oJdkfAxx
         XNFg==
X-Gm-Message-State: AFuF++lOQ6LqqeBRBTJH5H+CVb9bS8SM5/MG0t8g0bNMMKdqGvDvnlyF
	7DTsdVwxt7PdUIHqjV6RlQUZ458Cc0YRRxWvsXt2ARSebv1/4Uz+MXiFZQYxlQ==
X-Gm-Gg: AYBFou05r3j1EAOV8pMTmUEa1Ti0fBGTEzFr3P4iWuIowFAdH1H2NAFYcSZH/h1+H1u
	1gL5H/SB36RnGWgGgj8OBxxl1vRhg7NUzlUxniUbtHpuL1eoEpo19dVws24KZRvrHIR7V2hVSXp
	69fQZfUx6gEa89urjYaz37S2SFYX2N5WDxfTUfasfS/bnvtYVxretPNNy3zUx6cRGOrTrrhbPvz
	1bF9e1dZhN4FSmm9KUca/6ajA23y1kyk25nqR21kqxrNoQiwcIBR6sKA2VGOQ0lc5sPJGfjEfWr
	2OwDbmzRD2Sf8/daY/GkRoMTTfSPJz4FtkfYkOphvct0DOiZMdZL0kHaL/GEMlXpr/XzbFrFTMY
	TZIJDrnEEfYSEXbZBo5P96VflDVNEs1u7PbbrPtfrTOr0gpYRX9X8cGFbEcCPnDDoN+LfhmNcDp
	/kPNAuYxGKEqNIeLNEjz3bQZHEYtb4j81kGKpnbimyeBkQtd8HYJo3iRMPD+jUoPpSq+PVFg==
X-Received: by 2002:a05:6000:2512:b0:47f:fb2e:f63d with SMTP id ffacd0b85a97d-48488f03964mr9001865f8f.9.1788348303315;
        Wed, 02 Sep 2026 04:25:03 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72f02sm5619073f8f.3.2026.09.02.04.25.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 02 Sep 2026 04:25:03 -0700 (PDT)
Date: Wed, 2 Sep 2026 13:24:58 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: co <co+fd80bc5967eb22c3@bugs.sh>, "Mathias Nyman"
 <mathias.nyman@intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Fix bounce buffer overflow
Message-ID: <20260902132458.5de2f031.michal.pecio@gmail.com>
In-Reply-To: <20260828002440.312ec0b6.michal.pecio@gmail.com>
References: <D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh>
	<20260828002440.312ec0b6.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

High-speed devices with out of spec 1024 byte bulk endpoints exist and
are allowed by USB core, but xhci-hcd always sets packet size to 512.
The exact nature of these devices isn't documented, commit fb5ee84ea72c
("USB: Accept bulk endpoints with 1024-byte maxpacket") only states
that they "don't work with xHCI host controllers", whatever it means.

But somebody (or a malicious device) can try, and then the driver will
allocate a 512 byte bounce buffer for this endpoint and may write up to
1024 bytes into it if particular scatter-gather URBs are used, because
xhci_align_td() obtains packet size from the descriptor. Fix this.

As a side effect, TRBs will be aligned to the packet size chosen by the
driver on all endpoints of all speeds. Alignment serves the xHC, not
device, so this is fine. Only out of spec devices are affected anyway.

Reported-by: co+fd80bc5967eb22c3@bugs.sh
Link: https://lore.kernel.org/linux-usb/D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh/
Fixes: f9c589e142d0 ("xhci: TD-fragment, align the unsplittable case with a bounce buffer")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

Trivial bug, trivial patch, though only tested for regression with
an in-spec device, testing with the malicious device would be helpful
to confirm that memory corruption is gone as expected.

As for actual devices with 1KB packet size, I found that Cypress FX2
can generate such packets and some HCs receive them, though others
reject the Configure Endpoint command and usb_set_interface() fails.

So we could support that, but this code really should just use the
packet size selected by the driver instead of guessing.

Perhaps the same should apply to other users of endpoint_maxp(), but
those just calculate some TRB fields like TD Size, nothing critical.

 drivers/usb/host/xhci-ring.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b9d005ca5877..fa6684746305 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3537,15 +3537,13 @@ static u32 xhci_td_remainder(struct xhci_hcd *xhci, int transferred,
 
 
 static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
-			 u32 *trb_buff_len, struct xhci_segment *seg)
+			 u32 *trb_buff_len, struct xhci_segment *seg, u32 max_pkt)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
 	unsigned int unalign;
-	unsigned int max_pkt;
 	u32 new_buff_len;
 	size_t len;
 
-	max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
 	unalign = (enqd_len + *trb_buff_len) % max_pkt;
 
 	/* we got lucky, last normal TRB data on segment is packet aligned */
@@ -3690,9 +3688,8 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		if (enqd_len + trb_buff_len < full_len) {
 			field |= TRB_CHAIN;
 			if (trb_is_link(ring->enqueue + 1)) {
-				if (xhci_align_td(xhci, urb, enqd_len,
-						  &trb_buff_len,
-						  ring->enq_seg)) {
+				if (xhci_align_td(xhci, urb, enqd_len, &trb_buff_len,
+						ring->enq_seg, ring->bounce_buf_len)) {
 					send_addr = ring->enq_seg->bounce_dma;
 					/* TD bounced at least, and last on this seg */
 					td->bounce_seg = ring->enq_seg;
-- 
2.48.1
