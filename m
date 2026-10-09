Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8196C450415
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560130; cv=none; b=GH8sRnIfqHr3hUNonbLRd7pxvLzaLWl7aWWz8x+tAsYsQTH3t2M4uTHS3dVDDVMsLvsOf17yAe52LU/Amxl9XtW/DsKRBxGCbn5BGJEp1TGvJ5bTxw6ydqJRRcYmFYPNsCOT1/n3EAcDQ6MeBObW/9cnTkk3RJd7jgQ3t8hdSf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560130; c=relaxed/simple;
	bh=baD0T6YfiKh4j2nQlZUntfrvB+IYeQ+AaDmpOZSaNFE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vvi6UIct+VbSotohwBHLwhpAf62c04yAF0piwv12QHiFZ8m43byNoMppWqE9ckklMRfq76jo87fMOHYBgh/iZm3AvHvCWttVCorKLAK24XSUTm3+mp5yGY8yjYBpfCKwNqQZqGiSkR39oXdW791KOaMulFJTBAB+BlLRSEX8zR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n51dTgOX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n51dTgOX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16c399641so42116455e9.2
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560127; x=1792164927; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTb1TkmgBZVK/pgXB5whtezjl7Z2myEKWjJaOg9a6rw=;
        b=n51dTgOXtlhVNdweblLuQtLoVusgxaOQgLFCKWRQytmJZi6a9vh1z0ebgLJ2mG8ynw
         S7q6Vv0kfgQkQfm8+P5mgNEnrtpRc6qeZLTY/uuGnpao94Oc34VJEPGad6cQ+F+aDgOJ
         dCjDkKoXGHPJXy9ZxuSbFO6qTJ9hKeCKMqjawcx8lZhTE2Y7IhhNK+AWaFWDsXqh3xUH
         Bs2pR2wRcOXx6WKUmsKJKt6tEUd8pIfA81LGj2oho/enYQg8DQ+Fq/2kUCMapZrrnSuh
         uufzecQTk9KcQkeID11Vht6qwJewkQ+7yzv8rwcy91/z8b6LWNRGuIl+2cGRaUhtP8Pd
         OTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560127; x=1792164927;
        h=content-type:mime-version:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mTb1TkmgBZVK/pgXB5whtezjl7Z2myEKWjJaOg9a6rw=;
        b=pm9C6zJROGsw9qJCMn8WqKKwuRSQIszhllM+UrGo1WI7W31GZH9Ren/9TMJNRCI/TK
         bQRDtldoh0uPQKzjsVbbPBy/TCyN7/HG2GXaVZeViWLtgggQa1bGun57bWdG1+Ybj3oc
         IXXySZyMr5pjPK842AIhbzMg/uaCfEko0Mzj0HEt3odpVUGZCLTuEGqX0U52/5t+yiIA
         aUMeeI7429QEZvDvbaUOCOFQIQV/W+mA7WGJEIgMLaBoyR9chmogZ0zQXDQ2xCZDp/Ch
         velf3r7pB2AZzMl/0i2GK7AePDIptitF7T1RqcBa5f+WyA2IpInSbJj1AQaJQ43JFez/
         b6Hw==
X-Forwarded-Encrypted: i=1; AKwUvBw2Mo8PDXuLKDyxkGL2XX12bMXVFyjSpQTXScsvXwSS624VK1RL317MGHu6RMB2/bgfoNJzem8G5ss=@vger.kernel.org
X-Gm-Message-State: AFuF++m8DGEY/a4Dy97qdqhtNjfdqe0m3rCVcxyZNKtlj6849g4YMFLs
	bwAIdkcYYp1HEmeBSuFgN1pnJ8L9usCKeSYvjIjF+jb1DpL8ZQAmOEML
X-Gm-Gg: AYBFou2+H8c++Jj3r1JfvzwP5RgZEEbpof0/Lj4SFoL2mif51S30L6ki+sP4nsf/eiA
	HiVulsNemqPp4EoPW+B6KxngD3eHmXMZ4oy/jUpJahv8eqyAZyie+c3nqpTH6Z9pTwwnrXYa55H
	16+/8wGzB4V161+iFOKoWxBsYqTV3ETYluY8dyEm4GiuSB+coKgjJVssQqV7jOXHeoF09H98UL1
	CFR3ekenMXWC8ziOElbyB7WSfo2t3PMiJHwXC32FhuZxWEs2Lybwl5Ce8AiUBcdy12OCHW9+XMU
	w710pWWWO1V1QB2TjH0OiFDevlmyU+XH5RICxY9UgR8OfdF1TXUTbQBb9poVoCc69KKlJZvpCVp
	w0zQVbzyEb3eb2d7a51jXkFAqdfap9mlGTqRvEAtyVgLLYDtFa1O3HALKfNQ93PUveZwuxct0m/
	dVjyrqw0aPaBzMpWL0RGaddFgHHMLcs7ciAu8OfbJtf+idSftUo3xAzada+0jnppKQOEWwX5NOR
	O9ngZvFgeg=
