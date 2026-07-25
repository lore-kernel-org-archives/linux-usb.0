Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F35395DAC
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784973613; cv=none; b=HdUCqtUCCBMCS8xaq1Hr78mdlWtG1l9SQiDZGzBWBwsTcr+/qIJU/zSJvU9cfbuA8X3+NS+1KfGO4nOTaUd2zWjuHf7Lnh54F6wAKis1IjwqnLwqxw+tgeckrPQID2pJkmEnqfoiLPILTFEIphbUPHaUfr8UM7ahidPPjKTWRjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784973613; c=relaxed/simple;
	bh=9Z+ZkZqGS7sP1sONy5OAUE0kI3r/bqw63lbiT4Aw0K0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=megL3SFfalKaNqzf//avHr2L9142BqrXguOj3QpJ0b+xv2dzduGQ+eAxLmN+C//cynTZUhX638FCZFiKShiKcKmHMTK7nRtEJkHYXY4zPl7KfXeIcT9qaJ+41D0T/HcWM/V+4AjvtCh1sLbnq1LRwsQySNZmfy016Objvzb/wpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8Pymcf+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8Pymcf+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso8836715e9.2
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 03:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784973609; x=1785578409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUt4/mK3MwdR8c4P1WplEQ40ep2NjtNR29sh3+sLork=;
        b=V8Pymcf+8LT2BW5NwCqEm6gFsB9bfPnchERx28HhWh1dESCElxGwQDPwi/EeFEeY3x
         BX4GgbbJ9qF2V5rtuQdaj7HSFmK67DG9nemgqjxn3Z9KmaEMd8y1UlcZOVJBL8VV8d32
         HP27KV9d+4F36BG7f9h6JWx4zD/aEKbvLpuqoPTjzhNOqLFol5kvErTaaiNud8QMGB1Y
         zwKEZTxSveR3CkNakiexW+bsxIrSAnT5a1MXjUYdaWeIU1Qj6AffKZbsd8F5D/ZvUwqq
         QAsXsBcoM6zGs5E0+thmCeHNm/pBYzC18B7mHtDkNWbjOryPMmcOcqR1p8MG1VolHzuv
         lGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784973609; x=1785578409;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUt4/mK3MwdR8c4P1WplEQ40ep2NjtNR29sh3+sLork=;
        b=cAbECqgMEyB1/L/8ZthiDP2LdVWn8MChd6Vf2IDL8kJ6kTpWT6fH+vRQrD/fBJxs4S
         wF9rEJo+lK0q/2Z1AG/9S0JSXd5DHxwbh8WEdG9/DaJchuDJxMrPDsucGsqkdNbJm8l+
         emKtSRmK1AoWZpCDzb+hDa5aQHC+WvAg2yeXI95E4dNLXxmQ1CbUeomCMmQ46OeFuzpF
         wG4T39ZeOfoNkXCWUK01Y8kNGL+CYGuTxsaCp0r3oUTU896ls+2Ul1praHIqo2zuM3sf
         IhDwEiMH78dAKI0pL7TQCZYmAAVkVzW6XOofAzb+2L4c0wopngUCPr6ukH+o40tvYpqF
         M15Q==
X-Gm-Message-State: AOJu0Yw5JaU/FpaZejAjSQPOtiYYXUUScRTZb1JagMpg4+6e8lQSWZ6J
	ujvjvwlX2BPX7vZvowGp66IHBsh9ChH42kfwv9QxoB4Aki8Be0nBjhjZ
X-Gm-Gg: AR+sD12Dfvf0h7yiALadtO8SIuqaMiEHlwWfx1uU6D/0cEG19JJP3FPn364JSpdr1ym
	2esjBt2sb66B4nNc+IQF/XoAMKb4/02r0n/pG+PHeXminYiinCvo0QZnwK7J0VQ0Es+BeM4Bql4
	DiIXTC4mJPIhKmUHoCsngv40H9PujqUZLiSkeT3nzcVZ6gVSWmL9PJERiE0GSWKrBf1PpLhW5Du
	vVcnHxE+uyMyVuBhklQzNsQCBJUuEY8NzPMk0GRXQnHS4msYsI3qdDb8lpgTpIQOxP9m/QqDqXQ
	Oogj2mdF+XUKtsPdVTDjo3Qyneb+2DMt8JxUNfpMkSrSYAELY27Lw9NIoiGHCE/gHbDfVQQp7ED
	qA8V9oP2E0Vhr4wqVdBOfiwOD1UAYs1GyWjcrqzJvKNDhg0lXfRzUxqHk/p1mx/R/eS5LJCPllr
	hqGXJ37r4AS9U=
