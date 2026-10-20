Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480236;
	b=mnsqZHx2H9mqD51mEg13aiYgL4CoSxiw6H8VoPFKZnluQ6KgUAL/oalSFdNnHbWxQqrb
	 ktl714RaFvqsnXDTeZHe6+Lj4ONRwrO7VMj1/xQ+eyJ01QzfjT3PWNLmbUDMga7BrFdsX
	 ZRXdPSf1YjEPmn8Zz3+7HEnB7BwSuTNe8Ya6vQcII3iYV6GJ806AKzYsQPnu3b63LzIwm
	 escMXobSXo8VbgqloDla4eoE9gwQDWSZg4Mt/McUGAnEw7Y9mwKAAO4cuiRSIYKLfa+1v
	 RygVsEgwmjqTIuEIFVWW9XqhThZQSWlwMNCGdtDsdgIXZL0Ixm0z/c1rafFI6MINqtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480236;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pVMhRWk8qtW+u6oBSL+Up0nK8r194VsI+nQohbgpZHI=;
	b=jjccez0KPSRF1MoREBU61ElkcCHyHTT/2RvGRjCmg8PPFya89pTFnad1ZfnwICqV5lAH
	 skaY7vqoPH/sjJiy012hA1silYvci51hZuzg/eGvpgFQUhSp2hfqJzyDSEJU5OcJW8C+W
	 ngs0H7yJnXVh0IATylGM/JyftoDosqu/mWIwH+NKRzzWjIteU7MOClDc+FPRs+H7pkRuF
	 f149C62fdY9ONrJPe5yruD+roVn7FJW/WdG+v35W+Fe3P3fpVSSdowiN86gdQUns7X4NH
	 GL8gmuxecK080eUpqS1mCHznSK51rN26fdBt7vRg4U8roxnSd1Za+uoRJALnjuloSIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61918606A31B
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 07:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61918606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so1137425b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 00:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480235; x=1793085035;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVMhRWk8qtW+u6oBSL+Up0nK8r194VsI+nQohbgpZHI=;
        b=P4emwYFPFgxRx6EbdeLm9aHflC/5BeSces6dEmLXX/z6Mt27LVTJM5Pe27WF4yaIx6
         izW+cB6Oa7SOZoB2vaVKUdchnrcSEEQtPjd/bfhUgtkI+8V9eByd4KQnzLubnsqqAnyk
         FWUIhJTgY3VSrXPW14+SMO8R2KkU2j45G07nKBb6XMQVzbN0TV4aEkjd+z6R17ooL8CK
         mt1CUPOQeP4TBpATbQE+k2DRV6XqM00N1vdx6bCKEznIlTxdCVFu/n3wWqAcWs2zA2zU
         SMjzrMa+KG6Mg7oV0MhNwWx/uw9ISSufOjzwm4piDkOsJH6LQJibnL2mpZ+TPxfqNoZ6
         6g6g==
X-Forwarded-Encrypted: i=1; AKwUvBxHJiPeTfY+thgtXFaUXf+Ph0lfLk0aMLZ2qHj68x70gxWztfi8G/V00YyHd/IR4O2Jzc0h2koimt8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7RJV8gQQDlB9AyfUeIsciJMP3vBs18Mz+0yZA6iDSaQNbn14s
	WrUnNgUKaR47kLc5LstBbbXWleyS2VoYDs8k11VPNvk/zNXGQyZZkiFR
X-Gm-Gg: AYBFou2Vw8Ta0ysPtUjLZavL0zI1edQZmxpbgXGNHNmEF0BWTSAgPDekq3+qdrcrhE3
	v5H4ikSmH2vQGwRqc2TNTHVFnjYWJyEVWkDHkG5R0u3A+K4beij+WGE/ZGwQ5fKoZuSwCggR0yT
	xl0gBgyvCqporVRzL0emvz3Oi7Rs51pSNUPCbsPMvKjFuKiF3h+HgRMV8CeJRXOpwRjvigGkgTo
	VJDRh3jcOK5XKIcut4+alpuxgRUsWCF1D7/qFwqfCOsLftFJ+6V4xPcZf3pOdHX4vpibXLMD22x
	jULwUwaxCrrPyzCAO+XRRC65UX3yuJagoYLt7nx7GIzj6trvDTGgnRqm7sO+pYtJiJu0spR6Le7
	3G2ltqv5N/yEykdcOlLZi0vTCb49C0KgnQD51gqOFyBNpvYeorV4DmhtZZQWjMhy0IHg2qIUEHI
	zsDjXfj3cFHR0XxCYBEgQBTIMLMA+MfMSK9DSs+qVszPE3mlvvBa+TEADAJWnu3ZXJWgDH+nRQa
	yQ5a/X/XxKxAmshjm/C7KPAACV4htCcrcrOoO5td3joZSaOt1kfVyZ3Y0KseTPhJ5Vg27jhJhkW
	F0EiC6sCaxz873Ea2gxmXFvFGdPupRghdyHEPaqsYmGJnQV4fMftBzKKBt8=
