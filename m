Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E596194A6C
	for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849251; cv=none; b=tFZtH6BXIH/C5ti+DVXBPmQQXgniPWe3J6ULKgYbhB3BB1OUp1obL1ylrCszYp8zv+LaKd7F/pZElItSoyWkN2LyF8wYtZzWnx2Z0HA3gUDZJRZK3b/YsimgliEr4yYzCsnWwakZ/fTwl6DuzHFFdh2lR3SHxEYKTJC5pN1Ftls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849251; c=relaxed/simple;
	bh=xwMveb5O/O/jfzHb7kDhJ+rn789ULWdn2u0VOQoZHdU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ut/skr1M6SW+O26sYAlyEx4DYkYPMuvmM3+90MS0Dwjl3Y0s5j4bux8FB53LhgmwxkbxUCg4WePAc74etMxPk8c1BH6fpabZagCzBhiHWcDqhs8C1TBInd15YyUbK4pTR7sWnlfwKgobE6uj0k4jQElLRNN0soZRnhFViAj7tfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=v3ArNh7O; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="v3ArNh7O"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2953866a91.1
        for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 02:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1783849245; x=1784454045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhJe+DMfXFMlds1H38bs4HvQRAF3B6aW+cYTOsB5y1o=;
        b=v3ArNh7OivzM0YSVeKhF1nuWy4ORvW4v7Aokr1WTZOjGozL5diGOAyaoMaVRpxR7Ez
         A+C9NqoztYDrpo8VhKEFW6H2Nz78oGWbJB15uVEq7gPGzSBUfomE414QvsTY3laogAqq
         87LJAkMQn1M7Nn5jUdLND7c6Jgui0ctfxNnfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849245; x=1784454045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhJe+DMfXFMlds1H38bs4HvQRAF3B6aW+cYTOsB5y1o=;
        b=fbGsPUJtfTAKea6G0jw6OPE+j0Xl1YG939m4QEo59+Els05xNeW2LWmuFoRci/jFt+
         gukAxe9g4SChavFmElPBUJBv8MNjRV7l0+p9qXZ9Ost3jZJKF0Sw+x63NlKKopP9ggiw
         ZUW1TecmFiS8YBZ6rlBi7Und35Y18aOMrp8P4vwSrIgvAfhWo9+5eKzA2KudkaRwJB2Z
         8Zv/20uhklrQ4IgXK5S+4Wh1el4frXPdCwr6i1tTRe+kVMxSVGN/qxzSP4Lw1Ot+/Juu
         aLLCWHnfcF9xXZIIgwXcRmrnluT6Tfc49vKNsQh5ydhdWYMN/rLSxOBqAhApste27DYJ
         ZrqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7p8sSSU3aRH+oMXBTDrdCY1E0ZfYBq+pI/Ift+ewFi3JjSGoHry67rLp3TF5FWG1dAtHvxpeR7G8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzMEs+SeODvCwp3e3aIxzBIlc6UFCneb8VH/k8lGfBm+CFGA+P
	IWdNfY3B4xGmdprDZMpcG83bbmByIt9gG9bh/zHZqEFGjR+kV9WWLd2/YxLZZd+dv7s=
X-Gm-Gg: AfdE7clz+sG7O3c41yLYf9lTcwRASCQTsnqYCBsVsg1qGDak36s1hrAhaS3wO83wojV
	mdc0GAQZGyhRd/vxTirtmEu8072hRzFqDvzxiFoH7kNJDlVgIZwtZUNUP/ke6TrEDRyozrAXPvc
	kLkg0+9Nid7jNgnMwATSKocOuYHmnBcgGklyEhrb7GfYFot6bSqFd0y942TI6I/kHEstCeu0T4s
	ZkRIlS9gdFXKMGi1s8nkDYwYTyHdh3IyFJFpMZ2hgTLMKXXxv6toi0MjqT414E7G5+SKl7u9p5j
	ykW/kwo7eVqOweQewJNBVeTodLE95EHs2+0SvVvSue6cDM+r7rMWqkh+b1xxu1Nquvmr9GOVC24
	R9ZUALFBB/gdcl9vw1fCgOL/6WxKhL2JGFQ59vjw+eA9crAHz2RpAR5TzJjGU0mCS6kRplxaoe5
	HudKv+CT7pLmmD2G3j7lnLa+1hqxc/oLuwKUBG5N1pxNPMYHAYByoMRc46uEfSXuLRky3/n49Ug
	6TpLuvvAFQLKo1S4as=
X-Received: by 2002:a17:90b:1dc9:b0:381:528a:808a with SMTP id 98e67ed59e1d1-38dc7735977mr5333167a91.27.1783849244698;
        Sun, 12 Jul 2026 02:40:44 -0700 (PDT)
