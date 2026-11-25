Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625434;
	b=0cV3SkUM6TQtKh/NjL6w/mg8aRZ++EUFdZ16KoOKV7aP9vWuzVmIBr/hSy2WPnKFRWf5
	 HxXnYCoIHEoiE49B/7BmegcpfuI+9el0fEZmPQvqhrzF5pwgdByEPqvb7WjvY7Ova9Oe6
	 xFFQosAoYS/9ZYSyu3JXbwa0oaCw+gd42QpGnu1yYfHJd19LTLCsOCrk7tMiORj/h5HVj
	 JuskzILkIC5dYQeqEC0fWIJwJl8+8A7gD6LRukbDu8svFVYnhVZ32FVslHUFPTdXLmfdC
	 xIm0SFANKFWT83HObwsC36KiFV3PzRQdcCshv4XnJSoJM5+HK2SXifJOboeUBGr32jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IqbHK1Rz6XwZQzZu8IQOXsyVB6HxOTjsv76buLj3jrU=;
	b=dIi/R+njmsuvvqGNFoyxI6e+aqYleIxJ1BlgPPXJhZBmGAcPm0gbOSgFGRZiLSm9uwI3
	 yC2FzK+0I7CNNS2vS9kyTWLqm4nPZgrUnQ3cResy30zfNNMIXLeb0U5cXABF5kKGDwl3L
	 cZuagHOOxuMvNdoru/7fIgvH9edsdbI5q+MHn/1eXAN9rlpOva9pQ46lZ5ioSSmbyYMze
	 XbOyHvbCT+2uZHJu/zQVm2fmu0D5z77rNsH2V8WH0nELvsw/27NAU0h8KZgC2JDGzM+jV
	 n3EFy92oqvARWDZXEd9lhJZhqvhPcxDrzzkNBxAbmZcdcwXJWYzE35LQLaAyU4g5ZTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FLeiIUDH;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA6606A329
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 16:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DEA6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FLeiIUDH
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-943e8d35f74so594387085a.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 08:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625433; x=1796230233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IqbHK1Rz6XwZQzZu8IQOXsyVB6HxOTjsv76buLj3jrU=;
        b=FLeiIUDHarPUwXeBJKhsCmxsiFkqDJh8CZq+u7lL/iBKU6A4LwrZzR44wxVLWVxO1y
         TESyleMO6UzunE0huePzl/H4MTfH2ltRbRol0S1hwiXShY5hST1DMAzr2TGEia959E8z
         rHgi2PrsgtSMdt/XGBIbNRug3scAWuXZal32/yaisi4qJc7J27+vhW7pe3JuHJ88+hZT
         SWXLaqL1WjwGmXPnfjG+c3SEeGyJXGFqmihPCkXUIxNd/pC0z+fhZl20HF+QRdTv8c3J
         fpoFJJoGF4KCwvHniqUfER4XP4xLpEbGsL5fCYOXuFblkXNDy6vWi/UwaJXZuV+f6hTm
         wk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625433; x=1796230233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqbHK1Rz6XwZQzZu8IQOXsyVB6HxOTjsv76buLj3jrU=;
        b=N1ZRBJe2czV0PKjYh71QkzyoOQosVTETpln7J7emEB5N3O7u03taePTbLlZUTXdXXl
         omyAfQDvTR2DKIjNAHCEg1HhObgR2C3fpM65BHkTOTCLt6v/V7kogD4XdKmFPiDp00l4
         84ZmfbSAtrFjIslK9uIOp27pHfdad2I7xAhDzjx3oDIw7rQo0BSGvI9oe4BPUHEnOX1q
         IwW8Ucg/bfVN0PHFY9D8bVTpLuBg5LKdE0BLkgot5rYbViWUUYFw/aopJSls/eLpzBmn
         tvWfjTnD0VYmxhYndiW3xiKtGwV1udOTffLmL3mKuyLlKFl1tBi68ri4E1rZZg/EK9Wd
         id+w==
X-Gm-Message-State: APuU4Z87ZteKXwI4CtKTFRpdOcFiyXbos+5sp3aOHk0JbuF8liOsTYLQ
	fFQ4hHkrxJBHJ5zNeg7moxQsiUktJ9HoOn6hMEZkG6UjAKO0ydoCWIel
