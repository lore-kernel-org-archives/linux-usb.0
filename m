Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0F3386573
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 02:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782182601; cv=none; b=B0vohnKPE1OD2mQGsgM7qBSut2QYBALZ0OSihtS11neqxAbL39BMZ84CL9qq0+Qmgy3cqyndL+aKbYAiiz08AfUCqbWxWqCsrSy/QGvI1TwQm98M0PgpZkJbcDMbyXCPtVW8h7aKqy941KoztAlUASh2j8wP1B6WHReOa31HpGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782182601; c=relaxed/simple;
	bh=ul+EZAgS5gVgVhh1bgXPju8Vjwafgks9pItEn3FUmpA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qPgQE/lKoZ27KqcN1MtiZIslEzDCykCVW4eI454Y7MyISiGPGTZLvbaJMzVyx9/bBlPzn0DzzI1dRrnFNqPQnq/wA/txhdviPLGNWNC2JQRi4pd8f15WcVdzWASPZPvQIo68zP3TmfeAdchq/HiHuf4pCEoR0/gOypMAI3ckfsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8m8Vj+p; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8m8Vj+p"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37dd266c32eso35565a91.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 19:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782182599; x=1782787399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BR8LUomEgkBo/eo/CXKYfNj/bVP1skXf17Q0JOPvxBw=;
        b=H8m8Vj+pb+/DCSh4NnMrH9DSWiEff4LYcTpwRxXvPbTVuveJXJY1hGZNh8G9Of6C/W
         XEVdFz298SmjrHAzYZhbKJ3g5RGyH+hldW8h5N7xyE+qXj/u7XHXQbgHJwFiHMj1m/+v
         0eRsoZ9xkNiJeVCsaH16asQB6IlSuGkZNxvAp3AiT8R4B5BNt4PYwQPBOvQBgZPULpnM
         nnAVHWZ5eSLc3Sh7l2RcfMjIYNgX+fsFZ9Gtv8tsHE8zycqMbdEA0jGf5+ODr6XeOzQD
         nyGtslMBFBkACnUXSFeH6uUISiAyQnWvo260lBzHBTtqDb7myjFbodEDwjhlLA3eiZPU
         xLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782182599; x=1782787399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BR8LUomEgkBo/eo/CXKYfNj/bVP1skXf17Q0JOPvxBw=;
        b=Lo8mwGYQQo/JAe567AtUbzlNzcR0u/wUl07YppaPUs+I3gqBk8EIRq5RmFVML/1TS8
         ePLCUSJ0m4/9Tc6VzCXviUPXUqTghxp1qOqBb5r5PS6Ncgm9G8y63VXKGIfooIybWe20
         jZlIFlWJWYwHbr7wG8EKZlheY8qaOv6zPr4GgTE7JRmnQDQBGWjLmrePk7ztA5WxsQUg
         40ZOuyAKj+FJ4wPMvYPbcaAwY+/+ZN7FoqGs3orIVxQDU4ugfBcG4wpgne+OSUgsG1Zy
         FYDj+xmUxLHz9R3zbuQlX0+ADLiJB0kj84GAP2QlBb9MfzV5RhPdYW0fXbhAqtVoBvrB
         X8Mw==
X-Forwarded-Encrypted: i=1; AHgh+RqFINiPJ6jx53KRGppAJ989cDK8u/6jlWi0gsWrUeOUoMW1FuVBPbajnas7LMjTACtS2Mli3MDu36Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7wFHGKX7iM8413ycGxbRm1JHIzhl9RhCcah5ZJg3N2ojDmgcd
	ctUI9rSwAY8MzTiZretdV0icpd8HOvFFEh16U3uPumucPX05rsKqVChl
X-Gm-Gg: AfdE7clXGdeAQrV+wr0QS48mY653Xl4K5yrXW2guv9bIUWkJRLHaNqVN6FlX6PcAJte
	QaE5nzbU8JACzWUeNgKM5Z3wPZQjpILbJ9XndyxUkNC5QJZMtKtMzFz7+oglPXvHM9EU8jaJTqV
	5KBrN8lcOW5sgr7UDIqrITS0xtoT3afJO9pCT89vpR28+CZv1y/T6Ad4cmwhEvT1F0sw/APNWoE
	gQMUf9iBIYxDC0xUxYFOP0z62/Sjyp0sRUEPY5LLTxaABYJlQvXVdDHP/6Qdn/8QQoBpxupvF+9
	ipfyBrYHraSJEmKgofNJfnhBHv93Qs9IdHUvKqguUIzo3+/kzt7LAkPDo43U7pWp9EqJdC53wS4
	QRy3nXJlMRBzJ0v9k8fPACftx1w/i8jwU1sKO+w95lxqPdV7s1+NKY/c2j1RXTIU2tqm4SVBmYz
	tsVWDIRjA=
X-Received: by 2002:a17:90b:3a43:b0:368:ac5f:d31b with SMTP id 98e67ed59e1d1-37d1629deaemr15527020a91.24.1782182598979;
        Mon, 22 Jun 2026 19:43:18 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f2d2702sm8563375a91.12.2026.06.22.19.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 19:43:18 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: [BUG] usb: gadget: u_serial: ttyGS open races with configfs function removal
Date: Tue, 23 Jun 2026 10:43:14 +0800
Message-Id: <20260623024314.51948-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I hit a KASAN use-after-free in the USB gadget serial function when a
ttyGS device is opened while the corresponding configfs gser function
instance is being removed.

