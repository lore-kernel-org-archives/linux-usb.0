Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171270;
	b=VQXjJ0aZWYx0D7/OarQiRMJqDVAzU/SAN5awnXvDxk46OgCTWk7XBOX4EbKTxb2pnby2
	 SgG/bcfSylBBSYzR9cHBJagjWN1BNXMdZ15US3YPj+e0TowJcs3JWVcfCkFGVkb6TD71z
	 yN643ANbAlttRfyWBIdO3GXOGX1M3+ptYSSBXNduyMtdAtk3rH1OhNzRZ3shvTEKlhbXj
	 gUHwJFx24zQNrwYCgjAvJY7YFls0+f0FRoWAUEiS1YAQwkdLQp/+4e+UirY0GgZNjgJ5Z
	 xcGRluoR+6joLi57HFnyhX/aY02s41meC3cXm1xKFW2uO7tdwXBFWNQfI2X5jKcIzjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Pm025ZShfKc4fvyqH4mMFAlI8sexFbSUc+W1NS0NOoo=;
	b=Qr7ZuD3RJWOLQMjFDYMAD0uuFO+nn6A01zXOYeqtuLzoaFfm4YY8hxHX8Qbt6hTNEqUD
	 V0ffHp3BtYAcNXeWQs5khsSEBWq2kYbV3ejj5xYj5riG+0mozqjiUQWYyP8uAu7tBZahB
	 rFAry8c0DR93Si+HPvvFdiQl7s9sbsWRXPr0oLzSfi9w3FCVuZxTibUJeKlDXts9VyXML
	 a1OY+UgaXw/pO5vG6QIy6g0jpMGGqekcCtFAREzx1i0yIhVydOi5v4es6d1/ocEeR0DBT
	 3HGYDffRMjGra91IFQQ7gUf5lxEaxUWZhJvg4NWSF2Jb9eZ7I1TE8bzamXXuaWpyQQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPdOSZlP;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A00B606A31A
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 07:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A00B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPdOSZlP
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4649b35bso503794f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 00:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793171269; x=1793776069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pm025ZShfKc4fvyqH4mMFAlI8sexFbSUc+W1NS0NOoo=;
        b=OPdOSZlPSj9DA8oDEomz+bQ3YkVYkxaEniwzPca4I9yuIyCfukGlqAaWKCFqdXCUu+
         oprGBNULLqVUI+9cPmYIQMo1T1+E24QMSgfSFqviWMHN6eoejA4mWdmlZDiAMRwwFP2Z
         ufZbmB0+ewVkOVB+Oozc3OHVlNVuX9pCe019zELkDzi2UdRE12Ui1TkbXZjr3RiM2slx
         mU8FghO4oNHCBHeHm3mnDk7a7TLmGGI3r8YOH4xJTYMXpEnoAUlA5Ny3Aibx+pPBmOlA
         VY1ioLxV0SS8Bv/y5/ayVKk4DOyc6ezDsx6iHTNe8THZy1OkDu4quZI20o7FMLFrUq1o
         Qwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171269; x=1793776069;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pm025ZShfKc4fvyqH4mMFAlI8sexFbSUc+W1NS0NOoo=;
        b=GSqYBoGqo4dU1fI7J+ZHNYX8490sX6X9I2nm/e0MImRenv3Q9ct4wIxvQjjj435qab
         QggTfKaCRc3LeqN+1lw7bqDQN6bzSkeg8XLBm40yED5h8GORVk5gKjYhvoDFJXBhKYhr
         7iLgzHUwP1XvZnAIBfxkgnU6h7FxBZj99V2kg/m7fTODxBC+tBa9/1VsN8lyvHrpltgB
         LmEfwes+EZ/lQKig0YsaVPy5AKCq0BajIfp/+zWlMaD9L1n3LmlvuUZuXvz00QoW3QDQ
         phYLxE3E8fJU95wOts8H0uivgugchgoo3BEwqmo6yxdCVscTSYpBTj2/HUZmuMgNXl0I
         HeRg==
