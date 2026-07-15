Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8BD2EEE6C;
	Wed, 15 Jul 2026 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122756; cv=none; b=bfdfKwpwiKGSPW7DPza5gm8NMpUs77PCnRM7eJSfqWBMHmNkX5QAkCOZh2TvRRU48B8LG/7rLLIN9clP0rZUpNQyqbGeZaAIipyJdgqgQ0ExXMC6nhQ3u7jxRcFvTzX0LEly07F2ZGBShArvw9ASa1XB7vnuoAca4k4chOyw+JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122756; c=relaxed/simple;
	bh=FnjkN4wrlyrE9ZAdS7T6K0qnvOIgeOrDIqoKdywNYRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=boeQAduh51ZpvlOe47HW0yeGYkxrFTt9YPfjUAh1YPvzVCclIW7uCQDTWlw1wuIUhmg970biEEdg0sBzNEcQf6hGARDDJZdvfpsDOdQWyBkmF1YXVxszVFYqOeI7XfXb04G6sdFi2OPqWohEEZ813xGgFBm4slwVr0BSa71ED/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ist.utl.pt; spf=pass smtp.mailfrom=ist.utl.pt; dkim=pass (1024-bit key) header.d=ist.utl.pt header.i=@ist.utl.pt header.b=EWL2DI41; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ist.utl.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ist.utl.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ist.utl.pt header.i=@ist.utl.pt header.b="EWL2DI41"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 880DC63ED9DF;
	Wed, 15 Jul 2026 14:39:07 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id ZHSoy87quYK9; Wed, 15 Jul 2026 14:39:05 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 2E28D63AABBB;
	Wed, 15 Jul 2026 14:39:05 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ist.utl.pt; s=mail;
	t=1784122745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t/AvaP22Dr1pHkIy684z2z9HLfMCh35QW4IURtA2t5Y=;
	b=EWL2DI41rEy4U9eRemo1ghygHrvneDsejQe5RGtS+ETiDn58oAsrwwgRr6ox8xhrpRvs5X
	yIHIjVji9ZHdMK8rVB70yDqazRizqrPJ68XZzkrNdYeolcwDGbJ/YAyDpGmpnx5IZ29ci6
	T1l3ZCOmtDu319eYby53WAvqxGPSAwU=
Received: from jcmfernandes-desktop.tail184b8c.ts.net (unknown [IPv6:2a01:14:8051:c010:9cf8:681b:7723:92e4])
	(Authenticated sender: ist157885)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id BAE383601AF;
	Wed, 15 Jul 2026 14:39:04 +0100 (WEST)
From: =?UTF-8?q?Jo=C3=A3o=20Moreira=20Fernandes?= <joao.fernandes@ist.utl.pt>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jo=C3=A3o=20Moreira=20Fernandes?= <joao.fernandes@ist.utl.pt>
Subject: [PATCH] usbip: flush the event handler in usbip_stop_eh() to fix use-after-free
Date: Wed, 15 Jul 2026 14:38:55 +0100
Message-ID: <20260715133855.2312018-1-joao.fernandes@ist.utl.pt>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

usbip_stop_eh() is used by the stub, vhci and vudc sides to wait for the
event handler to finish with a usbip_device before the caller tears it
down.  It waits only on the event bitmask:

	wait_event_interruptible(ud->eh_waitq, !(ud->event & ~USBIP_EH_BYE));

but event_handler() clears those bits with unset_event() *before* its
final dereferences of ud:

	if (ud->event & USBIP_EH_SHUTDOWN) {
		ud->eh_ops.shutdown(ud);
		unset_event(ud, USBIP_EH_SHUTDOWN);   /* wait may now return */
	}
	...
	mutex_unlock(&ud->sysfs_lock);            /* still touches ud */
	wake_up(&ud->eh_waitq);                   /* still touches ud */

Once the last non-BYE bit is cleared the waiter can wake and the caller
proceeds to free ud.  For the stub side, stub_disconnect() ->
shutdown_busid() calls usbip_stop_eh() and then stub_device_free() frees
the stub_device that embeds ud, while event_handler() is still executing
mutex_unlock(&ud->sysfs_lock) and wake_up(&ud->eh_waitq), and may still
mutex_lock(&ud->sysfs_lock) on a second queued event for the same ud.
The result is a use-after-free in the usbip_event workqueue.

