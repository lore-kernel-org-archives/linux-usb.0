Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF55D33344A
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 23:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782860929; cv=pass; b=HywLlyzKdE/OIeDwFpBM59Vf9bmd16fxN1meOmsu5Ge9D5fr5BW/myulTR6A8V4R9nPrLjz5xlQe6+7YoLg+Xtbp1NbGFYMpi7/SoYwIx4zfXfQ/Iy+dHawnldSSnPDQZ90VGllin03bmtXH59lEzMJIBvKQeyuNkURmnjVk1wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782860929; c=relaxed/simple;
	bh=eI1e+jaB0bxxUpwHCdUrVRc3mFCgRTBRtU2PzWmA2bs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Q1W2Du48K+fjx0qbbbHtDrQwbaWm0k6/3ecq5Bv9IMyUvosa0dAk04zO/IHy3AYhjY4JRHMSxp63VqKotQUX9bqjRkcYbo31UCnna27WubKYdW+QjARPiG6qjxxGdJqzY8ogo4RvXI3yMQ3YkWRhj85XHtYIK5Z/RYvLRiwMme0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWH/3Ol2; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWH/3Ol2"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8eeb4508f29so569576d6.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 16:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782860927; cv=none;
        d=google.com; s=arc-20260327;
        b=jHaUa+EXRei4E7p44ni5aynNOH3bSLQaC3GXqu4sPshW9Me0LTgH06faIctRyoMCX4
         kEtbZjial0sfCNGMeOaiKspOc3HF2X8I+rfQF9fsRGHKKxYhycyEa6rbHx0wADKgDwBt
         ZZV10DkNtZOvledrx+v0vk3EpNJwpAAfUiqGbIfly0egFlGXIvbLVsNhLxcI+M+ZZzN6
         M7rLU7XJL6u5c8sKSbuv1NI1RF6/By6uH+uxQiVgdyVjFl4muQoSl0hlc5gRa94PkqIk
         ncGbq9Gf9arvsYWV21En41Q+e/rJrQ0BeAZ8E3pgyBOnyqjE7ieOqHFBd+06RLpQKT62
         KOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=06DsvCT7E/oI1oSwhxeYhwovX38+NiaWtUVo3nZTuoo=;
        fh=J0s7QZSGR9G/qeyw0qS6cWeEt2Cl2iI5goHJP+d20pg=;
        b=RGzzHpWWRdWEsIgMQ0zs4WwRc1U4kT3NFwoXnJ5gcj7h5wTdDA2jSpDDIlBoY3buAI
         +B2gAp2v4y2Xo/LLQTb73CezUXa0moPwPbhzjB8eULuuiUTHz/RzQp4L2rcA8pLooYTG
         AEQW3XQzRkVslZWXKC7U4bIYl8sL8qBB/eZN2zKupwxfRmDYy7+bByWReAdD0wgxHqdY
         hbJ3WIF3SczIF1RNaTm2t7Sk2gFG1uAlL3WFjlROyhXgSMKS2kFMS+j51lCGinGnlLKo
         Zr9Sg07iy6K+j02az7tKaPaDdl1Yzy3bKE9m0CN6rfqQjqAqCODWL3WunzVf2SSCuLP4
         RS5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782860927; x=1783465727; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=06DsvCT7E/oI1oSwhxeYhwovX38+NiaWtUVo3nZTuoo=;
        b=dWH/3Ol2X2Qjz+oMYTCe5NSMV66HQ9j9fZ1MJCrNDXCCOw4GpJ7H6bL70USlL+WEYK
         NZLWK5sCz92BXMvuXSB4lw9u+q2R6j3FY1/I3WS+dHe4Xk+SSpAx4ejme7GhQ/Oso3ws
         zd3V41aCRsZgfEGJRixkaukpAvmR8uxVtWXsQnjMmvx35KCh2Kvl0f1NzBCO7xJ3QYYl
         l1dtzMj1Ku3JDOY5qE1sSeH4IZtUwcFti5J/ZOEEwjApjSU0tcdQB0PU4brSeCZQ5NqP
         nZNzqy+AL3R8yxdAkCfw1v9MNN/paK1tuNSSVKBE14JupKWLW28dPK7K2XAAxsAavohm
         7E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782860927; x=1783465727;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=06DsvCT7E/oI1oSwhxeYhwovX38+NiaWtUVo3nZTuoo=;
        b=j9AOZU/apE5YOk4S9uVd91UeowtoYUrwlV6SG3fHDusJrFbe0Jz++nx1yxuLoEnQus
         7+9pseJPTZreBfyhC5HaGyiYFVQFONI1OPSqefVF4l5Zos61KYmbHoJn15oEUn+XBctE
         g+uXfsCztGmt+3QvbSSZSZRdZWrAydNJrp8nMVAKCoja0nyzy9RS8aJTUoK6mBsCneMf
         qHP8ceRvIZRlfVQcTFU0t1FH/sRKEtWdZteJcmF77FVsVZ5LEc3V2v7fkUnp4P42v3VM
         3nHfVjpS+C4ZaTK6fKQEbFnX01qvzE1coFXzl1NscIEVNiHGSCG4AnqJXxrcInHfSJMl
         NVgw==
