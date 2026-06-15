Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0291E3A5E71
	for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 06:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503946; cv=none; b=AhaVTk7Wuqklhwyj46R7h1OZKXqYI7VPYhWefJvRfZgs+ANOktcVLdIp3kUSY3/luxrWfEOiyCCDTQ2lM6sXIJnL9y/5OKEkdwYHzd3pdhx3hZBkSkWGtMMZ+urHoEIgx5DPMLuitXw2giOtRrIspYa0gCOdt0xsgHg24JXgQH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503946; c=relaxed/simple;
	bh=fiaEpLMoSTTLWN5RAB+e2V+zrRn9C1pdqE1a/4H/dHk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=r8i3SbAFbdk5EwHrk9DaAYW5/A2xSxDqZrMDNreJAZDXNvECp6JtVWU3QuiqTQnk61h7u1cWmRP5gNHvKChmHEsbsV8a8mmyAy3JL2Jb7t+VCv1FJUDpWDkD0tyy5cq4MJLHwdFVKExV0P+/zBD31PIMj4MdV4TrLTC9cXetit8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVEK69Sx; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVEK69Sx"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36da151a152so2034914a91.1
        for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 23:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781503944; x=1782108744; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H4MY35j38zKZqHIBGfhBPpLsbB1y1+JPTM2zRf9KQbY=;
        b=IVEK69SxWw2eFctsxg2h330SIjbxxLnFQU7LXVHXDFZmGiiGkn5YZAICbL9rkA8ysl
         LWbPsfpLT0L/dBXeD6JcTAStf9U+4jdygPNu6tvUyMj8imjOF1PPcu8c/npuRRRceCCS
         uRIPC6yNFzSLPrtoULX80zR/GZS/CfoynYYG4aiddNL3TiA+ScVxa7tQMzK8vnrjzR00
         chyHI7YF8hI4jQikks52gQJUvvI4bc5qwzlIMCRdhL5na8prNAEbbT+0bwFSyYs1GxJb
         d+fp+gmtdH4x+vo8iDBrD9HtZO33pGsZvqe+yg/gSBBBL4bDBQnWLqLBNMHhtRzu4Oyb
         mWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781503944; x=1782108744;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4MY35j38zKZqHIBGfhBPpLsbB1y1+JPTM2zRf9KQbY=;
        b=W/dbMRiHhvnmK1fvqT6+KRWLI5CsgPYi6fT9ZQtqZhMqaG5GkNikid2djxMmOMcs3l
         PKs5OxwXkFeq8lL2JndLvQH946oOwnI8MkJS8BO2+zjXU9I6JrdgEa3tCQqrx2HBoC/h
         iE4vsVlw9YS/pqvQeUfIbm61ZSu5nrLC6gR8cGJKivgm/X2AgRsVSvAX7iLHGuAGGw8N
         ucYdKqZtn8jEz/WQlWRIqPrIyXYputwFXKPAdy4UvNI0psZVN22erQ64U9mGvUesD2V2
         dz88hYXJw7z0GNq18B3aMMj8wMZq/jkjSAmP3lUXbWvhTtC98Ua8qF/IJ3JrPPt8bSMa
         MXTg==
X-Gm-Message-State: AOJu0Yxt7LCuX4EMkVtpALlQCkSMNP3pi1CEniEeTM7RORn8sVj/7v7G
	hQ4FXZCQLZAb2WK1waKvrkJceMP01WossgEy1aoI13EW0im5o7DjIUCPRq1PXA==
X-Gm-Gg: Acq92OGWxWOn0C3dAu7dS09fRj+RVs25S2TULpHv4hRzIzVm9xoLdMsGxN9cx3qBxaa
	O2TMR5V6bMgvrBET8mmQrZ8WSIEhlTTnQFqPDw58qQuI7Q6MMr1g60Nrpt1V315gXWxXiEkA5dk
	S85DFeEu1QN+2wDUdQ9wGZGkP6/Kc1R/LCWyc2JCGGv0xfFC0NeysOLst/jpZRCOECoY02jVsAM
	FYG/x4IOqYXyy19t2LUUjxBbr8SQv6XWJso5ojZF6D/453AkJ2FdZg9tCsZmG6pEXGq+4BE4xKo
	BFfyw5vRbr5dexiKuxHbZG3wE1QftpP19WUPgll6tOcyc0VV9gLXRP/tueGmEDtou+vcOzEr1g2
	0Zc8pHo61PZ9YA1xLsphUdMXQWPZzgEvQynXkyayWcAH+byp2CL/o5zDeVhoI3SjK7K3zgfkpch
	Ha3eLge0dE2gENyChWopTBauSyuGxdaZazTEiCTJcDtfP5UmvI
