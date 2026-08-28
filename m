Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A304233945
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 05:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895249; cv=pass; b=D4ULIZjvrvSQgGf4NGP+ds5RG9T+0WLY/gttl2xqCLdwpyJCS3T+zoaIHAZFB20v9HPUuB99bJyntUXIJDiIkJ4JXgzSOoAYl/1+0Rhhh5PBkkjGdFAijx+1hOyK4BVlwl9nrxh5Hcwn4AR5w+t5RygZ3sfYtBYmeK10st9x90E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895249; c=relaxed/simple;
	bh=N09K3P1+KVSvOJWHAr87NbAkgNAexvfQjQAdxwhHNns=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=RnbGCTDQ6yPlAIzkJ50qTYl1gRFsFjuWtgvHZNBWhqbur2sy3mIIp8ecmcEYO7arRegB5yzuUcfwWOSvbXPeJLfSe1hKygYERjV7gBYY//Qnco0r9cbXOhp0BKDWkERQepLr6RTGX9H0v1F/yz/dybdlPvrDTN1IWgppcZHNZR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=kvvaRVKs; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="kvvaRVKs"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39647184c73so1706537a91.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 22:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895248; cv=none;
        d=google.com; s=arc-20260327;
        b=T5LSeMVCr8AbK6B4gPqOQf3ZXuzWaAl90ESZST//SsVNOIu5Ttut00FRQcF+h+msQ6
         xqQOUKe28cSmlkDmd8rGGV+9WxbN4pgNvQH2ZJUuIqi41rI7xUOZ195RNv+7gyejSaIU
         nxW82mJc3Bn46mEx2/0rEKb+EKX1r+7mxPHWumRmbBILGVuNCiwFN01pJvmyr2RiL7DC
         LiEsYtBgbWoNVjCnkbgX8+6amMXEm5DiUCPf7DKUhWitljYVbk6TMNpqNz/aEL5+Pku1
         9bhx0vJqRz17RSuGjs4L5bOD8lw2Sxlu8+zk4EK7VCps2xhfjRsDZPoVivRb7TDJZlTq
         YVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=VmykDISYf2pFWYAuCyqhUnCmu71aODjQ/CEgASGxFFk=;
        fh=GVVVGeVqs14np8zKWXb93T5Axxp8eotNW5U7SyMYe/Q=;
        b=iQdJIMRPDIkUuoTwOiye98RUpDY3JET8PjsxJQ2nQrk2RrloAPyLwJcZfajS3Rv8/k
         +ll3kGbA4WgWW5Qg3M3MCQ0yu+m3D3ddl8Sao4bBrNzPUjargV49eRVEMxEEsML37m1k
         11FBDpwfqzkMk/y03UThJqAhkqr3oQVThtfCgSZsHrgM5Dfp2CYR8ymlTv/9sOqbPgW8
         yrBQaxupAfex1gJ08bgb4H2nkYhkS4Q2R8MhSoTEMaYG6/uR59otYTS8liUTPTU/Z9Qs
         WcxsWrwRcERoqQQlD5eMBTvyUprHwn4GzgKIRYeoAb4Tb+yF3AYOlisFgVrbLvqHikZo
         8Rdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895248; x=1788500048; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VmykDISYf2pFWYAuCyqhUnCmu71aODjQ/CEgASGxFFk=;
        b=kvvaRVKsYILc7u0HBSPlvAnUkEVxUl1j+GLmRJLlfOWJ0riGoDuQfuKdkaVbw+2drL
         F/40sEvc3oKaCKZU1WRX5MgNQh3wtBA8Ktu0oRnZJMk6q9zRJwoOs5CBAY/QL8b2siK5
         TENpYBRoLo5wm8fA+C1xEKidgQA3YjfW2ds4tzjZTZSZvJGZi6hCAfveFle88aDRSaP3
         FLp0lKOPAWMxouQ/NOnmmuPgfdsVMZPo//VpivJZ2YiDkLcgdKEyEqaAu4EitDRXVKNo
         TUCsmXGhXBg8q9wHpY9X3tVGj6JOaY+ArGwFTvtZRwkG3MFaZkR+Gsd9SOwCZ9RHqpfd
         AETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895248; x=1788500048;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VmykDISYf2pFWYAuCyqhUnCmu71aODjQ/CEgASGxFFk=;
        b=GEEBU2Cb++egJV95Y7LKjuWzABxDvXZg/vbzhEAuL4nM8ogolwS7sn5WTkpC12hy85
         p1G8ThJseuy7KWmLhW5IYjshuFX5KW6v87Ht0V8ySEIem9tFfEY23JgKA5Ka3nDsFhqk
         FIAq+mkL5ZayZKLCeOLaZHJddXr/f7olxglwknpJRZbaT771PdzSRqhhWM6kP4Pwj8hd
         OctYsed8qTtHRY2JJ4wOEaMujsVXSUq7PFsSWtWt5+saqTFf8ssK5F+LMieEQuA3N7DH
         tbKejG9QZ/NvAfanHvIkjh/aG6wNsevXp3/JMKOJxg88mRo5NPd2HVwCCxkiEscHuAoA
         Bk2g==
