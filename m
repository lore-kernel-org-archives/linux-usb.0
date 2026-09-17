Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0503C4E80DE
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648165; cv=none; b=BOmiMoLdPT20hjHc4GHpcKVdVrE0Je78PSDqYsqhRnxqvqfhp5IkxxFih602bkkjL8Hj8wGnnB84FwrxWLjc8DfCihfwRQQrfB/2NIYggneGa12PCwIPwf+TDR8PAspsJ4eYk50xjd3q2WLjmqoM9KsuroZWwFz3vhXxapt+pVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648165; c=relaxed/simple;
	bh=mKIXHncIZ5ycls3G9DjBAvP291cFZHBbJsNnxS4w1QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWCzoMMvoHYM7w3XkiWsVl8EomvXs1ma/rNcgTO5oJC4gZLk49KCPWPgjaf/uj+/7x6MjubH/lz9MJYLMH4FNlr3I9nPsbtH9l9VpBT44al6RSdU9VMyZzJWpRD47xRU71T2+p3HCzGGJedg211fD8Ee6UikYbx5gCLsDLlxpd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKIDLhsu; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oKIDLhsu"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2cb3f5bb19aso2332025ad.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 05:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789648154; x=1790252954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Ur9d2e5iPo4q2t+yrs6iZLJ6L95chhvqdKIJ1xAyVE=;
        b=oKIDLhsuaFG6TCweN7Ivc4arQfMXqzfbsvpr+GMc3SsK2dqy/LoM3oLKvVThOAdjot
         N/eYpvvXK2si7yXfxK5zWKadePTcWvOLNjX/KVe/ZNUwTcSbN/sexTGZoWOCtoKMz/dK
         kuI4R0Mg1Q1mKeugF56TRxHGyVSg8rZ0/4K5uQEp2eqDN/Q1HXoGpft6fEzfhgtVet4U
         RJhFTaryMh0HXBEtN05EDlzYpGrrkOOh0powEqE87CyLkYZWRQygcCDDrYHKRshdr36U
         Jnjcq3M9/Uxaik63XVdtdpwJKZlqNLaWdUDxoPuG3E/TQipJFemlKuqhhC/LQtKDtg10
         1BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648154; x=1790252954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Ur9d2e5iPo4q2t+yrs6iZLJ6L95chhvqdKIJ1xAyVE=;
        b=nVnd+M+Nuh3okXXXiUx4Mplj2V1nkh9Hi5hM28WSqAHXmbCO5KYJVZS1WfdDro/o8B
         DOwp8GxVPh5HnkLFWqwL3nC9jYAJ8Ivb42irEzGlox4vrutqS3E13bQ5bWqxY7rxQ7yV
         Cp2kJYEW2NlpVWpE/X1oKI9ruSqSVU/+SLBcreCT0APH7lQ4R6In3Q37WZZVGjWcfEQQ
         CTvuFdVUpsBKUzdZihXNlKDNXPx/Jyid5vJAvWQJJmjELOFpyRZq4mthklwrX0/VIHua
         VfFhTTU5j7T517QKV0fSCmeuOljYnFVhyLfqorpypv2Oonc14r3kGH3XiNng28jm+gPr
         5QmQ==
X-Forwarded-Encrypted: i=1; AKwUvByeqcOr6VUkaNAeHzULSe4SzWrVvImICcEnWHfDCRbMTGX+wf5lNVrsfvdIyoDJoG2tJtjPNE1yn2A=@vger.kernel.org
X-Gm-Message-State: AFuF++mMRWzvmn/QUn8jdEHtph5AwrXF6EaBszPtc+hIwh2FdP1t2JEY
	9AtnM7k9m5qgMgH4pr1j3DvFIOqsJduxReiTyQ7e6gTR2gg0qZqrTiRI
X-Gm-Gg: AYBFou1SyLY8YkPFte5gvvoITMrTm7GHJGeAzi9IM+WSzJLRz/KUzx/BZchDUZ4i45C
	+yZIvLC+SBe7zaZz3gbCtapWR+eajppZI29VqJd+CUPglkAEZKjqsmtNgAEcRRo4l8baouFLf47
	EZyMK596w3e6Xf9UGSvbAlX+W4J4JRJIiCanTedYrEG06+/IBjaKl7SZtwcj7egn07SJGAWlFC1
	ZFbTZjU+Off+E+IDWhH+OSxvjCfBYmSaCa1voUuhHuwzqv9NrU+VUdZ0flAX9TouDRWKdbthD3u
	lnXtnovDbdRjHCYCVEVSkaMOchpTnVqQ4yf69EANnWFfMX7HZbwTI62SaAXhBdwYeXqYyaTpV6V
	7yARRegasQDHp8AAkTHpEaTqx8bsDDdMrJusczW6TxoHho93ZZqRQQrFG9Z2pGj69hSNMzKHhuO
	xWTfa9BxCsszSMZdbXFY4Q6JAAoxjyjneQOXucWS0jr9TISqNzMF08bdjT8HtksCFApVGGoXpvR
	cgU5ZbHvjwZh97zVyNwgwwhgec5EZf74fmsJntW
X-Received: by 2002:a17:903:907:b0:2dd:ad74:ac2d with SMTP id d9443c01a7336-2ddad74ae68mr1709625ad.31.1789648154065;
        Thu, 17 Sep 2026 05:29:14 -0700 (PDT)
