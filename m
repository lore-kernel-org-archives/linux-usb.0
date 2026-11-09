Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220132;
	b=S0cHLxyAefJ0Oi59LG/k6ceIGDGFnOFYMOiD1FUPamkd5UlSclyGjwutzUTtr6y7P9P1
	 chbxS1w26mUXHMeXpUl9r0Ut+l94MxnzM8/Xqgm0CdRvlSyqW3xpdqeqQ8coXvvtyKjAT
	 SzMCNxA3HsouhZ628y9Bwu8eWxHtRne4yVeu/AvV2CQDXJO0e5CKIl/w41N3L4D0XCEYH
	 19EU5AKvUgvSwQhWsz0Ed1VthmEoktr/7CBptIvRlCTt3LBOl/cH5d6ckyusV9T2X9Ha7
	 WU3GTI7OX+/HyMCYeAQweko+Mr4M241c+oiBhkWFB/GakGFL1yIy1QlMrIujdU1FTaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ep5ShbwNy4Ud26de6VAtnzZOW23LrgMlmNEZoFSSBcg=;
	b=LnqDcfhHWtYWNhb8KHlM+yVdH8+eMN47f+A+1yql9reuJSsXgbseGKYBzf6ndr8yxlxJ
	 11LZ6XvTD6N2rMWqVuWlsfuLxltztjmZYuG+0HRxxHHVQafpk6UgPMZlSwmlP4PNgDSFF
	 7pc0y11HgohWYqU1XgjpYmc/m2MQx6YZWL5OMhd+guL4Ar61yJ812I9dIqdfRcAYaaU0k
	 ZhUnjtQNEfjaBxS0mth7V/zMDWE0gVwT4Omt8nSW4j+u/RwJ4k1GBOnEDehvH2xfWBZBK
	 7J4DiSxnFXs+bpgvlMWfAUERhGBtY9B9aGWHXgZwQ4yTjK8NfkL87JHYpOM0ckiVOMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0cZQrCp;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690AF606A321
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 10:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690AF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0cZQrCp
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so7211735e9.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 02:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794220131; x=1794824931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ep5ShbwNy4Ud26de6VAtnzZOW23LrgMlmNEZoFSSBcg=;
        b=L0cZQrCpBmu0jyEsRyplQ8A3IgtO9APOOt5xa8TcH+P7fin8hXsrP8XXtN7DoXzLc9
         hs8aA5DFA7xWk5enTgwvpxNK1tuh9wGci8DTpXMOCpvjxims3O3BVijRiG5hCaATcSLh
         iVL8240bxdbTB4wtIMA5fxPiuYSzmpo2vZy0YCB8GKTBazXkX8gBPSZNvplwwxMhL4aU
         GyvnO3HV4HZJ3QAp7EYXQ3Wd8/QJToIVtC7goj90YtGrQJ96RX0Z3yajqK2VQOhktwXy
         RIaeK/4StIRWIOsJmGGVqgepaehuaSvXxP+Xj6QT6JJ1A8OzCavKmOQaM0o1tZCI3Fga
         LcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220131; x=1794824931;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ep5ShbwNy4Ud26de6VAtnzZOW23LrgMlmNEZoFSSBcg=;
        b=Jqniv50ojiija8h7Z1r07s8SdAtWFwDSnS6EPVpzE+HpuJNOLkduZJaoZTRmdd6t70
         OK70h4jEMYtpkCrBdBsJ6Dfiw/GVUC3ZoaebRAc27S6RMAnky1VYjE8FKx8TqWoptoaM
         PTR+EXUTSFScCozSvxkz2upmQOwQlH+DCEbt5Me2Sjnmq5YPebHcA23U6JOZ4154MJE5
         IhtGj3zkWIBw6QQiFBZ63egv1wOLpY4x09Ox7q0F0Ktfr+qNVLb5ZcZhKzPlRCx7yB43
         15h5srFLOObDfH2EPRjtfacsN+94pln2JPsw11suR7LMl/FRWsdOU4lJpl6Zbp5nM81u
         zY6g==
X-Gm-Message-State: APuU4Z879uR02qIGHEo9Q4j/2mv24NYm0446TcWE3Sjo3Nirj258Qn9Z
	Nsz+mf3eAM06pORdW0HEUvSzFUYMsgzXWHqA3zs5h6xjqP7iYwEra+hg