It is readily triggered by a reverse/exported-device teardown that
unbinds usbip-host while the importer is still attached: the socket EOF
queues SDEV_EVENT_ERROR_TCP (SHUTDOWN|RESET) from the stub_rx thread at
the same moment stub_disconnect() queues SDEV_EVENT_REMOVED
(SHUTDOWN|BYE), so the handler re-runs shutdown/reset on ud in the exact
window where it is being freed.

Reproduced under KASAN on v6.12.95 (usbip built as vhci_hcd importer and
usbip-host exporter on two separate VMs).  The freed object is the
stub_device, freed by the unbind write and then read by the event
workqueue:

  BUG: KASAN: slab-use-after-free in event_handler+0x2ba/0x3a0
  Read of size 8 at addr ffff888005cc6058 by task kworker/u8:5/63
  Workqueue: usbip_event event_handler
  Call Trace:
   event_handler+0x2ba/0x3a0
   process_one_work+0x5c2/0xfd0
   worker_thread+0x49d/0xb00
   kthread+0x246/0x300

  Allocated by task 1657:
   stub_probe+0xf0/0xb00
   usb_probe_device+0xaa/0x2e0
   bind_store+0xce/0x140
   vfs_write+0x87c/0xd70

  Freed by task 1660:
   kfree+0x1a4/0x3a0
   stub_disconnect+0x21e/0x340
   usb_unbind_device+0x6b/0x170
   device_release_driver_internal+0x384/0x550
   unbind_store+0xdb/0xf0
   vfs_write+0x87c/0xd70

The same run produced 37 KASAN splats against the one freed object,
reached through every place the handler still touches ud after clearing
the event bits: mutex_lock() on ud->sysfs_lock, the eh_waitq wake
(__wake_up_common / finish_wait / prepare_to_wait_event), and
stub_shutdown_connection() called from event_handler().

Waiting on the event bits cannot close the window, because the handler's
last accesses to ud are inherently after the bit is cleared.  Instead,
flush the event work in usbip_stop_eh() so the handler has fully returned
before the caller is allowed to free ud.  Every *_EVENT_REMOVED sets
USBIP_EH_BYE, after which usbip_event_add() no longer queues new work for
that ud, so flush_work() only has to wait out the in-flight run.  Guard
the flush with usbip_in_eh() so it is skipped in the (stub reset) path
that runs from the handler itself, and move the usbip_work declaration
above usbip_stop_eh() so it is in scope.  None of the three usbip_stop_eh()
callers hold ud->sysfs_lock, so flushing the worker (which takes it)
cannot deadlock.

With the patch applied, the same KASAN reproducer runs the teardown
suite repeatedly with zero KASAN reports.

Fixes: 363eaa3a450a ("usbip: synchronize event handler with sysfs code paths")
Cc: stable@vger.kernel.org
Signed-off-by: João Moreira Fernandes <joao.fernandes@ist.utl.pt>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/usb/usbip/usbip_event.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/usbip_event.c b/drivers/usb/usbip/usbip_event.c
index 0e00c2d000f8..675fa2beeefd 100644
--- a/drivers/usb/usbip/usbip_event.c
+++ b/drivers/usb/usbip/usbip_event.c
@@ -97,6 +97,8 @@ static void event_handler(struct work_struct *work)
 	}
 }
 
+static DECLARE_WORK(usbip_work, event_handler);
+
 int usbip_start_eh(struct usbip_device *ud)
 {
 	init_waitqueue_head(&ud->eh_waitq);
@@ -116,6 +118,14 @@ void usbip_stop_eh(struct usbip_device *ud)
 		usbip_dbg_eh("usbip_eh waiting completion %lx\n", pending);
 
 	wait_event_interruptible(ud->eh_waitq, !(ud->event & ~USBIP_EH_BYE));
+
+	/*
+	 * The wait only tracks ud->event, which event_handler() clears before
+	 * its last dereferences of ud; flush so it cannot touch freed memory.
+	 */
+	if (!usbip_in_eh(current))
+		flush_work(&usbip_work);
+
 	usbip_dbg_eh("usbip_eh has stopped\n");
 }
 EXPORT_SYMBOL_GPL(usbip_stop_eh);
@@ -123,7 +133,6 @@ EXPORT_SYMBOL_GPL(usbip_stop_eh);
 #define WORK_QUEUE_NAME "usbip_event"
 
 static struct workqueue_struct *usbip_queue;
-static DECLARE_WORK(usbip_work, event_handler);
 
 int usbip_init_eh(void)
 {
-- 
2.54.0

