Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA0617BEBF
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 01:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179540; cv=none; b=qV9aLO5GmG2DGs0tLYzhoWYT28LP+O26raW3feMHOrVkL2xjVj6fQJapshy0+5cakfT3CzwySaEDdiE8cH6e0OwQh0zASfpC3quX9weCrhxQ4lFN+lf0DS+cMxQUKB+Q8FQwwzQxVUIKt5ObgHbkCxH0lRg9pImDkmJ4Xt2D6ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179540; c=relaxed/simple;
	bh=cR0KjUOwpJ2qIHpYg0ffrExapLMoXDdLrFIMx7CdStU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W2JxBl3QKkjlt0O2QP6lVFO/PN/5nTrmdmRRYu3Hx8v+A8mf6bG3RapzpMOJ5LxOZ44/AMjSGtOZNBZ1RSpoDEkg61QYwcvw2+EasVUE96CsXhOBYYYfn3je3329qOkRcJXWAKTeeiyBsq4XqqLVs7QHuDQnxCMiVXWixClRSsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqaUXEHr; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqaUXEHr"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c85d8615b09so3409483a12.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 18:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782179539; x=1782784339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mISB+NK2EkO8OtiU/5wV8YPXNGm1LEpqbnrfAMNKAyE=;
        b=dqaUXEHr9iGC0Okc5JC1KDEeKcQ0hmzOmcjszK8BPWWQkqG3B/ao4N/vF9A1KwsbCm
         drvS8vEHke9AVBeqqSIRv5X00Pk1jftxGQaVykW1GzqnTVMRwlUt7bRMFJAOMBsCA1UO
         0ymEmliEKlDYak0mY/r79x/e/sS1uvPbHSs49Ymt4kjPibeAeUFKmD7tUjUq5RlQ+3ka
         MXQct0R2LmLd2s7Cva5pyn8iAyxQYps5LJu8K+6jMsFoY1o7FwJPTKyJcECZHvhFPr3T
         6oRX+pNHVLdm73VEPRklyvFS6G821IhuojaKJpwj4+S+yizFfTPg2QW88/Tr8QhapifT
         iwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782179539; x=1782784339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mISB+NK2EkO8OtiU/5wV8YPXNGm1LEpqbnrfAMNKAyE=;
        b=FjzB51Z2gV4ZFISfuoZqKcRYpFoNahZ9cS1j6QCxrtJOYVL7BveoNgh6LHhOWi1HoT
         1KN2tPa1BmfnOhDrLwnN3zK3yEVGalYql1O7FrL0j2kKLVWEJ4KINjgdu3qeNoL6F8M1
         QlfVuQBj5vG8/mi8FZPlqPnjjeEtsNd7dCfiFk3gD7sgFdFgxFpguBWD4H7tuvyrdWzn
         ZJnTCs1qVvq/6vNukZYwEGWSVh4UKxfXP1bwr2aUFH5RxxbhQnpiPii9TwWFKXGAXku/
         PiYcedYrxr1AcR5ZSkEvOFNDBxn2+rzwGbNw9gxywFQSP6p+/hFhNacttGzxNeAocoZv
         +j+A==
X-Gm-Message-State: AOJu0Yzq1WsTkpAC0Ek9Zqle62wNpr3hF+W1nOQO7BGtbb0ht1AYrqdj
	C3ghKAgm7p1VwE1LTIp+u3uhQ177z/fiR8kTOp8hnX0srmRRptgrr0Ng
X-Gm-Gg: AfdE7cnfxoTCLlIoKYxvebPfWy4Ik5P+juz+lb2Rw625OO0u3Fh5lqbHh/X2gStx2tY
	GHPA/5BwAdoHEvItyme4BSuQyGbSEJQf5/bWa6Xeh8k6Lgnb6Y2yHVybGiyYxr3EqKQhYlSZMhE
	jRwy2RWI2M68PGO+AOSuB6G5270aiGqg7BtNDF9EdAq47dUTlwB01ikm3YAOSEHOgorJu0co8d+
	0j8I/VtJ6BdkX/8bcwskTvGDbIwaO9Dv6hvBt/Krjp87FCbhUuHmd4EiTpxr72ZksVdbS02HfIV
	CyAPC53Avw4GSqWFuUMLuBPIpUxtuFHLJrV1fRJedqtVYQf/0Z+0bauGiskI/blrgh1rZY6MBqO
	yr4lRc0Y2p0RPZ+Bso/OLZxadX1p4vkcMzsbjBRE+FCC8ZEIsZlTomN/Tyr9Ukavpq0MjEbfJ87
	yiOyPwSQ4=
