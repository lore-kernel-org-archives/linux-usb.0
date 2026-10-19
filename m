Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433676;
	b=iroMNO24pXVvmEqG/KJWFzE5phb3pOKYd15J4nQrKwDlIvflL4Q8NtzuAZQIfELFg5QU
	 ZZ8YMuJbtQsS1b4QrT0OeKutDnZVSKb44k/snPfut6yLxUkVGzGxFQHFl3nMSAWYHkvrn
	 mnV3vpgWYempUSRVtvFAidPAKQhn2JWet2KesSLQKKN9NXzQWvVZyyYLqTpjIT5KVt2ag
	 NXDG9EBW5pDMr1fQ8eLFrxLPtDKgrcm+9BKPDt8V++0ZnVk06IMLTMeV9rvE6L9z/KjjK
	 9XC97ZDl3JO5/HcxXvqilnyt4Qv/xZGampJJdEBekETQqMu2YdoSRUiX2oFtO/HD11Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=UbviPJaVXy4QCl2KmbCZAYVOgQoDY5MxdvtlFea95Vg=;
	b=T8b0lmD7HbcbZlF7GoSZRzXr8nXdImAB4mahz6sdQtUiMsW6Xavz8gNHa463q89DbWPK
	 gjk+9xIrmUKQOT7r5mG3IyOhhhRxblnm8pH2Wds7vs0xii4rfeoyr+ZeYPYzK0ytOESt+
	 er1vPUn8ak1Ed82HYqflDsy1Kgz/sUUySakz7Ki/1L/7q36gw83NTHmA4h/rXgJZGgYRU
	 IZ//5vstxmhtHPNm7ICUWYChYU2RWojn7vFEb/5bxWzfi0RG0SPaFRfEFanfL+YoIysCk
	 WL8uEhu5TZxqD0kiGjEpDVlv6NioYfI0cGkELd/Yx+OkXv+QkkgdsLjQQ0hwlWN1H8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NgZxkkH8;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CEE606A31C
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 18:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CEE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NgZxkkH8
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-745497ac8fcso1110870137.0
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 11:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792433675; x=1793038475; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbviPJaVXy4QCl2KmbCZAYVOgQoDY5MxdvtlFea95Vg=;
        b=NgZxkkH8ADwtIdi9tUcaFw2m4mlst7WxkwDd0/4s0p+CY8cYZG138qXeTxaqV1yhz1
         CPAfHCbznK79eZSzQLdAgpLVL2ZIrs4yuv21XW/oFVsbdWQ0KVc1B9LA/L0wzsFYwzGs
         IAXzQ7QBJPxoTNBukWHzNC5n70E8MlrRYjFYRo9C9KtlSofnnTNQ/jNmO7Xf095Kdu9W
         Qsp79osdugPAXgTJqrdt3vB3rcvOORzQ6kpfkCaAKM5mJoFGuey/dPIrGpctZWVHErh/
         Q2vrMoIkChGEIT08KHzvBuyzYNqICWX8HpRAWeKJP1b6kjKGXKbVtytA27tJVpqcL3PS
         qzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433675; x=1793038475;
        h=content-type:mime-version:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UbviPJaVXy4QCl2KmbCZAYVOgQoDY5MxdvtlFea95Vg=;
        b=x2GvWxHOrWCykcGx7pCKt5DuITcdcSs5LYVq3iE7+FEUWEC+XN3JwCVkAeiB328VvE
         0NoipzdrBFxfIW/s018ZifuxqC+EMr8Q977rEqwf+hs0xMorfvSUqAd7+riibhyQFrZg
         NAalPasCiPMCQxFdaN7y9uyyoy1TGNFxQrFJpKfQNTljbed+IgEwMgQgx6NaTQLij6SQ
         EJgbeCgsqLsq6Z9Ri+XeN1y8UOiIZYbvR0xaywf1ThslEWQOlEqv11FM9ecWhzB3H3+w
         G7R2lmGdSC8A+akCigdxIHmAXw9L1DPr9e1vzMps47TTWiUBocP18xlvDu5si2r78q9G
         SQaQ==
X-Gm-Message-State: AFq9FYISu3XpuiR1FOR6585FCqdX/MVdnSZYa3pmtqYYb5osBoQj7hhY
	EN4sPf5PRci+Y8NsqtjYnUvlNnBvY6YWyYxEHmgJuyPc3vuQjLmSn5GVcNExTQ/K
X-Gm-Gg: AYBFou3QBpqsEss8kksfHcOae5LVmrQUJKVYE395hhwRFUmLD0GEIB9r5oe9G6jUUkj
	5JjKxyyAMiQldCC29jotoeliJZq3FGb2sURi7FyfnN6zUrAJkRKYc4JgvApHg2rwWXtT1AjUhzv
	iDdWctN0unMTrIa/XfBY9PGGY9eI5IJbYbuG46nIIvOrR/rWLj2D3yEHEvPSvEMzTU2H5IU/nvJ
	FbBBHvly7oqjPiX59YO8xz/wDFrWKkMZ0wBHNtsTT30RW2wzSfSXEFt2ykVRIOW7zox1mSlXkC4
	9ZoKucAeXU8dZOct3kR7eQk0S4OhRGXqsGHTNtmIroFgiyp8bPJml3nTFGMZzMBYR8+BkGdtsts
	L+7yGeBp+W1H60rTFIcLBopI5DBO5oPwNrtOXYpaO0xp32ALrsL0JOOJhjexpVhgtAiYZ4febz+
	+tlOKm/l7d9goznkrUmckad/ZS3v3UDxGhN/rtQymZIoy6fiHYzzH0lVNgiHc5uRRkYQJTnfZaG
	09LxXHaAg==
