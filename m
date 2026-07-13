Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E183469FC
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 04:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917920; cv=pass; b=EIk4bcU7urkTRj4vNzhKfxDocWwOMeNpLOxYdLIv8vS2/TGyAD48jDdXkNHGLgcOqJFVOQjSSK8HtBgmx/RYdpS1hPa+VRlqkrSpit75iVbbZDUysSNSkHcm/1/RkAUbW6Ehk8whmZ6sReLKgZI49FtyIwcuVijfSbBH0Jc7wF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917920; c=relaxed/simple;
	bh=d1aaHhZeJcr8FXMYVp0EYjWuDTAn5rIArXyHultNb08=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CNdCIYxxFuN6T93a8Td67Mj/fP144s/CcYKju0WdM2Ad555rZOt6rARJuU2+RQMR74toQfhUyG/vdxHDYplj8q1LVGysTQD0qs153YThn/kCaGknzU3MsZe2QQACpLn56xbG00pof4IvA8hSvQyxKK46tT0GTfnxR64dGj1iOSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfTdu7Xn; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfTdu7Xn"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso2364769a91.1
        for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 21:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783917917; cv=none;
        d=google.com; s=arc-20260327;
        b=NKTKFnOOnHe4iLn3SDvAfiFfVfXuPSjDSSo5mG47132W3PCRysWHFDlYomvRE7jPCV
         IpIA+GEhR04jejIHkFgEauVy+rNOG7VVhoPuRL2Gmv4YgiZAT7lYlbG6jjAYJrOEOPeQ
         YIEtdDPhCl15Y7YoTnfc6NT/TkoEjOIwJb6dBW91HGgH84QFhn3WlxBj1zXV0n0mI9YX
         BwyTU5XLRcbwEsYmh+2xQFVE90oidl3pH92Pr/BP2j8DlWJEOf7oYxxmqw3F82i/B2HQ
         9/xHV7W+Mz0g9u5HENOqKKVWIF2IrYS76NW7de9dHo77lMIs7pD3L7athVJPF4qjhWzW
         SUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=IRUyACDNBJ4ByjDeIEV46ckC9qXTQscaa9L495zoIx0=;
        fh=BdeaLRZLqCNTJBPWrJqRjSzloUHH/nz0xlel3vHngFg=;
        b=nwY7e6ehObnweBwIIRKDiLwykDT7ryysMHvGaaX27WoRTa8dGGO4F6bgfqu6UbPFIm
         VmMA4ysW+9czs3AC7k3ujneJ539BQ0gMwVllNJTIaB/EHen26RT5dPe6d7QpvQFlCpf3
         LZLSS/whLrwAACH7YSnM7K1P5CNeYgrqXgdpRDXvtueDsbFPiPryvDWbQBfIvZ026arU
         eZgcUQG1A6P43PpjVZU8Rgf5lfNJYI5TwB/i6udEBYxkP3a3AU+E6JLQkHZMXZWy2HV8
         3wsQsEmY2HawwRqXLw/7zMnrxoF2TaHR0B6qzSeQhTuRVVzIqgm5H6sbIC/YpGGk6p3i
         rCCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783917917; x=1784522717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRUyACDNBJ4ByjDeIEV46ckC9qXTQscaa9L495zoIx0=;
        b=WfTdu7XnV2uK2iZjP0J7PK0W5afbzOTR64N66/wy9DSk7h+z7k9encesD3Tn7OIPTz
         7qTDagHgFCsmVIjbe5nsFJmk3VYV+A2I91KdGPWKq+diT6zPXArlpe3YvuvNF0GsJIWr
         l8kbzqlCPDhX4rI3LaKul/fR+3chDajEtcJS2OWlnoXAGzw1QJTJ0WhsfQBFmHZEnqpW
         IkS5PxSrdImC0QuQlziIVFUW9Xpvd6EuQkfYf1Rs+qR3FOfT17JaWHLZFSSQ9YlWSzwi
         OqQzWB49e7EGeMVscPAFXHCpucM8705BMbWQkKt/nedfjHTk+iOGkfO7b/YxxM2FYQxN
         X75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783917917; x=1784522717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IRUyACDNBJ4ByjDeIEV46ckC9qXTQscaa9L495zoIx0=;
        b=cY0ylbwJaVLn8qJrAlMcMtE36Jh4jpCenDhvtVJsKyqWSilWBBKuVwtYQMVL7dL1Vk
         KVzrargDlZPGdqhup+OfzGhDJ9Bt4PajhC+27oIjD6yqPkPkzYup2eShC0TZzig28SE2
         GXMdANRRZUcJcxFyarf8lTwpNQdTuZRO5sXWlFQfB2Ma5A7IldGlNkzWFYH//9aex3rX
         o55ulYZCutvCXCbfIrQPlpnGbxTu+ZC5qVZHlyJgcmJ2BPV3WvC5SBHUd7kNhRYOEWb4
         5PTOIs5Drnuk8nROJaogpcf5DednXe/D0f7XcR8+zUD21AoFnIaXjOyIY8oMQ94Q4HUH
         SkFA==