X-Received: by 2002:a17:90b:2dca:b0:36a:6ac2:8bc8 with SMTP id 98e67ed59e1d1-37c2bcef7dfmr9190949a91.14.1781503944011;
        Sun, 14 Jun 2026 23:12:24 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a233f4531sm9327814a91.2.2026.06.14.23.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:12:23 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: kalmia_rx_fixup(): possible out of bounds read on a short RX frame
Date: Mon, 15 Jun 2026 14:12:20 +0800
Message-ID: <178150394040.1087339.3314243829968462233@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi all,

I was reading the usbnet rx_fixup helpers after the recent endpoint validation
fixes. I think kalmia_rx_fixup() in drivers/net/usb/kalmia.c can read past the
receive buffer when a device sends a short frame. I am not sure about it, so I
would appreciate it if you could let me know whether you see this as a real
problem.

This is the relevant part of the loop:

	if (skb->len < KALMIA_HEADER_LENGTH)        /* 6 */
		return 0;
	...
	usb_packet_length   = skb->len - (2 * KALMIA_HEADER_LENGTH);  /* u16 */
	ether_packet_length = get_unaligned_le16(&header_start[2]);   /* from device */
	skb_pull(skb, KALMIA_HEADER_LENGTH);

	if (usb_packet_length < ether_packet_length) {
		ether_packet_length = usb_packet_length + KALMIA_HEADER_LENGTH;
		is_last = true;
	} else {
		is_last = (memcmp(skb->data + ether_packet_length,
				  HEADER_END_OF_USB_PACKET, ...) == 0);
		...
	}

The only length check is skb->len < KALMIA_HEADER_LENGTH, which is 6. Say a
device sends a frame with skb->len between 6 and 11. Then usb_packet_length is
skb->len minus 12. It is a u16, so it wraps to a large value. Now the check
usb_packet_length < ether_packet_length is false. So ether_packet_length is used
as is. It comes straight from the frame. It can be as large as 65535. It is then
used to index the memcmp() above. That memcmp reads past the end of the receive
buffer. The skb_trim() and skb_pull() after it use the same value. The buffer is
rx_urb_size, which is hard_mtu * 10, so 14000 bytes. CVE-2026-23365 added
endpoint checks to kalmia_bind(), but it does not cover this path.

I do not have the hardware. So I called the function directly with a crafted skb
on 7.1-rc7 with KASAN. The frame was skb->len 8, header 0x57 0x44, and
ether_packet_length 210. The read goes past the buffer and faults. The address
is the frame start plus 6 plus 210:

  BUG: unable to handle page fault for address: ffffc900001a40d0
  #PF: supervisor read access in kernel mode
  RIP: 0010:kalmia_rx_fixup+0x9a/0x310
  RAX: ffffc900001a40d0  R12: 00000000fffffffc  R14: 00000000000000d2
  CR2: ffffc900001a40d0

R14 is 0xd2, which is 210. That is the ether_packet_length from the frame. R12
is 0xfffffffc, which is skb->len minus 12 after it wrapped. So the short frame
made the length wrap. Then the value 210 from the device was used as the offset.

The smallest fix I could think of is to require both framing headers before the
subtraction, on every iteration:

	if (skb->len < 2 * KALMIA_HEADER_LENGTH)
		return 0;

I tried it. With that check the same frame is dropped and the fault is gone. I
am not sure how it fits with the "Some small packets misses end marker" case
just below, so I did not want to assume. I would appreciate it if you could let
me know whether this is a real issue, and whether that is the right place to fix
it. I am happy to send a proper patch with the reproducer once you confirm.

Thanks,
Maoyi
https://maoyixie.com/