X-Received: by 2002:a05:600c:580b:b0:4a1:688d:a43f with SMTP id 5b1f17b1804b1-4a18e4c9908mr31894295e9.35.1791560126666;
        Fri, 09 Oct 2026 08:35:26 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ab981asm4396551f8f.30.2026.10.09.08.35.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 09 Oct 2026 08:35:26 -0700 (PDT)
Date: Fri, 9 Oct 2026 17:35:16 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Henry Tseng <henrytseng@qnap.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: handshake timeout overrun and configure
 endpoint hang on device disconnect
Message-ID: <20261009173516.681681a6.michal.pecio@gmail.com>
In-Reply-To: <20261008102522.109308-1-henrytseng@qnap.com>
References: <20260930101752.15794-1-henrytseng@qnap.com>
	<20261002113012.271ceead.michal.pecio@gmail.com>
	<179136673328.386669.9410030239460428155@qnap.com>
	<20261008110642.56567a92.michal.pecio@gmail.com>
	<20261008102522.109308-1-henrytseng@qnap.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/Oje3Qhq6LRh.WK2Xyscv+vx"

--MP_/Oje3Qhq6LRh.WK2Xyscv+vx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu,  8 Oct 2026 18:25:20 +0800, Henry Tseng wrote:
> > Does it help to blacklist "uas" driver before connecting the whole
> > tree? My guess at this point: probably not, it's not a streams bug.
> >   
> 
> No, the host still dies.

> Deconfiguring 2-1.3 completes fine:
> 
>   [   87.929570] xhci_hcd 0000:0c:00.3: Cancel URB 0000000064a1e51d, dev 1.3, ep 0x83, starting at offset 0xfff49000
>   [   87.929675] xhci_hcd 0000:0c:00.3: Stopped on Transfer TRB for slot 4 ep 6
>   [   87.929756] xhci_hcd 0000:0c:00.3: Successful Set TR Deq Ptr cmd, deq = @fff49010
>   [   87.930564] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 4, new drop flags = 0x80, new add flags = 0x0
>   [   87.937756] xhci_hcd 0000:0c:00.3: Successful Endpoint Configure command
> 
> The host still dies on disconnection, but the stuck command is now the
> configure endpoint dropping 0x83 of the 2-1.4 hub (slot 6):
> 
>   [  164.793408] usb 2-1: USB disconnect, device number 2
>   [  164.793419] usb 2-1.3: USB disconnect, device number 3
>   ...
>   [  164.803390] usb 2-1.4: USB disconnect, device number 4
>   ...
>   [  164.834173] xhci_hcd 0000:0c:00.3: Cancel URB 000000009ac4b95a, dev 1.4, ep 0x83, starting at offset 0xfff15010
>   [  164.834219] xhci_hcd 0000:0c:00.3: Stopped on Transfer TRB for slot 6 ep 6
>   [  164.834819] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 6, new drop flags = 0x80, new add flags = 0x0
>   [  170.058142] xhci_hcd 0000:0c:00.3: Command timeout, USBSTS: 0x00000010 PCD
>   [  185.909602] xhci_hcd 0000:0c:00.3: Abort failed to stop command ring: -110
>   [  185.921446] xhci_hcd 0000:0c:00.3: xHCI host controller not responding, assume dead

But 2-1.4.4 deconfigured successfully before 2-1.4 failed?
Looks like there is something special about those hubs...