X-Gm-Gg: AZFdTZenaUj8YMmlG5anamqttNxy4ViWJDYZiuyZkATPk9H1w5F5VxI+KEatdTiWe0x
	SKs6yebUvsaA7DnuQDvKtII7mRZb8+0bGOpSOn8LQHheSzpyxiUI30T3GXNM6hUOAb9eJHymNNi
	38lQj2gsOC8vgCONxFmsufendNb7J5d340Ep2eC88FizQxRwr0dPe+LajfARjQ2YS94vhO9r4JJ
	xRPUx9REUvnyXle/EmqQ4JCCLnnAP4uIhj57wKiM9nmL0rEDkPJ6M/2r4xPi+UvdrpMpKAU8uAJ
	IzpF1gPM3KsPrEiXm+/FVarNOSY+hzkiZpAzLjKy/yH8TQiOhPJIqfbqOVHDcUzc47mLW1mWpQp
	ks88K3nFMCPXFElikKXtBhuX03JqbS95dElOS2EISPZ4c/2wkuTEIN36VwTwUb4fMysP99NSzKO
	dGkyEJnyufA4NVKtBY/xgy/dXu+Z2VruFoORirjskla1yQjapuOtHu3bhx07rqYSpp6BIesTaT8
	W1dy29t9rlIQPuo4QHrPnlxUn+9H0OV8PeIbrCI5OcHtEFh2gA/WpyoMpaN9P/Opkkng5+dydIB
	J1WdKmjmFULSgrASm9PRcdcj6wYQ44f6G6r4C1uvTtfOpdn29FLaXgLA1rTu58t/UP4w8cBrATV
	6E4dHKnuBwKJT5yBJBYYHo+fXgf6eicqeJT1EPq3Kz4SjR9axZarbwfJRL+U3Ufb6VddAYLfsRT
	P/G2Mbn7e4PF3Nt0M/07lp
X-Received: by 2002:a05:620a:4713:b0:93f:31bb:e3c with SMTP id af79cd13be357-949bab1060bmr3295147185a.68.1795625432801;
        Wed, 25 Nov 2026 08:50:32 -0800 (PST)
Received: from localhost.localdomain (pool-100-36-104-180.washdc.fios.verizon.net. [100.36.104.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a017cfb46sm310015785a.28.2026.11.25.08.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:50:32 -0800 (PST)
From: Dmitry Dagunts <ddagunts@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: musb: host: don't add the sg offset twice in PIO TX
Date: Wed, 25 Nov 2026 11:49:42 -0500
Message-ID: <20261125164942.1310501-1-ddagunts@gmail.com>
X-Mailer: git-send-email 2.47.3
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

A PIO OUT URB without a transfer_buffer gets its first packet through a
sg_mapping_iter. sg_miter.addr already includes the offset of the sg
entry, but musb_ep_program() adds urb->sg->offset again. With a nonzero
offset the first packet is read from the wrong address: wrong data is
sent, or the read faults if that address is past the mapped page. The
packets that follow are loaded by musb_host_tx(), which uses
sg_miter.addr as it is.

With usb-storage this needs CONFIG_HIGHMEM, because usb_sg_init() leaves
transfer_buffer NULL only for highmem pages, and a sub-page write. The
highmem check in usb-storage does not catch it, as musb sets HCD_DMA even
if it is built PIO only.

Drop urb->actual_length too: for bulk and interrupt URBs it is always 0
if buf is NULL.

Seen as an oops when writing to a USB stick on an LG TV (MediaTek MT5398,
6.12.119, MUSB_PIO_ONLY, out-of-tree musb glue). Tested there with this
change and a debug switch that selects the old address, using O_DIRECT
writes of 512 to 4096 bytes from highmem, read back from the stick:

  sg offset            old address               new address
  0                    correct                   correct
  0x200, 0x400, 0x600  first 512 bytes wrong     correct
  0x800, 0xe00         not mapped (probed only)  correct

Only compile-tested on the current tree.

Claude Code (Claude Opus 5.5) was used to diagnose the oops, to write and
run the test, and to write this fix and changelog.

Fixes: 8e8a55165469 ("usb: musb: host: Handle highmem in PIO mode")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Dagunts <ddagunts@gmail.com>
---
 drivers/usb/musb/musb_host.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 31b061248..6f78fd985 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -821,8 +821,7 @@ static void musb_ep_program(struct musb *musb, u8 epnum,
 					sg_miter_stop(&qh->sg_miter);
 					goto finish;
 				}
-				buf = qh->sg_miter.addr + urb->sg->offset +
-					urb->actual_length;
+				buf = qh->sg_miter.addr;
 				load_count = min_t(u32, load_count,
 						qh->sg_miter.length);
 				musb_write_fifo(hw_ep, load_count, buf);

base-commit: 730acad0b83da0d7b658d99cf87ef979012ec638
-- 
2.47.3

