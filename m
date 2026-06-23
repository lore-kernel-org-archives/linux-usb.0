Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E052E2737FC
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 03:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782184581; cv=none; b=hP5nIwW4wbzKhOl9HbK21gIsxVZIIKzDCqEIJdA7C6/2VNwuhpk3wCxFFEV5uBlsKHBWndu3KmnUg1FfB3URmTftg0GYQN9UkfFDqoS74vvpP2O78sj29gbSGjFSuLPpCaJ1Q3Rn1JM2ayAahT119N6yb6Vtcq9E0lWIKYiK2Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782184581; c=relaxed/simple;
	bh=5pjDjVURccclG7Rrh6GqLFM4aigjDKBHphYsYp9m1yM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VnX/1ne5nxZDM0isBrogmioMKawGogI77LL0f7XK/7fnrSPX7l4BEVOUA+1iPynzye/UhObmACjRRFuay9pTo7HK3GnG7SQP2IjEFibQ1mIotvrXI/shSG2IH349KMSwU1fL1O1sr9ZUKgNngCPYDdFM3TgU21Mr3IuvBNn4DD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMj9xOsT; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMj9xOsT"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37da8b5540bso906922a91.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 20:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782184577; x=1782789377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JasloSL0/fkCGmpaSZNHplaZx9rafdr72wBoiIfbhsc=;
        b=qMj9xOsTgzgoTR2oSB6gSCKidlkc01DYuwOYWuw+DOdS4wMw0h4tn2TAF/WVAMjley
         7Zx71mLK6afBSapCxfU/Q2lCUhWGQgR1vr3/kheU6meve4RkwmuJ4GUNnmmI7FKRTA6P
         afTvN573YJQ7SLzpC4kCOs7aRTJNFVeBNZMckQ1ZF+ohYEJlihragM3bmG774SidawKw
         Qh3peP808yWhzKvNzu4HFp6+EWk22F0AWjkfJqoA1uyOT57R9wMoG8GsCa+wNiRjOFIv
         4ex68NN6RfNv1wg1VzP8iqXjDeRGu8yvUsrMolIFQ5gO7XzIuA1fv1BAtcuZ4JYEweGD
         Xn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782184577; x=1782789377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JasloSL0/fkCGmpaSZNHplaZx9rafdr72wBoiIfbhsc=;
        b=PdrsVh/Lillhfg4N5G1KmDFb7q+GRywCU7iEbUqNzn1tVJv+7AZo3YY63prX+Mfrv8
         K6Fq1rFLjCNfRn7Q6MjnkzWgCHYNpC1F+u2looQPi+TDuBXlT8bHw3SduwmZSDBEuo/s
         RvOrUekC6C1wdfgO+yzpV7BkMTwy3zaB/fv2Wr6qF4nTfaXTs8+7P2X7cXviXw3H3/ld
         EWuU/HeritiYg8gZmeW2tTLbGl3g1VCBEInCafHfqsBVjLFCq5FaQ4MItphpLhdiohzU
         CVHdyGnrY3WIuzCgWShAu7hzY07mI/WbmfIK84u36zQMrppwgdo4Pe8RdE4OxPlSoKEE
         H8mw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7jCW4VpiBeSteJpzm3vKDRVUWsuHkEjegR8m6J2kHNyCKC+uBZyF/FY9MKcnc5TTaMzHwfVZhFWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqSTjPKLsw3rTKS9UCgb2ZGPL0OQdmRTf0mSnChcVJ3w9vVK6e
	8N+gCTTtzmZsQ6N+/VOjAoEel0LyUIgu1+EdMxaWIxe5+NGuNJBSmQ2k
X-Gm-Gg: AfdE7ckI+fz84sUV7gZxVL1tF2ZVMzB8nkro+kDPV6r8+LFKNiLOPyoD08lnVnLKWhd
	sIP+DGZlUUg/tkEq/BVfmugfJpe+WtUGrzMiP2Xdv7I2Z3UIpe9G1kqGhv6PLlIOTIris8HieLy
	a/NWSJa9gtwLM5tVB2n6O+n8rJ30TIsY/31OwATwTvBlkMf3cUpH2xm96duYQ7mD3zIWEWBkaw8
	EZmx/X2AdxATnIe8xhmQFjHrFq1nfewOB6YovTPfTmJxGdNOq3z7n16EBE72fXXJcBF2psAZZse
	UG5lO8MwIHp9jDle4EhzkMiHSl0Ua1aDgRMrcdkPSvWWjsHI8rNMQJ2YO2pllsHP0VQa3tghLPc
	IfoAChDwEZmoAg3UgKFYtYTA/CSs0h1Fo5YZdefgpkRCXH45YZd5jX05//qplXtDYEJHPVd/fe0
	IPzWO6XzU=