Received: from jjy.. ([147.46.89.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b47esm4855048a91.3.2026.07.12.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:40:44 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eulgyu Kim <eulgyukim@snu.ac.kr>,
	Jaeyoung Chung <jjy600901@snu.ac.kr>
Subject: [BUG] KASAN: slab-use-after-free Read in vhci_tx_loop
Date: Sun, 12 Jul 2026 18:40:37 +0900
Message-Id: <20260712094037.1560970-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

We found a slab-use-after-free Read in vhci_tx_loop on Linux v7.2-rc2
(8cdeaa50eae8dad34885515f62559ee83e7e8dda).

The report below was produced on an x86_64 QEMU guest with KASAN. The kernel
configuration is the same as the syzbot configuration.

Required kernel config for reproducing the issue:
	CONFIG_USBIP_CORE=y
	CONFIG_USBIP_VHCI_HCD=y
	CONFIG_USBIP_VHCI_HC_PORTS=8
	CONFIG_USBIP_VHCI_NR_HCS=16
	CONFIG_KASAN=y
	CONFIG_KASAN_GENERIC=y
	CONFIG_KASAN_INLINE=y

To make the race reliably reproducible, I applied the testing-only delay
patch below. I then built and ran the reproducer as root:

  gcc repro.c -o repro -static -lpthread
  ./repro

I do not have a proposed fix for this issue. Please let me know if any
additional information or testing would be useful.

Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
Reported-by: Eulgyu Kim <eulgyukim@snu.ac.kr>

Kernel delay patch:
==================================================================
diff --git a/drivers/usb/usbip/vhci_tx.c b/drivers/usb/usbip/vhci_tx.c
index 32e6fabccf72..c31fb40a8c55 100644
--- a/drivers/usb/usbip/vhci_tx.c
+++ b/drivers/usb/usbip/vhci_tx.c
@@ -6,6 +6,7 @@
 #include <linux/kthread.h>
 #include <linux/slab.h>
 #include <linux/scatterlist.h>
+#include <linux/delay.h>
 
 #include "usbip_common.h"
 #include "vhci.h"
@@ -41,6 +42,11 @@ static struct vhci_priv *dequeue_from_priv_tx(struct vhci_device *vdev)
        list_for_each_entry_safe(priv, tmp, &vdev->priv_tx, list) {
                list_move_tail(&priv->list, &vdev->priv_rx);
                spin_unlock_irqrestore(&vdev->priv_lock, flags);
+               if (strncmp(current->comm, "vhci_tx", 7) == 0) {
+                       pr_info("vhci_tx moved priv=%px to priv_rx; hold before priv->urb read\n",
+                               priv);
+                       mdelay(700);
+               }
                return priv;
        }
==================================================================

C reproducer:
==================================================================
// gcc repro.c -o repro -static -lpthread
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <stdint.h>
#include <sys/socket.h>
#include <sys/prctl.h>
#include <pthread.h>
#include <arpa/inet.h>

#define USBIP_RET_SUBMIT	3u
#define VHCI_HC_PORTS		8
#define VHCI_PORTS		(VHCI_HC_PORTS * 2)
#define VHCI_NR_HCS		16
#define USBIP_HDR_SIZE		48
#define USB_SPEED_LOW		1

static void build_ret_submit(unsigned char *buf, unsigned int seqnum)
{
	uint32_t v;

	memset(buf, 0, USBIP_HDR_SIZE);
	v = htonl(USBIP_RET_SUBMIT);	memcpy(buf + 0, &v, 4);
	v = htonl(seqnum);		memcpy(buf + 4, &v, 4);
}

struct arm_ctx {
	int sv1;
	unsigned int seqnum;
};

static void *ret_writer(void *arg)
{
	struct arm_ctx *c = arg;
	unsigned char pdu[USBIP_HDR_SIZE];

	prctl(PR_SET_NAME, "repro1", 0, 0, 0);
	usleep(400 * 1000);

	build_ret_submit(pdu, c->seqnum);
	(void)write(c->sv1, pdu, USBIP_HDR_SIZE);
	return NULL;
}

static int open_attach(int ctrl)
{
	char path[128];

	snprintf(path, sizeof(path),
		 "/sys/devices/platform/vhci_hcd.%d/attach", ctrl);
	return open(path, O_WRONLY);
}

static void do_detach(int ctrl, int port)
{
	char path[128], buf[32];
	int fd, n;

	snprintf(path, sizeof(path),
		 "/sys/devices/platform/vhci_hcd.%d/detach", ctrl);
	fd = open(path, O_WRONLY);
	if (fd < 0)
		return;
	n = snprintf(buf, sizeof(buf), "%d", port);
	(void)write(fd, buf, n);
	close(fd);
}

int main(void)
{
	int ctrl;

	prctl(PR_SET_NAME, "repro0", 0, 0, 0);

	for (ctrl = 0; ctrl < VHCI_NR_HCS; ctrl++) {
		int sv[2];
		int afd, n;
		int port = ctrl * VHCI_PORTS;
		char attach[64];
		pthread_t th;
		struct arm_ctx ctx;

		if (socketpair(AF_UNIX, SOCK_STREAM, 0, sv) < 0)
			continue;

		afd = open_attach(ctrl);
		if (afd < 0) {
			afd = open("/sys/devices/platform/vhci_hcd.0/attach", O_WRONLY);
			if (afd < 0) {
				close(sv[0]);
				close(sv[1]);
				continue;
			}
		}

		n = snprintf(attach, sizeof(attach), "%d %d %d %d",
			     port, sv[0], 0, USB_SPEED_LOW);

		ctx.sv1 = sv[1];
		ctx.seqnum = 1;
		if (pthread_create(&th, NULL, ret_writer, &ctx) != 0) {
			close(afd);
			close(sv[0]);
			close(sv[1]);
			continue;
		}

		(void)write(afd, attach, n);
		close(afd);

		usleep(2500 * 1000);

		pthread_join(th, NULL);

		do_detach(ctrl, port);
		close(sv[0]);
		close(sv[1]);
	}

	return 0;
}
==================================================================

KASAN crash log:
==================================================================
BUG: KASAN: slab-use-after-free in vhci_send_cmd_submit drivers/usb/usbip/vhci_tx.c:75 [inline]
BUG: KASAN: slab-use-after-free in vhci_tx_loop+0x320/0x1240 drivers/usb/usbip/vhci_tx.c:247
Read of size 8 at addr ffff888011eaf4a0 by task vhci_tx/368

CPU: 1 UID: 0 PID: 368 Comm: vhci_tx Not tainted 7.2.0-rc2-dirty #2 PREEMPTLAZY 
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x2d/0x90 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x175/0x7f0 mm/kasan/report.c:482
 kasan_report+0x139/0x170 mm/kasan/report.c:595
 vhci_send_cmd_submit drivers/usb/usbip/vhci_tx.c:75 [inline]
 vhci_tx_loop+0x320/0x1240 drivers/usb/usbip/vhci_tx.c:247
 kthread+0x30e/0x410 kernel/kthread.c:436
 ret_from_fork+0x1e0/0x460 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 11:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x72/0x90 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x1d7/0x420 mm/slub.c:5515
 _kmalloc_noprof include/linux/slab.h:969 [inline]
 _kzalloc_noprof include/linux/slab.h:1290 [inline]
 vhci_tx_urb drivers/usb/usbip/vhci_hcd.c:674 [inline]
 vhci_urb_enqueue+0x368/0xbc0 drivers/usb/usbip/vhci_hcd.c:829
 usb_hcd_submit_urb+0x315/0x1690 drivers/usb/core/hcd.c:1542
 usb_start_wait_urb+0xc2/0x210 drivers/usb/core/message.c:62
 usb_internal_control_msg drivers/usb/core/message.c:117 [inline]
 usb_control_msg+0x234/0x3b0 drivers/usb/core/message.c:167
 get_bMaxPacketSize0+0xbc/0x5a0 drivers/usb/core/hub.c:4851
 hub_port_init+0x7ae/0x1d70 drivers/usb/core/hub.c:5047
 hub_port_connect drivers/usb/core/hub.c:5496 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1a36/0x3250 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0x725/0xc10 kernel/workqueue.c:3405
 worker_thread+0x7ed/0xbb0 kernel/workqueue.c:3486
 kthread+0x30e/0x410 kernel/kthread.c:436
 ret_from_fork+0x1e0/0x460 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 367:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x3a/0x60 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2705 [inline]
 slab_free mm/slub.c:6405 [inline]
 kfree+0x16c/0x3e0 mm/slub.c:6720
 pickup_urb_and_free_priv drivers/usb/usbip/vhci_rx.c:46 [inline]
 vhci_recv_ret_submit drivers/usb/usbip/vhci_rx.c:65 [inline]
 vhci_rx_pdu drivers/usb/usbip/vhci_rx.c:242 [inline]
 vhci_rx_loop+0x357/0xc30 drivers/usb/usbip/vhci_rx.c:265
 kthread+0x30e/0x410 kernel/kthread.c:436
 ret_from_fork+0x1e0/0x460 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888011eaf480
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 32 bytes inside of
 freed 64-byte region [ffff888011eaf480, ffff888011eaf4c0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888011eafc00 pfn:0x11eaf
flags: 0x100000000000200(workingset|node=0|zone=1)
page_type: f5(slab)
raw: 0100000000000200 ffff88800a8418c0 ffff88800a840390 ffffea0000592b10
raw: ffff888011eafc00 0000000800200016 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888011eaf380: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
 ffff888011eaf400: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff888011eaf480: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                               ^
 ffff888011eaf500: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888011eaf580: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
==================================================================