The race is between a userspace open of /dev/ttyGS0 and configfs removal
of functions/gser.usb0.  gserial_free_line() can free struct gs_port
while the tty device/cdev path can still route a first open to the
embedded tty_port.

A simplified ordering is:

  configfs removal                    racing opener
    rmdir functions/gser.usb0           open("/dev/ttyGS0")
    gser_free_inst()
    gserial_free_line()
    gserial_free_port()
    kfree(struct gs_port)                tty_open()
                                         tty_init_dev()
                                         write through freed tty_port

Observed report:

  BUG: KASAN: slab-use-after-free in tty_init_dev.part.0+0xd8/0x2a0

  The buggy address belongs to the object at ffff888101011000 which
  belongs to the cache kmalloc-2k of size 2048.
  The buggy address is located 296 bytes inside of freed 2048-byte region
  [ffff888101011000, ffff888101011800).

  Write of size 8

  Call Trace:
   <TASK>
   dump_stack_lvl+0x66/0xa0
   print_report+0xce/0x630
   ? fixup_red_left+0x9/0x30
   ? tty_init_dev.part.0+0xd8/0x2a0
   kasan_report+0xe0/0x110
   ? tty_init_dev.part.0+0xd8/0x2a0
   tty_init_dev.part.0+0xd8/0x2a0
   tty_open+0x702/0xa40
   ? 0xffffffffc0000095
   ? __pfx_tty_open+0x10/0x10
   ? __pfx_tty_open+0x10/0x10
   ? chrdev_open+0x143/0x360
   chrdev_open+0x157/0x360
   ? __pfx_chrdev_open+0x10/0x10
   ? do_dentry_open+0x610/0x7f0
   ? __pfx_chrdev_open+0x10/0x10
   do_dentry_open+0x233/0x7f0
   vfs_open+0x5a/0x1b0
   path_openat+0x66d/0x1540
   ? srso_alias_return_thunk+0x5/0xfbef5
   ? 0xffffffffc0000095
   ? __pfx_path_openat+0x10/0x10
   ? srso_alias_return_thunk+0x5/0xfbef5
   ? do_file_open+0x165/0x2b0
   do_file_open+0x186/0x2b0
   ? __pfx_do_file_open+0x10/0x10
   ? do_raw_spin_unlock+0x9a/0x100
   ? srso_alias_return_thunk+0x5/0xfbef5
   ? _raw_spin_unlock+0x23/0x40
   ? do_raw_spin_unlock+0x9a/0x100
   do_sys_openat2+0xce/0x150
   ? __pfx_do_sys_openat2+0x10/0x10
   ? __x64_sys_openat+0x99/0x140
   __x64_sys_openat+0xd0/0x140
   ? __pfx___x64_sys_openat+0x10/0x10
   do_syscall_64+0x115/0x6a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

  Allocated by task 475:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   __kasan_kmalloc+0x8f/0xa0
   gserial_alloc_line_no_console+0x7e/0x4d0
   gser_alloc_inst+0x58/0xa0
   try_get_usb_function_instance+0xae/0xf0
   usb_get_function_instance+0x12/0x50
   function_make+0x155/0x290
   configfs_mkdir+0x2aa/0x680
   vfs_mkdir+0x150/0x390
   filename_mkdirat+0x2ef/0x350
   __x64_sys_mkdir+0x47/0x60
   do_syscall_64+0x115/0x6a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

  Freed by task 549:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   kasan_save_free_info+0x3b/0x60
   __kasan_slab_free+0x43/0x70
   kfree+0x2f9/0x530
   gserial_free_port+0xe1/0x1f0
   gserial_free_line+0xa0/0x150
   gser_free_inst+0x25/0x30
   usb_put_function_instance+0x4e/0x60
   config_item_cleanup+0x8f/0xf0
   configfs_rmdir+0x39c/0x4f0
   vfs_rmdir+0x18d/0x380
   filename_rmdir+0x2d2/0x360
   __x64_sys_rmdir+0x34/0x50
   do_syscall_64+0x115/0x6a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reproducer, run as root on a KASAN kernel:

  modprobe libcomposite || true
  modprobe usb_f_serial || true
  mount -t configfs none /sys/kernel/config 2>/dev/null || true

  G=/sys/kernel/config/usb_gadget/gser-race
  F=$G/functions/gser.usb0

  rmdir "$F" 2>/dev/null || true
  rmdir "$G" 2>/dev/null || true

  mkdir "$G"
  mkdir "$F"

  port=$(cat "$F/port_num")
  dev=/dev/ttyGS$port

  cat > /tmp/ttygs_open_worker.c <<'EOF'
  #include <fcntl.h>
  #include <unistd.h>
  #include <time.h>

  int main(int argc, char **argv)
  {
          const char *path = argv[1];
          time_t end = time(NULL) + 12;

          while (time(NULL) < end) {
                  int fd = open(path, O_RDWR | O_NONBLOCK | O_NOCTTY);
                  if (fd >= 0)
                          close(fd);
                  usleep(500);
          }

          return 0;
  }
  EOF

  gcc -O2 -o /tmp/ttygs_open_worker /tmp/ttygs_open_worker.c

  /tmp/ttygs_open_worker "$dev" &
  sleep 1
  rmdir "$F"
  wait

Thanks,
Cen