X-Gm-Gg: AYBFou1j32rhjuUGpZDKaBNSWE73bbro1zqtM1Ci9P1odREw968Q5xSJCapwirVN8YU
	e0HLLIfg1YogJ9GjVA1gustiFY7ZaX80scI9nYay2UiQ9gvRre3+34eJOCIgwNmh4TOOfWGSx8V
	cCA2pZ81kakEU6ZmpeQBhBMEkCyGqzoaj1D0lpa0JpLSOvtJkdS0oLvZiGaFhHG9b0mqvqhDlE2
	qBiQsCWWt4KlEZCsifI2nfj4Z+WkSCPuDfq15IElig0JrImSAtNefdC/y8Y7gBl9svKrrA0IA9X
	ucHANncsveEuSsuHObVZRkJs8BRZw8mixzO8rEOao9hqaqV6n4IFqE/w3oA8CJ//g/xhBKxaUQ1
	4FYAXt7wAh7NIYH7AFNANvwpikFKsMZ1sCfA40VMM9paRplkRtzSfw7kflGSaw9ktMOnD6JwnOC
	Jx2FEBUJLEIzb7DNFX0wCvmdo2WbVrdWPaCgg5gPDHbsIOhEO8omgw4PKRo07rJ13sC1lwcVZG9
	LBadQDUE3kkW1Fpbwh+/7uYanzd3ahiEPXhesrqZiwXqkSrj7UeJ1Xlq7uey3WRe/E/KI9G9S//
	02pTNvTsWmy2AgzioeYTlByoYjOxgHKzk49R9rVY
X-Received: by 2002:a05:600c:4e87:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4b963c8c87cmr68207505e9.29.1794220130601;
        Mon, 09 Nov 2026 02:28:50 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7d54d6f93sm360827355e9.0.2026.11.09.02.28.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 09 Nov 2026 02:28:50 -0800 (PST)
Date: Mon, 9 Nov 2026 11:28:46 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Fix ep0 maxpacket update on enabled slots
Message-ID: <20261109112846.04bfeb0f.michal.pecio@gmail.com>
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

A slot in Enabled state has uninitialized output contexts;
it doesn't need and cannot accept Evaluate Context command.
Attempting the command only results in a (harmless) warning,
observed when core uses "old scheme" on a full-speed device:

  WARN: invalid context state for evaluate context command.

This problem doesn't seem to have existed before ep0 update
was moved from urb_enqueue() to endpoint_reset(). USB core
doesn't use URBs before enable_device() or address_device(),
but it may call endpoint_reset() on ep0.

A more serious bug has been identified by Sashiko review bot.
Transaction Error of Address Device may cause the slot to be
reallocated and left in Enabled state, but the input context
is (needlessly) regenerated before actually being needed by
the next Address Device. xhci_check_ep0_maxpacket() corrupts
this context by copying uninitialized ep0 output context.

This matters when core resets a device and doesn't reallocate
udev after address_device() errors. Some HCs reject the next
Address Device with Parameter Error, some break. ASMedia HCs
write a Setup Stage TRB to the event ring and stop working:

  ERROR unknown event type 2
  INFO: task usbreset:4071 blocked for more than 122 seconds.

This exact case is a relatively recent regression, but even
if xhci_setup_device() didn't regenerate the input context
on Transaction Error, next iteration could regenerate it and
keep it there when command timeout leaves the slot Enabled.

We can kill both bugs with one stone by checking slot state.
If it's Enabled, do nothing and let next xhci_setup_device()
configure ep0 later. It will actually ignore the packet size
requested by core, but its defaults match core expectations
at the time of address_device() and enable_device() calls.

Fixes: e34900f46cd6 ("xhci: Reconfigure endpoint 0 max packet size only during endpoint reset")
Fixes: af8e119f52e9 ("xhci: Fix Panther point NULL pointer deref at full-speed re-enumeration")
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e5c8b3a945a6..fa367d6cd21f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1566,6 +1566,11 @@ static int xhci_check_ep0_maxpacket(struct xhci_hcd *xhci, struct xhci_virt_devi
 	int hw_max_packet_size;
 	int ret = 0;
 
+	/* Only slots initialized by successful Address Device command need updating */
+	if (GET_SLOT_STATE(le32_to_cpu(xhci_get_slot_ctx(xhci, vdev->out_ctx)->dev_state))
+	    == SLOT_STATE_ENABLED)
+		return 0;
+
 	ep_ctx = xhci_get_ep_ctx(xhci, vdev->out_ctx, 0);
 	hw_max_packet_size = MAX_PACKET_DECODED(le32_to_cpu(ep_ctx->ep_info2));
 	max_packet_size = usb_endpoint_maxp(&vdev->udev->ep0.desc);
-- 
2.48.1