X-Received: by 2002:a17:902:db0e:b0:2bd:ba75:81c4 with SMTP id d9443c01a7336-2c718cbd36cmr170450065ad.13.1782184576645;
        Mon, 22 Jun 2026 20:16:16 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f6395sm95837365ad.28.2026.06.22.20.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 20:16:16 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: [BUG] usbip: vhci-hcd: status sysfs read races with HCD teardown
Date: Tue, 23 Jun 2026 11:16:09 +0800
Message-Id: <20260623031609.138269-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I hit a KASAN use-after-free in usbip vhci-hcd when reading the vhci
status sysfs file while the vhci platform device is being rebound through
the driver core test-remove path.

VHCI exposes sysfs files under:

  /sys/devices/platform/vhci_hcd.0/

The status callback can walk VHCI controller state, including the shared
SuperSpeed HCD.  In the teardown path, the shared HCD can be removed and
put before the sysfs group is withdrawn, leaving a window where
status_show() can dereference freed HCD state.

Observed report:

  BUG: KASAN: slab-use-after-free in _raw_spin_lock+0x30/0x40
  Read of size 1 at addr ffff8880095f4478 by task cat/554

  CPU: 0 UID: 0 PID: 554 Comm: cat Not tainted
  7.1.0-rc2-00375-g917719c412c4 #3 PREEMPT(lazy)

  Call Trace:
   <TASK>
   dump_stack_lvl+0x66/0xa0
   print_report+0xce/0x630
   ? _raw_spin_lock+0x30/0x40
   ? srso_alias_return_thunk+0x5/0xfbef5
   ? __virt_addr_valid+0x188/0x320
   ? _raw_spin_lock+0x30/0x40
   kasan_report+0xe0/0x110
   ? _raw_spin_lock+0x30/0x40
   ? _raw_spin_lock+0x30/0x40
   __kasan_check_byte+0x36/0x50
   lock_acquire+0x11f/0x300
   ? status_show+0x2cb/0x3d0
   ? srso_alias_return_thunk+0x5/0xfbef5
   ? lock_release+0xc8/0x290
   ? __asan_memcpy+0x3c/0x60
   _raw_spin_lock+0x30/0x40
   ? status_show+0x320/0x3d0
   status_show+0x320/0x3d0
   ? __pfx_status_show+0x10/0x10
   ? __pfx_status_show+0x10/0x10
   ? dev_attr_show+0x24/0x90
   dev_attr_show+0x3b/0x90
   sysfs_kf_seq_show+0x115/0x1a0
   ? __pfx_dev_attr_show+0x10/0x10
   seq_read_iter+0x29d/0x790
   vfs_read+0x406/0x590
   ? __pfx_vfs_read+0x10/0x10
   ksys_read+0xd2/0x170
   ? __pfx_ksys_read+0x10/0x10
   ? srso_alias_return_thunk+0x5/0xfbef5
   ? srso_alias_return_thunk+0x5/0xfbef5
   do_syscall_64+0x115/0x6a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>

  Allocated by task 545:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   __kasan_kmalloc+0x8f/0xa0
   __kmalloc_noprof+0x28f/0x760
   __usb_create_hcd+0x45/0x500
   vhci_hcd_probe+0xd9/0x250
   platform_probe+0x69/0xe0
   really_probe+0x163/0x660
   __driver_probe_device+0x106/0x240
   device_driver_attach+0x7d/0x110
   bind_store+0x95/0xe0
   kernfs_fop_write_iter+0x1e0/0x280
   vfs_write+0x469/0x810
   ksys_write+0xd2/0x170
   do_syscall_64+0x115/0x6a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

  Freed by task 545:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   kasan_save_free_info+0x3b/0x60
   __kasan_slab_free+0x43/0x70
   kfree+0x315/0x540
   vhci_hcd_remove+0x66/0xc0
   really_probe+0x316/0x660
   __driver_probe_device+0x106/0x240
   device_driver_attach+0x7d/0x110
   bind_store+0x95/0xe0
   kernfs_fop_write_iter+0x1e0/0x280
   vfs_write+0x469/0x810
   ksys_write+0xd2/0x170
   do_syscall_64+0x115/0x6a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

  Last potentially related work creation:
   kasan_save_stack+0x33/0x60
   kasan_record_aux_stack+0x8c/0xa0
   __queue_work+0x661/0xa90
   queue_work_on+0x5f/0xb0
   unlink1+0x210/0x220
   usb_hcd_unlink_urb+0xb8/0x120
   usb_kill_urb.part.0+0x96/0x1c0
   hub_quiesce+0xfa/0x160
   hub_suspend+0x292/0x4f0
   usb_suspend_both+0x170/0x4c0
   usb_runtime_suspend+0x30/0x90
   __rpm_callback+0x67/0x290
   rpm_callback+0xab/0xc0
   rpm_suspend+0x1c2/0x970
   __pm_runtime_suspend+0x3d/0x1d0
   usb_new_device+0x645/0x870
   register_root_hub+0x146/0x320
   usb_add_hcd+0x726/0xbd0
   vhci_hcd_probe+0xf1/0x250
   platform_probe+0x69/0xe0
   really_probe+0x163/0x660
   __driver_probe_device+0x106/0x240
   device_driver_attach+0x7d/0x110
   bind_store+0x95/0xe0
   kernfs_fop_write_iter+0x1e0/0x280
   vfs_write+0x469/0x810
   ksys_write+0xd2/0x170
   do_syscall_64+0x115/0x6a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

  Second to last potentially related work creation:
   kasan_save_stack+0x33/0x60
   kasan_record_aux_stack+0x8c/0xa0
   __queue_work+0x661/0xa90
   queue_work_on+0x5f/0xb0
   usb_hcd_submit_urb+0x41c/0xf30
   usb_start_wait_urb+0xd8/0x2d0
   usb_control_msg+0x1c6/0x250
   hub_suspend+0x37d/0x4f0
   usb_suspend_both+0x170/0x4c0
   usb_runtime_suspend+0x30/0x90
   __rpm_callback+0x67/0x290
   rpm_callback+0xab/0xc0
   rpm_suspend+0x1c2/0x970
   __pm_runtime_suspend+0x3d/0x1d0
   usb_new_device+0x645/0x870
   register_root_hub+0x146/0x320
   usb_add_hcd+0x726/0xbd0
   vhci_hcd_probe+0xf1/0x250
   platform_probe+0x69/0xe0
   really_probe+0x163/0x660
   __driver_probe_device+0x106/0x240
   device_driver_attach+0x7d/0x110
   bind_store+0x95/0xe0
   kernfs_fop_write_iter+0x1e0/0x280
   vfs_write+0x469/0x810
   ksys_write+0xd2/0x170
   do_syscall_64+0x115/0x6a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

  The buggy address belongs to the object at ffff8880095f4000 which
  belongs to the cache kmalloc-8k of size 8192.
  The buggy address is located 1144 bytes inside of freed 8192-byte
  region [ffff8880095f4000, ffff8880095f6000).

