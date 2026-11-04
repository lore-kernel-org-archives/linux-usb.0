Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755660;
	b=IuCsXaUmDKBM+ML2W/hVKhIenX+GI44jATX3LyYPEbbrTRn1bjuYAeYog/s0XndFeIV7
	 aGDGnv71tON0XX3VBJ8CAxanSL+Hnjpc6I699zPSdezD2FwURWDaJ8YAAfnrWLQ5SjaT3
	 CWvayI1Vy+dLr163bdhfhT0LXzDjkEnlI+lnqags3KjUmQLuJfNhc/ggSINM4QhUmlsLI
	 1/E9uchs6wQM3PvMHQzL75GePxy9cuILopyX7JnKdAS1lUiD3G9s/wqNqb4RkA5GQZcT5
	 6Iv7I5UiKeSqljofJNfLc7T7V3FY7Ul2jqmY2oZosyZb9wVOhENe5JBq1BRc9fNGudQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LcfBCZa5adH08J2gOGj2C4Qobxoxc6wsW6LJTMDHw6Y=;
	b=JKqsYOqVEwGRdffArv+Vsg47Gf9fJca6PUTBzB74xVl6XLS/49x0yT4rBZehL+ZhVZJg
	 vByuh/69tAQk43SDWg1rJLPwDQCOV+UlXBi3/V2NZ5wjt2RpeIcX2UDouNkK6DdPEsIPp
	 7MkErZcIY0/Pwfh6TzIVzcYqNLspMgoN2dMdvgSX7Ps+bzVZhilWqGJqdN4pY5VMggWy5
	 xOVjal844aWEOxTOYj0zKCiLLo8SGLaVMvNoaHbIHP7DsebA0kr0BhBaML7RWv9mQ1NrY
	 3a0SDF/goOqaMdpoDdkYkjVo0meUeY01dRsGkcchCBB+WnAQbUizd5btXh3ZsWJMVww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gyjMmLt4;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE417606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 01:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE417606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gyjMmLt4
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso79516a12.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 17:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793755659; x=1794360459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LcfBCZa5adH08J2gOGj2C4Qobxoxc6wsW6LJTMDHw6Y=;
        b=gyjMmLt4u4A5pCxKBpjcV1+7W4eE4pEpOw//Jo0IBR9CJJ0cXZCsimaSkQcfVjNmzt
         JhIKoYGmCDw9Jyx5LmvtOvt4gh93G05bafAt/lkzpOSEwKpldMveM5k+wy83M7R1F/M2
         AjBaCXBp1MV9JADZazesyFX8brExYJxWwBO3xs1ECJ1oNX8qWu7M9tp4ooOxvRT5Dcxu
         czMlAV7tVQ/9cwFJoZKusQFIuVy9amhCFyYoFRbJ3xfJS+Dv74DxVnnkqu/UivFx7l5Z
         g6H1hknBoF7NzBTiuwiens2zvQA5WbXbxy+SphHR1gzdP6x9dNtBpA+CS6TcEDHbalS9
         ofLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755659; x=1794360459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LcfBCZa5adH08J2gOGj2C4Qobxoxc6wsW6LJTMDHw6Y=;
        b=x1DjPDwNliiOoPRnQMmXo4coFb2PWNg0KfzNj9Fi3Pran4ReeY/ahJ6MplIpNYYlGS
         KybrNMRdvk/5M2UX/BO+JE1tQsWNOqHIWPBUCHS5Tnzqjz1YjQb9Y62IyJ1xMtzbqWIh
         qJfLSqMFHVAcTcMhPk66T0hKUfHJItZRKdXaLOP35cY+oUh9zHOaPKI/Fvg+dlO7Eumg
         X0A2cSEfiGrcScvYmbHJyTLLelqt6CQetv0lVzOPuJ9oMWjo+Jxleune+VXfwgH3yvp2
         nA4f4XIq4h5SQh4E530TzbReFEo9ruZxNfUczattL3QSa8QG1e14YFLtNntxUP4coo97
         5d3g==
X-Forwarded-Encrypted: i=1; AKwUvBzBoaphQrTm+M1cl3W3f+bdNnlK69vrsrR/SiNo047bY26oiCcTI4GO6IGGcV+psT/7yo2snSKgcz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2KeN1ONGv2eIqiCZHhImYeZ0oW4erKiD0v1jvTgJYxWzUFvH1
	gBy7eLS6cadYRnkW4f0x4ZKkyYrNzY8+hm2DnO1+GQqFyRFVvveKODhs