X-Forwarded-Encrypted: i=1; AHgh+RrkMLFMjnqYLu9T+xeTAOzkwgL121L8ZgAY0hnXioe+EiXIt7jAA3cJmp5PyEOY4/tRWApdMApY4OQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mFHa+voQOzMio1LG2/2Yt3JoUfbUbAqrIYwdcAEa8hxeVP9e/s
	HB5UxKCldwdFFpKoyEMA2c0wvMon9z8XQSiHjo85SjFnLBL4ea8SWeKuXQiiLCVmsmD8L+7YZwf
	SUtBKNgRohjKlwoHTmc6XexrV+cmL/TAMrA1itDwO
X-Gm-Gg: AR+sD10VMakOcbGtUFzNTAAmBT+aAjgUgbMInpFa1RDeinS02bFUv/Ma6s/514XUahv
	5CYhebZTVaQadLIkNqOkibDEt03qTs7d9EkBl6g8At5siBvDqfscRZ9TBNu3ri2BZxUyd3f/Lx4
	P1xz+e7B83VvNSXsihXxjehK96je9r1AhY+zwc4YifLg0i71/RiurCTYHw50yi/dA30n82JW+3w
	1fN79WNiXL8yH6FqmC48kaGttPU7FYX67xgu1DvwhdbFz3AqpmOk5OOxbYpU/H0QuZl/LFKO19V
	o++8V0MncoICqBLM87yjmz1xFIFb/3ix2o2vqR55fyXlia+r/A4oCchuMdcQzZr50Z1Ph0/XWXt
	zkMhh8iFIAMzkqUK7/Ilh0X20VAiFuGxV
X-Received: by 2002:a17:90b:5282:b0:38e:c232:9d2c with SMTP id
 98e67ed59e1d1-396d0d360e2mr5176850a91.2.1787895246701; Thu, 27 Aug 2026
 22:34:06 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:34:05 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:34:05 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:34:05 +0000
X-Gm-Features: AcwNN1XJBHFl5aXI54BxFgruP2OCJaQ7Magnmr8dXdJR6dIUzDZfui8iSum_LeA
Message-ID: <CA+0ovCh2o46zgc5Be_Z5=6NNJTKnd3W29zeMJ+gBCgL+4fFLAg@mail.gmail.com>
Subject: [BUG] platform_get_irq_byname_optional -- dwc3-haps registers IRQ 0,
 WARN on first gadget init
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: falemi@asu.edu, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/149-usb-dwc3-haps-registers-irq-0/

  dwc3 dwc3.2.auto: Configuration mismatch. dr_mode forced to gadget
  0 is an invalid IRQ number
  WARNING: drivers/base/platform.c:492 at
platform_get_irq_byname_optional+0x1ed/0x220, CPU#1: repro/9498
  Call Trace:
   platform_get_irq_byname_optional+0x1ed/0x220
   dwc3_gadget_init+0x607/0x2170
   dwc3_core_init_mode+0x2f8/0x790
   dwc3_core_probe+0x2345/0x2850
   dwc3_probe+0x100/0x150
   platform_probe+0xf9/0x190
   really_probe+0x267/0xaf0
   __driver_probe_device+0x1e2/0x350
   driver_probe_device+0x4f/0x240
   __device_attach_driver+0x270/0x410
   bus_for_each_drv+0x258/0x2f0
   __device_attach+0x2c5/0x450

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