X-Received: by 2002:a05:6a20:eec7:10b0:3e2:2d44:fc65 with SMTP id adf61e73a8af0-3e22d4507c2mr4709328637.37.1792480234627;
        Tue, 20 Oct 2026 00:10:34 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549c5621sm4773692a12.17.2026.10.20.00.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:10:34 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Shuah Khan <skhan@linuxfoundation.org>, shuah@kernel.org,
 valentina.manea.m@gmail.com, gregkh@linuxfoundation.org
Cc: i@zenithal.me, bgmerrell@novell.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+b6f11035e572f08bc20f@syzkaller.appspotmail.com,
 syzbot+a7edecbf389d11a369d4@syzkaller.appspotmail.com,
 syzbot+bfa320b67fcbe2583c6f@syzkaller.appspotmail.com
Subject: Re: [PATCH] usbip: vhci_hcd: time out unanswered unlink requests
Date: Tue, 20 Oct 2026 15:10:29 +0800
Message-ID: <179248022909.38718.8671761249933493010@kylinos.cn>
In-Reply-To: <bf13495a-0f70-4ce6-a2a5-77d6c1bee241@linuxfoundation.org>
References: <20261006125652.10296-1-xiehongyu1@kylinos.cn>
 <bf13495a-0f70-4ce6-a2a5-77d6c1bee241@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Shuah,

> Did you test this change with a usbip_host and client? How does this
> reproduce in a regular setup?

Yes, end to end with the usbip tools. The server ran usbipd
exporting a g_serial gadget (CDC ACM) on a usbip-vudc UDC. The
client, a v7.3-rc7 kernel built with and without the patch,
attached with `usbip attach` through a userspace TCP forwarding
agent. Once the device had enumerated, I stopped the forwarding
agent with SIGSTOP: the TCP connection stayed established, but no
RET_UNLINK came back. Then `echo 0 > /sys/bus/usb/devices/1-1/authorized`:

  - unpatched: the writer hangs in D state forever. Two hung-task
    warnings, 123 seconds apart, print the same stack:

      __schedule+0x417/0x1910
      schedule+0x28/0xb0
      usb_kill_urb+0xb4/0x100
      usb_start_wait_urb+0xd7/0x200
      usb_control_msg+0x103/0x170
      usb_control_msg_send+0x9e/0xf0
      usb_set_configuration+0x69b/0x9d0
      usb_deauthorize_device+0x3c/0x60
      authorized_store+0x55/0xa0
      dev_attr_store+0x17/0x40
      sysfs_kf_write+0x74/0x90
      kernfs_fop_write_iter+0x162/0x1f0
      vfs_write+0x25b/0x480
      ksys_write+0x71/0xf0
      __x64_sys_write+0x19/0x30
      do_syscall_64+0xba/0x550
      entry_SYSCALL_64_after_hwframe+0x76/0x7e

  - patched: the watchdog fires after 5s ("peer did not reply to an
    unlink request within 5000 msecs"), tears the connection down
    (stop threads / release socket / disconnect device), and the
    writer returns instead of hanging.

The syzbot C reproducer, run verbatim in QEMU on v7.3.0-rc4, shows
the same before/after: without the patch the hub work item sits in
usb_kill_urb() holding address0_mutex and a second attach never
enumerates; with the patch it enumerates ~30s in.

In a regular setup, anything that leaves the TCP connection alive
while the peer stops replying reproduces this: a wedged proxy, a
firewall dropping the server-to-client direction, a hung server.
After import usbipd hands the socket fd to the kernel, so the stall
has to be in the network path, not in the daemon itself. The
client-side trigger is just a control transfer that times out and
is killed via usb_kill_urb().

Console logs of both rounds are available on request.

Thanks,
Hongyu