X-Gm-Message-State: AOJu0YzUEDr64v9UDHgA/EGEsrPS64mAJpMErKZoVZeQEzjMoVI9n7N9
	s5ZBaPkxIMqbLwacXMrfSIgCQxXpWcd42GdMttfkO64pahp3VlR01lX+30x8v+75/aFhVnpCFe3
	Hq4i75GgHBFf2uNFnqZoad/PMIJH200o=
X-Gm-Gg: AfdE7cmzchYdjtHcmZwoMiNLSWxw9gCcuTwV67n8gIAq6pR6k4kZbQV7EGKXFfQCteB
	smOi9wyhSO1M0y0YHcOEgfQSPknC59dvzH8bDWQWtQkfkJQ1Y/dVlr/uOCyNpizS5uVoyysrj/m
	gbZ00tWinFfHG+dvXXozg7eQtASIs0Uinq9lxE4Ykwsn1Ce68wkoR6OSuAoEIbPgV0n8mH5WD1z
	quFz2DYQbOI0M5/kqLGgiRFw8dEJx8pa6dM3r2G8u0obXMQI7TbEIHQx+S4ljhQtqVcbBukFFWK
	UKRNRUQ=
X-Received: by 2002:a05:6214:4697:b0:8f1:579e:a418 with SMTP id
 6a1803df08f44-8f2d1b0b079mr42289716d6.43.1782860926581; Tue, 30 Jun 2026
 16:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?6rmA66+87ISc?= <neck3922@gmail.com>
Date: Wed, 1 Jul 2026 08:08:34 +0900
X-Gm-Features: AVVi8CdAuyDGyUllnusjs2l9Cci1RpBamgmnAducwKQKfPViL2fQtfRbQnYfO1w
Message-ID: <CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com>
Subject: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting a USB gadgetfs AIO cancellation bug reproduced on upstream
v7.2-rc1, commit dc59e4fea9d83f03bad6bddf3fa2e52491777482, with KASAN
enabled. In my test environment, the reproducer repeatedly triggers a
KASAN null-ptr-deref/general protection fault in ep_aio_cancel(). I also
observed an intermittent slab-use-after-free at the same dereference site.

Target file:
  drivers/usb/gadget/legacy/inode.c
Subsystem: USB gadgetfs
Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
Git head: dc59e4fea9d83f03bad6bddf3fa2e52491777482
Kernel release: v7.2-rc1

Observed crash:

  KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
  RIP: ep_aio_cancel+0x47/0xf0 drivers/usb/gadget/legacy/inode.c:455

Additional intermittent UAF observation:

  BUG: KASAN: slab-use-after-free in ep_aio_cancel+0x25/0x90
  drivers/usb/gadget/legacy/inode.c:455

Relevant stack:

  ep_aio_cancel
  __do_sys_io_cancel
  __se_sys_io_cancel
  __x64_sys_io_cancel
  do_syscall_64
  entry_SYSCALL_64_after_hwframe