X-Gm-Message-State: AOJu0YycC2O5H3HpQBboUzNigvjToMLHe9HPfDpMIdQrb92BMQBjvC2e
	kmR3WcBwS+szyP/JRuLOwJlladMKFOnU4Ft+HpnXdO50aHA77QVBF2+GCv3y/OKBueCcXgl9LPq
	X1FtgJqYdkHRA+sQhxXlTDDdWGZhtBKY=
X-Gm-Gg: AfdE7cldAAi7GLWH5ot+Cy4Qx1vi7bePxiUIfvNp0wql0Kld0wLm1R9batce6zJFwmF
	oaHJG4oEsC2nu7dnhR6KGfy+h0WVjYl4xEt9yJFGaEyZ1O89kEPWSCO4yUllOV67SifbdLJGcQl
	Z3gpGcmsnQgtuvpVfFcOkxDCdC/zS//55b1hz78g9yOqUiQp0NOhmbnuG2vbS7a4PZKmmz5CCyz
	2OIu1WtlX5gzthdYkRyNhsIL2gEG/fZjpqgO56IpH0YcI99Kcu6XvPsLWMUidbQqiByELsp2PUU
	drLKnsRaWmLS45mxJAE2gyra+wWkwkjgKivq8l+T+tZkhVfRmVa3zdZTfhkCnTV9PUg7yR6Aq0n
	x5FZfg+AaMbN/dA6PCla/meCyc1SkUMsrj7V++KeXuCXM9YtmofAlk56KV1wpzV/NsMECGxdRub
	M7rCFIw4sVTLKnKmRP3afF21RnJT5cetJD96i/b+qSpDT3Feu+9vBL6DvbWM/7AgEGM/LROoD6L
	TbamAkXCXoEtc7U1eh5mNTGuogUmWaafYFjzvTxTfUYiRkgq/ajqg==
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id
 98e67ed59e1d1-38dc782c68emr6701820a91.7.1783917916413; Sun, 12 Jul 2026
 21:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kanishka De Silva <kpskanna1915@gmail.com>
Date: Mon, 13 Jul 2026 10:15:05 +0530
X-Gm-Features: AUfX_mzSw4xsGJM44jvIkhqD2XKnT1xtRSI7FxxVGoLx_71zvVNdsmkfxwGWA1k
Message-ID: <CAKJ0_Ldatt+6_q_Sudg8nCnJLz5Vc8eihK9O6mwKh7tKBZm8iw@mail.gmail.com>
Subject: [PATCH RFC] usb: adutux: fix unlocked read_buffer_length write in
 adu_open() (data race)
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

While auditing drivers/usb/misc/adutux.c in Linux 7.1.3, I found that
adu_open() writes dev->read_buffer_length without holding
dev->buflock, while every other path that touches this field
(adu_interrupt_in_callback() and adu_read()) correctly takes buflock
as documented in the locking comment at the top of the file:

  * The locking scheme is a vanilla 3-lock:
  *   adu_device.buflock: A spinlock, covers what IRQs touch.

adu_open() (drivers/usb/misc/adutux.c:268):

    /* initialize in direction */
    dev->read_buffer_length =3D 0;

This is reached while holding only adutux_mutex, not buflock. Meanwhile:

- adu_interrupt_in_callback() (lines 165-196) holds buflock while
reading and incrementing read_buffer_length from IRQ context.
- adu_read() (lines 394-404) holds buflock while reading, swapping,
and zeroing read_buffer_length.

So two different locks (adutux_mutex vs buflock) are used to protect
the same field, which is a textbook data race: if an IRQ callback
increments read_buffer_length concurrently with a re-open() clearing
it, the increment can be silently lost, corrupting buffer state.
Repeated open/close under interrupt load can produce stale or dropped
USB read data from the ADU device.

I reproduced the race by extracting the exact code paths (locking
primitives, field layout, and control flow) into a standalone
userspace program and running it under ThreadSanitizer with pthreads
simulating the IRQ callback and open() paths concurrently. TSan
reports the expected data race between the two lock domains on
read_buffer_length. I'm happy to send the verifier program if useful,
though I want to be clear it's a userspace reconstruction for
lock-discipline verification, not the compiled kernel driver itself.

Suggested fix:

    static int adu_open(struct inode *inode, struct file *file)
    {
    +   unsigned long flags;
        ...
    -   dev->read_buffer_length =3D 0;
    +   spin_lock_irqsave(&dev->buflock, flags);
    +   dev->read_buffer_length =3D 0;
    +   spin_unlock_irqrestore(&dev->buflock, flags);

Impact is data corruption / stale reads on the ADU USB device class,
not memory corruption or privilege escalation, so I'd call this Medium
severity. Reachable by any unprivileged user who can open
/dev/usb/adutuxN.

Happy to send a proper patch with commit message if this looks correct
to you =E2=80=94 let me know if you'd like it in a different form.

Thanks,
Kanishka
HEXER365 / github.com/hexer365