X-Received: by 2002:a05:600c:8b4c:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-496b56e6f9dmr21408735e9.2.1784973609230;
        Sat, 25 Jul 2026 03:00:09 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b485ff2csm71981855e9.6.2026.07.25.03.00.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 25 Jul 2026 03:00:08 -0700 (PDT)
Date: Sat, 25 Jul 2026 11:59:56 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Bart Nagel <bart@tremby.net>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <20260725115956.321185a1.michal.pecio@gmail.com>
In-Reply-To: <amKUdIRBrsFiDTiV@spiral>
References: <20260723081440.0228c59e.michal.pecio@gmail.com>
	<20260723081440.0228c59e.michal.pecio@gmail.com>
	<amJ9jAtK8rNWDO7V@spiral>
	<amKUdIRBrsFiDTiV@spiral>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jul 2026 15:45:25 -0700, Bart Nagel wrote:
> I found that I can reproduce the freeze much, much faster if I run
> `stress --cpu $(nproc)` at the same time.

Great news, good work.

What happens differently in absence of CPU load?
- no Missed Service Errors anymore
- ep_trb_dma (see below) becomes always zero
- no obvious change, somehow the kernel gets more lucky

>     [  174.709692] xhci_hcd 0000:00:14.0: Transfer error for slot 6 ep 2 on endpoint
>     [  174.709815] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag

That's kinda normal. Errors sometimes happen, isochronous doesn't
recover from them, SW must deal with it. Transfer error becomes -71
status, Missed Service becomes -18. Later uvcvideo logs this again.

ep_trb_dma should point to the failed transfer, but xHCI 1.0 spec
allows it to be zero for Missed Service Error. We deal with that too.

But oddly, on your HW it sometimes isn't zero. The commit you bisected
assumes that non-zero numbers are valid pointers and this seems to work
more or less correctly, until it doesn't:

[  174.818444] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 108165b90, set skip flag
[  174.818452] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 6 ep 2.
--
[  176.818812] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 108165dd0, set skip flag
[  176.818817] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 6 ep 2.
--
[  177.517933] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 10a63ec30, set skip flag
[  177.517937] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 6 ep 2.
--
[  177.586809] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 10a63e020, set skip flag
[  177.586815] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 6 ep 2.
--
[  177.636060] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 10a63e530, set skip flag
[  177.636065] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 6 ep 2.
--
[  177.817933] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 10a63ee10, set skip flag
[  177.817937] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 6 ep 2.
--
[  179.934449] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 10a63e7b0, set skip flag
[  179.934453] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 6 ep 2.
--
[  180.701300] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 10a63e920, set skip flag
[  180.701315] xhci_hcd 0000:00:14.0: All TDs skipped for slot 6 ep 2. Clear skip flag.

For some reason the driver thought that all TDs were missed and
returned them with -18 status; we see a burst of those logs from
uvcvideo moment later. Then I suspect uvcvideo resubmitted enough
URBs to go around the whole ring and overwrite pending transfers
with opposite cycle bit, which caused the HW to stop and produce
a Ring Overrun event.

The root cause is bogus ep_trb_dma from the HW or some kernel bug.

Maybe we could get enough info from debugfs to see what happened. If
possible, disconnect other USB devices from bus 1 and 2, trigger the
bug again, and *before* stopping video recording, run:

zip -r debugfs.zip /sys/kernel/debug/usb/xhci/0000:00:14.0

This requires debugfs to be enabled in the kernel and mounted. And zip
will print some warnings, but generate a valid archive. If you need to
use tar instead, you must first copy the directory, then archive it.

Email the zip (should be under 1MB) and corresponding dmesg as before.

Regards,
Michal