X-Forwarded-Encrypted: i=1; AKwUvBwjShZNY6DoT1WH28EPxYEQIe+0tNTtVOp32bgjScfXgfkI2Oga2mFcrFBsIR2VqiYZYLOePTrz10w=@vger.kernel.org
X-Gm-Message-State: AFq9FYISB7jRTnJid55T8tXMmfiMYVMrk8qH7/ZBWckmmhyzZKExtq3s
	RTthBAlGHZHuRg0Xg3uDpF+HTbJzIsexYhWwm30yEBSAyue/i1Q4P5phk4FO/xbe
X-Gm-Gg: AYBFou0e6BEuQ0kGdlKqD2medcr2OpJ0RP1hqHBI90atPY85cyL/UWX7yJf/kcoBp8h
	eAyr7GvhsLH4IK8IDE9XOtF7qnE/QpNq843VeF9PCOFEGy1pC++JtxSUzeMQs2ttnP+JDGCwL5w
	5dD/bF5ps/Uva4EMgiihuxfuH7dmly1mkrhjv+RD+mxn2d0DpRzxtz5YZ+aThX/ATYl60id2/qW
	KvtVu0RcsFikG/EC4O20s0aZWSmJb9Gp5TE+LQzmT1TT3ZABYEYn1wthjF+vLSh5JAljlwEoe+a
	HaoHAf0I1hc+KywWIVUrxnlJZWT8RiZC01V+ledAIjfzg8zCeLr4pYvGrPt2MJFeuWtm9SBrBXV
	6vtS13pZNE61DECLkR/T9HK7DKSobnJ+6jF0OLIn/+0VIjZ+Ya+hE78h4436m0rKIznGQ1ErBvO
	gUTD33TjrCoZwVoB0OqSwUpl3SQ/lWZN//HfEGPOZ5FsvgZO+GOjZnApD0711ci/n6act4P7X42
	Yvww2Fmy76GXRwC1tWFNfLSgwkixZXPx5yeIlKS1WmjmUSoyDG8RpVmcEBQpDeUunBaTJ/CBTg5
	79bKfIJ57pD6fjlGQDduI44xNH/l21ATrYgfIQ==
X-Received: by 2002:a5d:6f13:0:b0:48e:4e00:b737 with SMTP id ffacd0b85a97d-48e5d56d4fdmr3824012f8f.54.1793171268566;
        Wed, 28 Oct 2026 00:07:48 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm26280670f8f.6.2026.10.28.00.07.47
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 00:07:48 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:07:34 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: yiyu@yiyuzhou.io, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, diogochaves@me.com, raoxu@uniontech.com,
 dennis@dsine.de, gregkh@linuxfoundation.org
Subject: Re: [RFT PATCH 0/2] xhci: clean up endpoint rings after disconnect
 detect
Message-ID: <20261028080734.173da0e4.michal.pecio@gmail.com>
In-Reply-To: <20261027192128.386082-1-mathias.nyman@linux.intel.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
	<20261027192128.386082-1-mathias.nyman@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Oct 2026 21:21:25 +0200, Mathias Nyman wrote:
> Yiyu Zhou wrote PATCH 1/2, fixing a regression in USB HID device
> enumeration caused by the endpoint recovery prevention code added in
> v7.3-rc1. Some HID devices that used to enumerate after a brief
> disconnect during enumeration now got stuck until URBs timed out.
> 
> PATCH 1/2 gives back the pending URBs right away, which solves most of
> the problem, but it leaves the TRBs of the given back URBs on the ep0
> ring. ep0 survives a brief disconnect during a port reset, so the xHC
> may later process those TRBs during an enumeration retry, writing into
> buffers that were already given back, or ep0 stays halted and the next
> control transfer times out.
> 
> PATCH 2/2 cleans up the ep0 ring by resetting ep0 and moving its
> dequeue pointer past the cancelled TDs, even if a disconnect or link
> error is detected. Only Reset Endpoint and Set TR Dequeue Pointer
> commands are issued; ep0 is not restarted while the disconnect is
> pending. The rapid endpoint reset, restart and stop sequence that made
> some xHC hosts fail Stop Endpoint commands is still avoided. Other
> endpoints are still given back without resetting them, but their TRBs
> are turned into no-ops first.
> 
> If you have seen the HID enumeration issue, or the xHC Stop Endpoint
> failures with rapid endpoint state changes, testing these two patches
> would be greatly appreciated.
> 
> If these patches work, they might be squashed into one before going
> upstream.