Root cause analysis:

The crash appears to involve a race between gadgetfs AIO completion and
AIO cancellation.

In drivers/usb/gadget/legacy/inode.c, ep_aio_cancel() does:

  struct kiocb_priv *priv = iocb->private;
  ...
  epdata = priv->epdata;

At the same time, ep_aio_complete() can clear fields in the same private
object and then free it on the completion path before setting
iocb->private to NULL:

  priv->req = NULL;
  priv->epdata = NULL;
  ...
  kfree(req->buf);
  kfree(priv->to_free);
  kfree(priv);
  iocb->private = NULL;

My current understanding is that completion and cancellation are not
effectively serialized around this lifetime transition.

If cancellation observes NULL after iocb->private has been cleared,
ep_aio_cancel() dereferences priv->epdata through a NULL priv pointer and
reports the null-ptr-deref.

If cancellation observes the old non-NULL priv pointer after completion
has freed it, or if completion frees priv after cancellation loads it but
before cancellation reads priv->epdata, the same dereference can surface
as a slab-use-after-free.

Reproducer:

C reproducer:
  https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main/gadgetfs_ep_aio_cancel_minimal_20260630/reproducers/repro_ndr_decoylock.c

Additional C reproducer used for the intermittent UAF observation:
  https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main/gadgetfs_ep_aio_cancel_minimal_20260630/reproducers/repro_uaf_decoylock_107000_96000.c

Symbolized KASAN report:
  https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main/gadgetfs_ep_aio_cancel_minimal_20260630/reports/clean_report_ndr_inline.txt

Additional symbolized UAF report:
  https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main/gadgetfs_ep_aio_cancel_minimal_20260630/reports/clean_report_uaf_outline.txt

Kernel config:
  https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main/gadgetfs_ep_aio_cancel_minimal_20260630/configs/kernel.config.v7.2-rc1-kasan-inline

Additional KASAN_OUTLINE config used for the intermittent UAF observation:
  https://raw.githubusercontent.com/neck392/linux-kernel-bug-reports/main/gadgetfs_ep_aio_cancel_minimal_20260630/configs/kernel.config.v7.2-rc1-kasan-outline

Build:

  gcc -O2 -Wall -Wextra -pthread -o repro_ndr_decoylock repro_ndr_decoylock.c
  gcc -O2 -Wall -Wextra -pthread -o repro_uaf_decoylock_107000_96000
repro_uaf_decoylock_107000_96000.c

Key config options:

  CONFIG_USB_GADGETFS=y
  CONFIG_USB_DUMMY_HCD=y
  CONFIG_AIO=y
  CONFIG_KASAN=y
  CONFIG_KASAN_GENERIC=y

Runtime conditions:

  x86_64 QEMU/KVM
  dummy_hcd + gadgetfs; physical USB hardware is not required
  kasan_multi_shot=1
  slub_debug=FZPU

The reproducer uses root only for the privileged environment setup
(dummy_hcd-backed gadgetfs setup, mounting gadgetfs, writing the initial
gadget descriptors/configuration through the control endpoint, and
preparing the endpoint file permissions). It then drops to uid/gid 1000
before opening/using the endpoint file(s) and triggering the AIO
completion/cancellation race. The faulting task in the null-ptr-deref
report is uid 1000.

Brief KASAN excerpt:

  Oops: general protection fault, probably for non-canonical address
  0xdffffc0000000001
  KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
  CPU: 2 UID: 1000 PID: 358 Comm: gdecoylock Not tainted 7.2.0-rc1
  RIP: 0010:ep_aio_cancel+0x47/0xf0 drivers/usb/gadget/legacy/inode.c:455

  Call Trace:
    __do_sys_io_cancel
    __se_sys_io_cancel
    __x64_sys_io_cancel
    do_syscall_64
    entry_SYSCALL_64_after_hwframe

If you fix this issue, please add the following tag to the commit:

  Reported-by: Minseo Kim <neck3922@gmail.com>

If you need anything else, please let me know.

Best regards,
Minseo Kim