X-Received: by 2002:a05:6a21:7105:b0:38b:eadd:449a with SMTP id adf61e73a8af0-3bb34652f1emr20055685637.38.1782179538646;
        Mon, 22 Jun 2026 18:52:18 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc2c8f0a7sm8680214a12.7.2026.06.22.18.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 18:52:18 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Mike Christie <michael.christie@oracle.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] usb: gadget: f_tcm: Cancel delayed set_alt work on teardown
Date: Tue, 23 Jun 2026 09:52:11 +0800
Message-Id: <20260623015211.4111938-1-zzzccc427@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tcm_set_alt() defers BOT/UAS endpoint setup to a system workqueue and
returns USB_GADGET_DELAYED_STATUS. The queued work keeps the function
state alive only by a raw struct f_uas pointer, but configfs unlink can
unbind and free that function before the work runs.

The buggy scenario involves two paths, with each column showing the order
within that path:

USB control request path:           configfs unlink path:
  1. SET_CONFIGURATION or             1. Userspace removes the function
     SET_INTERFACE reaches               symlink while the gadget is bound.
     tcm_set_alt().
  2. tcm_set_alt() queues delayed     2. config_usb_cfg_unlink() forces
     set_alt work and returns            gadget unregister.
     USB_GADGET_DELAYED_STATUS.
  3. tcm_delayed_set_alt() later      3. tcm_unbind() releases descriptors
     dereferences struct f_uas.          and tcm_free() frees struct f_uas.

Validation reproduced this kernel report:
BUG: KASAN: slab-use-after-free in tcm_delayed_set_alt+0x6c/0xef0

Call Trace:
 <TASK>
 dump_stack_lvl+0x66/0xa0
 print_report+0xce/0x630
 ? tcm_delayed_set_alt+0x6c/0xef0
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? __virt_addr_valid+0x188/0x320
 ? tcm_delayed_set_alt+0x6c/0xef0
 kasan_report+0xe0/0x110
 ? tcm_delayed_set_alt+0x6c/0xef0
 tcm_delayed_set_alt+0x6c/0xef0
 ? __pfx_tcm_delayed_set_alt+0x10/0x10
 ? process_one_work+0x4cb/0xb90
 ? rcu_is_watching+0x20/0x50
 ? tcm_delayed_set_alt+0x9/0xef0
 process_one_work+0x4d7/0xb90
 ? __pfx_process_one_work+0x10/0x10
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? __list_add_valid_or_report+0x37/0xf0
 ? __pfx_tcm_delayed_set_alt+0x10/0x10
 ? srso_alias_return_thunk+0x5/0xfbef5
 worker_thread+0x2d8/0x570
 ? __pfx_worker_thread+0x10/0x10
 kthread+0x1ad/0x1f0
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x3c9/0x540
 ? __pfx_ret_from_fork+0x10/0x10
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? __switch_to+0x2e9/0x730
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>