The kernel doesn't seem to be doing anything wrong, just stops
these endpoints (which don't even seem to be doing much) and
tries to disable them. I'm only unsure why 2-1.3 seems not to
be suspended despite having no children?

Set TR Deq is omitted in the failing case above, but this isn't
supposed to matter and kernels before 7.3 didn't omit it.

One thing coming to my mind is that the HW might expect the
"deconfigure" flag to be set in the Configure Endpoint command
under such circumstances. If you don't mind spending a few minutes
more, please try the attached patch, and also before unplugging,

  echo 0 > /sys/bus/usb/devices/1-1/bConfigurationValue
  echo 2-1.3:1.0 >/sys/bus/usb/drivers/hub/unbind

But it's starting to look like your patch may be the only option.
It's not out of spec and I've tested it on some HW today, none of
it had any issues with disabling slots with enabled endpoints.

This only works for disconnection from the root hub. Do you have
any external (ideally at least USB 3.1 10gbps) hub to check if HC
still hangs when you disconnect the same device from a hub?

Maybe it helps to re-connect the device before abort begins?
This worked with Renesas :)

Regards,
Michal

--MP_/Oje3Qhq6LRh.WK2Xyscv+vx
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=xhci-deconf.patch

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 2ea1c7dc1574..35679e445a39 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -4421,11 +4421,11 @@ int xhci_queue_reset_device(struct xhci_hcd *xhci, struct xhci_command *cmd,
 /* Queue a configure endpoint command TRB */
 int xhci_queue_configure_endpoint(struct xhci_hcd *xhci,
 		struct xhci_command *cmd, dma_addr_t in_ctx_ptr,
-		u32 slot_id, bool command_must_succeed)
+		u32 slot_id, bool dc, bool command_must_succeed)
 {
 	return queue_command(xhci, cmd, lower_32_bits(in_ctx_ptr),
 			upper_32_bits(in_ctx_ptr), 0,
-			TRB_TYPE(TRB_CONFIG_EP) | SLOT_ID_FOR_TRB(slot_id),
+			TRB_TYPE(TRB_CONFIG_EP) | (dc ? TRB_DC : 0) | SLOT_ID_FOR_TRB(slot_id),
 			command_must_succeed);
 }
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 34f342d2c7d7..035885903807 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3052,11 +3052,25 @@ static int xhci_configure_endpoint(struct xhci_hcd *xhci,
 	trace_xhci_configure_endpoint_ctrl_ctx(ctrl_ctx);
 	trace_xhci_configure_endpoint(slot_ctx);
 
-	if (!ctx_change)
+	if (!ctx_change) {
+		bool dc = true;
+		u32 add = le32_to_cpu(ctrl_ctx->add_flags) >> 2;
+		u32 drop = le32_to_cpu(ctrl_ctx->drop_flags) >> 2;
+
+		for (int i = 1; i <= 30; i++) {
+			if (add & 1 || !(drop & 1 || EP_STATE_DISABLED ==
+			    GET_EP_CTX_STATE(xhci_get_ep_ctx(xhci, virt_dev->out_ctx, i))))
+				dc = false;
+			add >>= 1;
+			drop >>= 1;
+		}
+		if (dc)
+			xhci_err(xhci, "deconfigure slot %d\n", udev->slot_id);
+
 		ret = xhci_queue_configure_endpoint(xhci, command,
 				command->in_ctx->dma,
-				udev->slot_id, must_succeed);
-	else
+				udev->slot_id, dc, must_succeed);
+	} else
 		ret = xhci_queue_evaluate_context(xhci, command,
 				command->in_ctx->dma,
 				udev->slot_id, must_succeed);
@@ -3486,7 +3500,7 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 	xhci_endpoint_copy(xhci, cfg_cmd->in_ctx, vdev->out_ctx, ep_index);
 
 	err = xhci_queue_configure_endpoint(xhci, cfg_cmd, cfg_cmd->in_ctx->dma,
-				      udev->slot_id, false);
+				      udev->slot_id, false, false);
 	if (err < 0) {
 		spin_unlock_irqrestore(&xhci->lock, flags);
 		xhci_free_command(xhci, cfg_cmd);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 3de22e4928b4..c6d771a399a7 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1929,7 +1929,7 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 		struct urb *urb, int slot_id, unsigned int ep_index);
 int xhci_queue_configure_endpoint(struct xhci_hcd *xhci,
 		struct xhci_command *cmd, dma_addr_t in_ctx_ptr, u32 slot_id,
-		bool command_must_succeed);
+		bool dc, bool command_must_succeed);
 int xhci_queue_get_port_bw(struct xhci_hcd *xhci,
 		struct xhci_command *cmd, dma_addr_t in_ctx_ptr,
 		u8 dev_speed, bool command_must_succeed);

--MP_/Oje3Qhq6LRh.WK2Xyscv+vx--