A simplified ordering is:

  VHCI bind/test-remove path           sysfs reader
    vhci_hcd_probe()                     cat vhci_hcd.0/status
    usb_add_hcd() for SS HCD
    test remove runs
    vhci_hcd_remove()
    usb_remove_hcd()
    usb_put_hcd() frees SS HCD           status_show() walks SS state

Reproducer, run as root on a KASAN kernel with CONFIG_USBIP_VHCI_HCD
and CONFIG_DEBUG_TEST_DRIVER_REMOVE enabled:

  set -e
  modprobe vhci_hcd || true

  status=/sys/devices/platform/vhci_hcd.0/status
  bind=/sys/bus/platform/drivers/vhci_hcd/bind
  unbind=/sys/bus/platform/drivers/vhci_hcd/unbind
  dev=vhci_hcd.0

  if [ -e "$status" ]; then
          echo "$dev" > "$unbind" 2>/dev/null || true
  fi

  (
          deadline=$((SECONDS + 30))
          while [ ! -e "$status" ]; do
                  [ "$SECONDS" -lt "$deadline" ] || exit 1
                  sleep 0.1
          done

          for i in $(seq 1 50000); do
                  [ -e "$status" ] || break
                  cat "$status" >/dev/null 2>&1 || true
          done
  ) &

  reader=$!

  sleep 0.2
  echo "$dev" > "$bind"

  wait "$reader"

This looks like the vhci sysfs group needs to be published only after all
state reachable from the callbacks is live, and removed before any of that
state is removed or put.

Thanks,
Cen