Allocated by task 544:
 kasan_save_stack+0x33/0x60
 kasan_save_track+0x14/0x30
 __kasan_kmalloc+0x8f/0xa0
 tcm_alloc+0x68/0x180
 usb_get_function+0x36/0x60
 config_usb_cfg_link+0x125/0x1b0
 configfs_symlink+0x322/0x890
 vfs_symlink+0xc2/0x270
 filename_symlinkat+0x295/0x2f0
 __x64_sys_symlinkat+0x62/0x90
 do_syscall_64+0x115/0x6a0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 661:
 kasan_save_stack+0x33/0x60
 kasan_save_track+0x14/0x30
 kasan_save_free_info+0x3b/0x60
 __kasan_slab_free+0x43/0x70
 kfree+0x2f9/0x530
 config_usb_cfg_unlink+0x173/0x1e0
 configfs_unlink+0x1fa/0x340
 vfs_unlink+0x15c/0x510
 filename_unlinkat+0x2ba/0x450
 __x64_sys_unlinkat+0x63/0x90
 do_syscall_64+0x115/0x6a0
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Make the delayed set_alt work item owned by struct f_uas instead of an
anonymous heap allocation. This gives teardown paths a stable handle for
the exact work item: disable cancels pending work without sleeping, and
unbind/free synchronously cancel it before descriptors or struct f_uas are
released.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Assisted-by: Codex:gpt-5.5
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 drivers/usb/gadget/function/f_tcm.c | 32 ++++++++++-------------------
 drivers/usb/gadget/function/tcm.h   |  2 ++
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 34d9f49e9987..4096f94586fe 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -2363,20 +2363,10 @@ static int tcm_bind(struct usb_configuration *c, struct usb_function *f)
 	return -ENOTSUPP;
 }
 
-struct guas_setup_wq {
-	struct work_struct work;
-	struct f_uas *fu;
-	unsigned int alt;
-};
-
 static void tcm_delayed_set_alt(struct work_struct *wq)
 {
-	struct guas_setup_wq *work = container_of(wq, struct guas_setup_wq,
-			work);
-	struct f_uas *fu = work->fu;
-	int alt = work->alt;
-
-	kfree(work);
+	struct f_uas *fu = container_of(wq, struct f_uas, delayed_set_alt);
+	int alt = fu->delayed_alt;
 
 	if (fu->flags & USBG_IS_BOT)
 		bot_cleanup_old_alt(fu);
@@ -2413,15 +2403,8 @@ static int tcm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 		return -EOPNOTSUPP;
 
 	if ((alt == USB_G_ALT_INT_BBB) || (alt == USB_G_ALT_INT_UAS)) {
-		struct guas_setup_wq *work;
-
-		work = kmalloc_obj(*work, GFP_ATOMIC);
-		if (!work)
-			return -ENOMEM;
-		INIT_WORK(&work->work, tcm_delayed_set_alt);
-		work->fu = fu;
-		work->alt = alt;
-		schedule_work(&work->work);
+		fu->delayed_alt = alt;
+		schedule_work(&fu->delayed_set_alt);
 		return USB_GADGET_DELAYED_STATUS;
 	}
 	return -EOPNOTSUPP;
@@ -2431,6 +2414,8 @@ static void tcm_disable(struct usb_function *f)
 {
 	struct f_uas *fu = to_f_uas(f);
 
+	cancel_work(&fu->delayed_set_alt);
+
 	if (fu->flags & USBG_IS_UAS)
 		uasp_cleanup_old_alt(fu);
 	else if (fu->flags & USBG_IS_BOT)
@@ -2583,11 +2568,15 @@ static void tcm_free(struct usb_function *f)
 {
 	struct f_uas *tcm = to_f_uas(f);
 
+	cancel_work_sync(&tcm->delayed_set_alt);
 	kfree(tcm);
 }
 
 static void tcm_unbind(struct usb_configuration *c, struct usb_function *f)
 {
+	struct f_uas *tcm = to_f_uas(f);
+
+	cancel_work_sync(&tcm->delayed_set_alt);
 	usb_free_all_descriptors(f);
 }
 
@@ -2621,6 +2610,7 @@ static struct usb_function *tcm_alloc(struct usb_function_instance *fi)
 	fu->function.free_func = tcm_free;
 	fu->tpg = tpg_instances[i].tpg;
 
+	INIT_WORK(&fu->delayed_set_alt, tcm_delayed_set_alt);
 	hash_init(fu->stream_hash);
 	mutex_unlock(&tpg_instances_lock);
 
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/function/tcm.h
index 009974d81d66..b07bf4aa7d88 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -123,6 +123,8 @@ struct f_uas {
 	struct usbg_tpg		*tpg;
 	struct usb_function	function;
 	u16			iface;
+	struct work_struct	delayed_set_alt;
+	unsigned int		delayed_alt;
 
 	u32			flags;
 #define USBG_ENABLED		(1 << 0)
-- 
2.43.0