X-Received: by 2002:a05:6102:3753:b0:7a7:c789:881 with SMTP id ada2fe7eead31-7cc368f6d1amr1886363137.6.1792433675020;
        Mon, 19 Oct 2026 11:14:35 -0700 (PDT)
Received: from foxbook (bfd231.neoplus.adsl.tpnet.pl. [83.28.41.231])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc76df1c68sm860902137.0.2026.10.19.11.14.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 19 Oct 2026 11:14:34 -0700 (PDT)
Date: Mon, 19 Oct 2026 20:14:29 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Brian Tucker <brituc85@proton.me>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: xhci: SuperSpeed half of onboard ASMedia ASM2074 hub
 (174c:3174) never enumerates on AMD PROM21 xHCI (-71), works on Windows
Message-ID: <20261019201429.5ab92115.michal.pecio@gmail.com>
In-Reply-To: <e7ec699a-326a-484c-9e05-6278aca24607@proton.me>
References: <e7ec699a-326a-484c-9e05-6278aca24607@proton.me>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/u0A4py4oMa4M5AHQ3/o.ww5"

--MP_/u0A4py4oMa4M5AHQ3/o.ww5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, 10 Oct 2026 07:47:53 +0000, Brian Tucker wrote:
> Hi,
> 
> On an ASUS ROG STRIX X870E-E GAMING WIFI7 NEO (Ryzen 9 9950X3D2), the 
> USB 3 half of an onboard ASMedia ASM2074 hub never enumerates. Its
> USB 2 half (174c:2174) and the devices behind it work, so that port
> group is stuck at 480M. Windows 11 on the same machine enumerates
> both halves on the same root port.
> 
> Host: AMD Promontory 21 xHCI at 0000:0f:00.0, hcc params 0x0200ef81, hci 
> version 0x110. DMI/BIOS, lspci and lsusb -v are in asm2074-info.txt.
> 
> Every boot:
> 
> [ 5.478608] usb 9-5: Device not responding to setup address.
> 
> [ 9.648279] usb 9-5: Device not responding to setup address.
> 
> [ 9.851716] usb 9-5: device not accepting address 3, error -71

That's a very early failure, looks like the first control request
issued to the USB device times out. (Many ASMedia xHCI controllers
are known to internally abort Address Device after a few seconds).

Does this patch make any difference? It skips a redundant reset and
adds a redundant xHCI command to match behavior I see in Windows 10
running in QEMU. Also adds some debug noise.

> Windows 11 on the same hardware lists all four hub functions as OK, 
> including USB\VID_174C&PID_3174\8&15CD6C09&0&5 on root port 5.

Odd, plenty of systems have no problems enumerating this device ID:
http://linux-hardware.org/?id=usb:174c-3174

Regards,
Michal

--MP_/u0A4py4oMa4M5AHQ3/o.ww5
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=xhci-windows.patch

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 7360cb4f3ae2..519f6d76c0ac 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4954,6 +4954,12 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 
 	/* Reset the device; full speed may morph to high speed */
 	/* FIXME a USB 2.0 device may morph into SuperSpeed on reset. */
+	if (initial && oldspeed >= USB_SPEED_SUPER) {
+		dev_err(&udev->dev, "skip initial reset udev->state %d\n", udev->state);
+		update_devnum(udev, 0);
+		usb_set_device_state(udev, USB_STATE_DEFAULT);
+		retval = 0;
+	} else
 	retval = hub_port_reset(hub, port1, udev, delay, false);
 	if (retval < 0)		/* error or disconnect */
 		goto fail;
@@ -5053,7 +5059,6 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 			break;
 		}
 
-		if (do_new_scheme) {
 			retval = hub_enable_device(udev);
 			if (retval < 0) {
 				dev_err(&udev->dev,
@@ -5061,6 +5066,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 					retval);
 				goto fail;
 			}
+		if (do_new_scheme) {
 
 			maxp0 = get_bMaxPacketSize0(udev, buf,
 					GET_DESCRIPTOR_BUFSIZE, retries == 0);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 34f342d2c7d7..c943ae43d624 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4455,6 +4455,23 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 	ctrl_ctx->drop_flags = 0;
 
 	trace_xhci_address_ctx(xhci, virt_dev->in_ctx);
+	{
+		struct xhci_ep_ctx *ep0_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, 0);
+		char msg[XHCI_MSG_MAX];
+
+		xhci_decode_slot_context(msg,
+				le32_to_cpu(slot_ctx->dev_info),
+				le32_to_cpu(slot_ctx->dev_info2),
+				le32_to_cpu(slot_ctx->tt_info),
+				le32_to_cpu(slot_ctx->dev_state));
+		xhci_info(xhci, "slot_ctx: %s\n", msg);
+		xhci_decode_ep_context(msg,
+				le32_to_cpu(ep0_ctx->ep_info),
+				le32_to_cpu(ep0_ctx->ep_info2),
+				le64_to_cpu(ep0_ctx->deq),
+				le32_to_cpu(ep0_ctx->tx_info));
+		xhci_info(xhci, "ep0_ctx: %s\n", msg);
+	}
 
 	trace_xhci_address_ctrl_ctx(ctrl_ctx);
 	spin_lock_irqsave(&xhci->lock, flags);

--MP_/u0A4py4oMa4M5AHQ3/o.ww5--
