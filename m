Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491CA4D90D4
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731798; cv=none; b=bLlIafZpS4jLay54i3oQmvpgwULuwcK0MJzQygunNk9vV4heG+NXvB2xiRMlft6j1k8qNOZubhKv876R+bGnOgjetSIfGZK8mkCGN+dcEAlbKwQ/ErdWCrO5pd3un3dk9hh7Jv4LEhlZnIgu6hvSoCyrOwmJ5PNgGRH4wfGf6OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731798; c=relaxed/simple;
	bh=YPCbPoNI3G9onv6LNr9Q7xmUQkFxJiPZUTMXLRk5Fuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G1Mew9tUgSMW1r+0s+SxuQQ3KGsdxmncCMOfYcwpM6uUa0UeueeHNVqXAtEXXXgiBj8GpJW60alZXfRTgUry6V3pyovL9d446X/rsezGbQijfTXi48vSD3OpSq8Y1TpPm8VwgcTa4XpgNPax+mYV84ztwmitcWQIxVhhfZ0/F8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcPgz3en; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcPgz3en"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39647184c73so1485767a91.1
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 04:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731795; x=1790336595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erDD/o7ItCDetIXe4X0kGs36t1bSEm4QSr1YQGtDTmY=;
        b=hcPgz3enKsdNyRZDTBxR1fMf0kByHJM/dg4IeqOjS6jSwLgsNqIsG8STeMDcX/GR/X
         eczR9k0xquf2Yfg18KY5dhUldKpb2sY3SxyqHLVqzSDktQgUQJgxBhbXrupDrp4AACmI
         3aYOLI2YMhIz1X68CsFBhFDLourDKhmr4al5PLflJ9PK0ty7SC5VpNYYxfl6UjykvnrU
         yjnlZICImKkJrXZfUT38GyBhz78+rYNRU86eUW3TwhkQWiV/iEijHQ8/xcem69sbQCmH
         57d6PvpDHmHvRzMxoEZ/Qq1tR/M/G1a0TGwnFqCEkOrtq0E5IYyDyrpbRAShASh5JQvV
         xTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731795; x=1790336595;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=erDD/o7ItCDetIXe4X0kGs36t1bSEm4QSr1YQGtDTmY=;
        b=I6lpctqcLOTOqRqIAS3gTg7ORLkdzZL+dPUN3A5AEvNyte0V5LX/beMhs8a1n5Y/c/
         tn7oIdXrlyjFvH5ByDQ+ny1/tGN3VoFaHBX/LI906ZNncZ+wfxX6Fsbk4l12eIfDhUMW
         X3yHcWvB15e1fbWyl5ToB4oWTHs4EXJewXWJ/j2VD6SKpB8rwbTXpdpwWiLiDtoazpoY
         rTSmQMV7uTkA/LJo6WBUIm2k9OO4LBcGfC+i0nv8Hv4Q9mKt4osDaorRuX8NIyf0RhCA
         +YfgVcTH7xuc9iO3mb40RMa9y45T7JhJupOnYL9Cvp0lzKCIkVuRV18AfDicfntWWthM
         mM6A==
X-Forwarded-Encrypted: i=1; AKwUvBzA5ICSRoUU3Dqn3BpbC7GZ4ifnHlh4pxT4XMeC141f22+7sJufdaIW6NDoE2zmnLWEVffF99KHtBs=@vger.kernel.org
X-Gm-Message-State: AFuF++mKv7gWwsCAHWztivyCIewqKPHJqYy2tjF5e7yNxh9pz+qZcWMT
	B1jp+cTbp1fp/QrLTnsaW+4EXWIkBqtxTX4e3sfrWaWxTzsWxqwGD9YW
X-Gm-Gg: AYBFou0Vv4GuDMtXtliaeWJZC3lJWtzkiRGh8R+P0VsC7DIA5h6xI6YT9Rw5LQQJDPz
	LSjNDrQqv8/bZ047EUXbL5TaTZ1vS+ALqqS47j3iCGfF39FZZAYEXZMmNeSgoOEUJ5i1HqI7UD0
	VNrMJ2rrhJtE/ghhzsuRsFnbvw+UbF5QT/44OUR1QS9t8BsAQPENSt/JvaTNkbeYJ9oPr3APGRU
	V7BQgEmP3MqY5aAf7oFCqfxw7Na7ysMXLJxGvt/5RwmpMqxFsy4H5972mdSYjp9Qj/i4m4cRtDz
	3CNFlTU9K9ckApsof94Dt1+O+1/yBBeRL+waQoACZkPv4XNSb/r7uMYpDZJEqj+ZExNEib+7uQI
	wqvOKy0PiAEWoWj80XYKmu7tlXvIQq8e6a6iD5pdp9iR5HzCxjQqHoRDeHYvuOS/ExaybOxBwwh
	wDpHgjEoQJjVORvjvDoLMs6q3C9x84x7TZNHxVt5+SiyX2KW3njVCQ7MFpuIhkL01NTkTl4WUKC
	y6FWlI9Zoiwe45I4zUU/w==
X-Received: by 2002:a17:90b:1c84:b0:39e:4c97:ce09 with SMTP id 98e67ed59e1d1-39e4c97cf02mr4613634a91.42.1789731795473;
        Fri, 18 Sep 2026 04:43:15 -0700 (PDT)
Received: from 73ebd4c7787b ([183.194.144.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm4603983eec.9.2026.09.18.04.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:43:14 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Carey <carvsdriver@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] USB: cdc-acm: skip URB restart in port_shutdown if disconnected
Date: Fri, 18 Sep 2026 19:43:08 +0800
Message-ID: <20260918114309.3659635-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg and USB maintainers,

This patch fixes a use-after-free race in drivers/usb/class/cdc-acm.c
introduced by commit f58752ebcb35 ("USB: cdc-acm: Add quirks for Yoga
Book 9 14IAH10 INGENIC touchscreen").

Problem:

When a CDC-ACM device is unplugged, acm_disconnect() sets
acm->disconnected = true and then calls tty_port_tty_vhangup(), which
eventually triggers acm_port_shutdown() from the tty-port layer.

acm_disconnect() has already called acm_poison_urbs() at this point
and is about to proceed to usb_free_urb() and usb_free_coherent()
for all control and read URBs.

However, acm_port_shutdown() unconditionally calls acm_unpoison_urbs()
and — when the ALWAYS_POLL_CTRL quirk is set — immediately re-submits
the ctrlurb and read URBs via usb_submit_urb() and
acm_submit_read_urbs().

If acm_disconnect() then frees those URBs and their DMA buffers while
they are still in flight, acm_ctrl_irq() or acm_read_bulk_callback()
will fire and access freed DMA memory, causing a kernel use-after-free.

Fix:

Add an early return in acm_port_shutdown() after the delayed-anchor
drain loop when acm->disconnected is set.  This keeps the URBs
poisoned and prevents any resubmission during the disconnect path.

The fix is a 2-line guard, no locking changes or functional impact on
the normal (non-disconnect) tty-close path.

Yuchao Zhang (1):
  USB: cdc-acm: skip URB restart in port_shutdown if disconnected

 drivers/usb/class/cdc-acm.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.53.0