Might? :)

1/2 is a possibly dangereous regression and shouldn't be used alone.

Anyway, I think it all can be done with a bit less code, while also
handling disconnection during unlink. Particularly on EP0, multiple
URBs may be submitted by different drivers and/or userspace. Just
because one of them unlinks its URB doesn't mean that the others are
aware of anything being wrong and won't stall for <N> seconds.

This below is a rudimentarily tested RFC but it seems to work. It's
simple enough that hopefully it might even be correct. I will test it
more and write a changelog later today if there are no objections.

I tweaked the logic to return everything with -ESHUTDOWN and not
bother to assign proper status to the URB which halted. Intuition:
we want them to give up, not call clear_halt() or reset_device().

---

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index fa6684746305..b37056cb8576 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -987,14 +987,11 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	int err;
 
 	/*
-	 * Avoid resetting endpoint if link is inactive or device disonnected.
-	 * Can cause host hang.
-	 * Device will be reset to recover an inactive link, so don't do anything
+	 * Mark endpoints behind disconnected or SS.Inactive root hub ports.
+	 * Restarting them is futile and known to triggers HC bugs on USB3.
 	 */
-	if (rhub_port->link_inactive || !rhub_port->connected) {
+	if (rhub_port->link_inactive || !rhub_port->connected)
 		ep->ep_state |= EP_DROP_PENDING;
-		return -ENODEV;
-	}
 
 	/* add td to cancelled list and let reset ep handler take care of it */
 	if (reset_type == EP_HARD_RESET) {
@@ -1011,6 +1008,12 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 		return 0;
 	}
 
+	/* Don't reset lost endpoints, only EP0 can survive device reset */
+	if (ep->ep_state & EP_DROP_PENDING && ep->ep_index) {
+		xhci_process_cancelled_tds(xhci, ep);
+		return 0;
+	}
+
 	err = xhci_reset_halted_ep(xhci, slot_id, ep->ep_index, reset_type);
 	if (err)
 		return err;
@@ -1022,6 +1025,9 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	return 0;
 }
 
+static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci, int slot_id, int ep_index);
+
+
 /*
  * Fix up the ep ring first, so HW stops executing cancelled TDs.
  * We have the xHCI lock, so nothing can modify this list until we drop it.
@@ -1047,6 +1053,22 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
 	if (ep->ep_state & SET_DEQ_PENDING)
 		return 0;
 
+	if (ep->ep_state & EP_DROP_PENDING) {
+		xhci_dbg(xhci, "Nuking dead slot %d ep %d\n", ep->vdev->slot_id, ep->ep_index);
+		if (ep->ep_index) {
+			xhci_kill_endpoint_urbs(xhci, ep->vdev->slot_id, ep->ep_index);
+			return 0;
+		}
+		/* EP0 may be reused after device reset, clean up the ring properly */
+		list_for_each_entry(td, &ep->ring->td_list, td_list) {
+			td->status = -ESHUTDOWN;
+			if (list_empty(&td->cancelled_td_list)) {
+				list_add_tail(&td->cancelled_td_list, &ep->cancelled_td_list);
+				td->cancel_status = TD_DIRTY;	// for clarity, it's redundant
+			}
+		}
+	}
+
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 			       "Removing canceled TD starting at 0x%llx (dma) in stream %u URB %p",
@@ -1061,12 +1083,6 @@ static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt
 			continue;
 		}
 
-		/* device disconnected or link error, ep will be dropped */
-		if (ep->ep_state & EP_DROP_PENDING) {
-			td->cancel_status = TD_CLEARED;
-			continue;
-		}
-
 		/*
 		 * If a ring stopped on the TD we need to cancel then we have to
 		 * move the xHC endpoint ring dequeue pointer past this TD.