X-Gm-Gg: AYBFou107bNAdKlUad+9tPP4Ctj6fthqJSa+Vsv0F2yJeyshHLD3RRvohotJgsz1loZ
	7Eehgxn1RfukUVW2qV3iGuG9galF0hOXE34Ozv16wFN5taMfoA13564ilD+kL17K5pMb6zNaCyC
	MSIbdNd2UqO0AI+QESeP/HuUebMsdWXi8wDBtIWKtfrsyROKwwKhefrxeOn4xrElRzFXszkJ2lq
	ry/J/wK4kJxLyuwUB+9T11shdQ0CfO9eGDLLZBGuApifQ+5zwYrXWCHf2BIvV+Fuk44t+rIKI+K
	XBxbEpEDyXM5FGhP7eI30w9T0kaODR0kjZhXFJdpJQw9+VvP04rxXSoG2ViphkNoUYIuHW65hM8
	xcrBgkjc+fFihvhJD3MLcO/hmoqAUSUPn7dlj51A9eBe3U0hVvVe7wgAGGrymrmSGFyydFZ8knG
	lYclM/+cEhj4nBNFbOG2Q29na8Br1kxiUPaakI8rDNEQAeL4w9i9zGQbxK3Dt2QTURxCMKWEJkc
	suoxlKekvkQx5+0pP4jah7paXI25Yh64w4TqxYejZFr9vYtCGO87DBs+qTEsa0UAf6DDxhO8uFe
	z+NQsfBmoIUQw43PzOoHYnXftxaUN6Ys8e3NvDMkZVV7PqvNVFZaZvTKDq9X5KmBpf8q45LZoDP
	SYObd
X-Received: by 2002:a17:90b:3e83:b0:3ab:2737:3396 with SMTP id 98e67ed59e1d1-3ae89855ccbmr12751140a91.65.1793755659155;
        Tue, 03 Nov 2026 17:27:39 -0800 (PST)
Received: from evo ([183.171.191.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm1334902a91.1.2026.11.03.17.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:27:38 -0800 (PST)
From: Ambareesh Balaji <ambareeshbalaji@gmail.com>
To: mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ambareesh Balaji <ambareeshbalaji@gmail.com>
Subject: [PATCH] usb: xhci: Tear down host on Reset Endpoint and Set TR Dequeue timeout
Date: Wed,  4 Nov 2026 01:27:25 +0000
Message-ID: <20261104012725.147741-1-ambareeshbalaji@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a command times out, xhci_handle_command_timeout() aborts the
command ring. The aborted command is turned into a No-Op TRB, so its
completion is handled as a No-Op and the command's own handler never
runs.

A timed out Stop Endpoint command already halts the host and tears it
down. Reset Endpoint and Set TR Dequeue Pointer timeouts are not
handled, so the endpoint stays halted (EP_HALTED or SET_DEQ_PENDING)
and its cancelled TDs are never given back. A driver waiting for those
URBs, such as usb_kill_urb() during unbind, then waits forever.

Reset Endpoint and Set TR Dequeue Pointer change endpoint state in the
host controller only and never talk to the device, so a timeout means
the host controller is not responding, as with Stop Endpoint. Handle
them the same way: halt the host and give back all URBs with
xhci_hc_died(). The endpoint state flags are not cleared here, because
the endpoint handlers and URB dequeue check XHCI_STATE_DYING first.

The timeout was reproduced on an AMD xHCI controller passed through to a
QEMU/KVM guest. An endpoint halt was set on a usbhid interrupt IN endpoint
and the doorbell of the Set TR Dequeue Pointer command queued by the
usbhid unbind was suppressed with a kprobe, to emulate a host that does
not answer the command. Without this change the unbind blocks forever in
usb_kill_urb(). With it the command times out, the host is torn down and
the unbind completes. Normal unbind and rebind of the same device is
unaffected.

Fixes: c311e391a7ef ("xhci: rework command timeout and cancellation,")
Signed-off-by: Ambareesh Balaji <ambareeshbalaji@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index c23434001e9c..b03ff184c074 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1755,20 +1755,23 @@ void xhci_handle_command_timeout(struct work_struct *work)
 	usbsts = readl(&xhci->op_regs->status);
 	xhci_dbg(xhci, "Command timeout, USBSTS:%s\n", xhci_decode_usbsts(str, usbsts));
 
-	/* Bail out and tear down xhci if a stop endpoint command failed */
-	if (TRB_FIELD_TO_TYPE(cmd_field3) == TRB_STOP_RING) {
-		struct xhci_virt_ep	*ep;
-
-		xhci_warn(xhci, "xHCI host not responding to stop endpoint command\n");
-
-		ep = xhci_get_virt_ep(xhci, TRB_TO_SLOT_ID(cmd_field3),
-				      TRB_TO_EP_INDEX(cmd_field3));
-		if (ep)
-			ep->ep_state &= ~EP_STOP_CMD_PENDING;
+	/*
+	 * Bail out and tear down xhci if an endpoint command failed. An aborted
+	 * command is turned into a No-Op, so its handler never runs and the
+	 * cancelled TDs of the endpoint are not given back.
+	 */
+	switch (TRB_FIELD_TO_TYPE(cmd_field3)) {
+	case TRB_STOP_RING:
+	case TRB_RESET_EP:
+	case TRB_SET_DEQ:
+		xhci_warn(xhci, "xHCI host not responding to %s\n",
+			  xhci_trb_type_string(TRB_FIELD_TO_TYPE(cmd_field3)));
 
 		xhci_halt(xhci);
 		xhci_hc_died(xhci);
 		goto time_out_completed;
+	default:
+		break;
 	}
 
 	/* mark this command to be cancelled */
-- 
2.56.0