Received: from localhost (230.161.92.34.bc.googleusercontent.com. [34.92.161.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f05cb6sm25709385ad.61.2026.09.17.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:29:13 -0700 (PDT)
From: EricLin <ericlin050914@gmail.com>
To: michal.pecio@gmail.com
Cc: ericlin050914@gmail.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	mathias.nyman@linux.intel.com
Subject: Re: [BUG] Usb fingerprint sensor constantly resetting on MSI Prestige 16 Flip AI+ C3MTG
Date: Thu, 17 Sep 2026 20:29:10 +0800
Message-ID: <20260917122910.5189-1-ericlin050914@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916194736.7ba779c2.michal.pecio@gmail.com>
References: <20260916194736.7ba779c2.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> So maybe it's just the userspace software doing it for whatever reason
> on every use. Guess you could run "strace -eioctl" on this program to
> see if there is USBDEVFS_RESET each time the dmesg message shows up.

Here are the outputs of strace

$ strace -eioctl fprintd-verify
ioctl(1, TCGETS2, {c_iflag=ICRNL|IXON|IUTF8, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B38400|CS8|CREAD, c_lflag=ISIG|ICANON|ECHO|ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
Using device /net/reactivated/Fprint/Device/0
ioctl(1, TCGETS2, {c_iflag=ICRNL|IXON|IUTF8, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B38400|CS8|CREAD, c_lflag=ISIG|ICANON|ECHO|ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
Listing enrolled fingers:
ioctl(1, TCGETS2, {c_iflag=ICRNL|IXON|IUTF8, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B38400|CS8|CREAD, c_lflag=ISIG|ICANON|ECHO|ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
 - #0: right-index-finger
ioctl(1, TCGETS2, {c_iflag=ICRNL|IXON|IUTF8, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B38400|CS8|CREAD, c_lflag=ISIG|ICANON|ECHO|ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
Verify started!
ioctl(1, TCGETS2, {c_iflag=ICRNL|IXON|IUTF8, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B38400|CS8|CREAD, c_lflag=ISIG|ICANON|ECHO|ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
Verifying: right-index-finger
ioctl(1, TCGETS2, {c_iflag=ICRNL|IXON|IUTF8, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B38400|CS8|CREAD, c_lflag=ISIG|ICANON|ECHO|ECHOE|ECHOK|IEXTEN|ECHOCTL|ECHOKE, ...}) = 0
Verify result: verify-match (done)
+++ exited with 0 +++

> Or add dump_stack() in usb_reset_device(), recompile and see what pops
> up. Probably ioctl syscall at the bottom of the call stack...

I changed the hub.c code like this

int usb_reset_device(struct usb_device *udev)
{
	int ret;
	int i;
	unsigned int noio_flag;
	struct usb_port *port_dev;
	struct usb_host_config *config = udev->actconfig;
	struct usb_hub *hub = usb_hub_to_struct_hub(udev->parent);

	dump_stack();
	// remaining code
}

And here are the outputs of dmesg

[  146.079223] CPU: 0 UID: 0 PID: 3544 Comm: fprintd Tainted: G        W           7.3.0-rc3-1-cachyos-rc #2 PREEMPT(full)  ca2d5051c95b910bac0a8f0497b52243cdaa75fa
[  146.079237] Tainted: [W]=WARN
[  146.079239] Hardware name: Micro-Star International Co., Ltd. Prestige 16 Flip AI+ C3MTG/MS-2622, BIOS E2622IMS.11A 08/12/2026
[  146.079242] Call Trace:
[  146.079247]  <TASK>
[  146.079253]  dump_stack_lvl+0x61/0x80
[  146.079267]  usb_reset_device+0x4f/0x2b0
[  146.079274]  usbdev_ioctl+0x836/0xd80
[  146.079282]  __x64_sys_ioctl+0x76/0xc0
[  146.079290]  do_syscall_64+0x100/0x360
[  146.079297]  ? do_syscall_64+0x13b/0x360
[  146.079300]  ? do_file_open+0xd7/0x190
[  146.079307]  ? __kmalloc_node_noprof+0x317/0x520
[  146.079313]  ? alloc_cpumask_var_node+0x22/0x40
[  146.079319]  ? task_cache_work+0x614/0x640
[  146.079329]  ? exit_to_user_mode_loop+0x14c/0x820
[  146.079338]  ? current_time+0x39/0x150
[  146.079348]  ? usbdev_ioctl+0x291/0xd80
[  146.079358]  ? __x64_sys_ioctl+0xb8/0xc0
[  146.079370]  ? do_syscall_64+0x13b/0x360
[  146.079377]  ? wake_up_q+0x5c/0x90
[  146.079388]  ? futex_wake+0x1c6/0x200
[  146.079401]  ? do_futex+0x127/0x200
[  146.079408]  ? __se_sys_futex+0x13d/0x1d0
[  146.079418]  ? do_syscall_64+0x13b/0x360
[  146.079424]  ? irqentry_exit+0x3f/0x830
[  146.079433]  ? do_syscall_64+0x42/0x360
[  146.079440]  ? __irq_exit_rcu.llvm.4659499815316783039+0x6b/0x120
[  146.079454]  asm_fred_entrypoint_user+0x41/0x41
[  146.079463] RIP: 0033:0x7a72c4b0b62d
[  146.079563] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[  146.079571] RSP: 002b:00007ffc6ad1fd20 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  146.079585] RAX: ffffffffffffffda RBX: 0000000000000020 RCX: 0000000000000dd8
[  146.079589] RDX: 0000000000000000 RSI: 0000000000005514 RDI: 000000000000000b
[  146.079592] RBP: 00007ffc6ad1fd70 R08: 00007ffc6ad1fcc0 R09: 0000000000000000
[  146.079594] R10: 0000000000000001 R11: 0000000000000000 R12: 00007a72a4005610
[  146.079596] R13: 0000000000000000 R14: 000000000000000b R15: 00007a72a40017c0
[  146.079602]  </TASK>
[  146.191449] usb 3-6: reset full-speed USB device number 2 using xhci_hcd

Regards,
Eric
