Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B1E407CDC
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571325; cv=none; b=DEl9pAenr5PIBsmPgWw/vQGd4gijANaoxE0tLf8g8GAq9ClbvZqjWbAYbcj5rGRJhykPa2bbpt+NcsYvY47py6nWGJO6/QuEQcIqams/TP/YGYhpHOFoimEjP//P07AZaiBNKm1vg4pF2J8GC7Lpxtp5B8ZVt+1w2j7iwTz4bqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571325; c=relaxed/simple;
	bh=jN51nYw4hd9tMCSCZa/mgI1hQArmTZ9M6nj9ZQTMYjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EZGctMjBtVa6EFDYuaLq2cK3BDy6Chp/PwCA12D5qe57oHqzGuF2qy/8b8yfyymGzvPLUTGXP3N9zTH7PMvQkUAdwmWd4po6lnqCuFOY7Q80PH0jKmrB6cw7TLXzXlvuUWFX/jguTtVW4M2OPKWGlVqDjePAvlyQbZsCp2LKL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=KLMxVwnD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="KLMxVwnD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38101f85591so3556533a91.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1787571320; x=1788176120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xs4/hw8x1PBD+pLQSTNuCqi+GxQzrOw0Fm/12NJE7qo=;
        b=KLMxVwnDnUL0DlqBMa6lzF1HiFZyMZ7Y+rj1sy2B/h/pzVgu8BoXglIdd3JJ6dZk9N
         BA7gN0vvjA60p1+ICcuqPak8xze7yEK3YwRj5cNZzyMHhZXs10Vbp36CB2JEfuafbjmq
         DMD+SoxhrVDHCZ3I7laDvJyL5GCoboEaej8QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571320; x=1788176120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xs4/hw8x1PBD+pLQSTNuCqi+GxQzrOw0Fm/12NJE7qo=;
        b=owB9uSdkJtM6FXVjBVcZb9KTpJUh9nPjVrMeMgh8vda3gvSxVf1DP/DUn2nMfVcT8H
         y+8FVOnkh382I3I8TtReGhVQY1/49Ofq4tnEJNvvjON71ahNjEdTz03KQ1suLPORbwmk
         wlrBfCeTMT0fozM5nc9ycsMAqVcBk7rDIy0IIS9IkyomXhBISFRJj4PCspKV7lqAcRdj
         LqZ2TZp7wnoBDfzFVvOsncVXjmp6aCRekDCBHepQ+jyw51sXZX17Ehja852fMwDMzsvH
         msZSROdmIul7A1I/HWjtdDgvM404KIgYA0zzdPXn06pg8MgZDKjeJnmZJRyimB44/LbG
         Sv1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqWpYeU0Zc9dL2VBUH1x1ywc9KOdu081KoCo3YePJvHdyr+cLvt7dFtPFUVKzxcNCuqMu1lEekv+BI=@vger.kernel.org
X-Gm-Message-State: AFuF++mN8Ynw5NjY2QZYLvZ+P32EBi3nD5OxvDi3YmilNzaUXAdMpqaZ
	B59BsfSTq2BrqInxWyyS6pqrt5BdaoeU+IonGtpyy3Nrnt/6qQXC6rLhB/+VZvFf/Yo=
X-Gm-Gg: AR+sD13wFNEHV/DMSBG9W4nlfyhj8tj7+J7h1gbArHARnYFvJ4mlGfNALu5UQw7tcBY
	dxlPIP06L8f3Jvtse+9ZSSJGP1BDp5cF5XYZZ1JaX/CaXcCZunb2rl8smYhbp3ilZNSVYUNYcWa
	0f478fUYldahkRAZWQvul27+NqBV5V+XojS3ZDYGfDFK7RJPWLyGK18wdjp2iNdtxknrG8Qq0nl
	OyDhUId/d7K+P4JQ/LLkcZamUpANqyDe73d3b0AJ9fX5G5ua9gi1MUHy9qEmIR6XM2n03DG6MWE
	jtK8TROwQ9BEQgjZMcjQVk9atZTPhCnxvB8zoDZOPzRCAz3DSlcbJ+CrBe4Ylv/O3Pkckq9AhHE
	zvwWBOBUFgZajcPh1BbnL7nkCYIPH0YnRh3VG2NF8zYu/+X+k5JUim1Wmb7hLnswIWRAy8gwax3
	wwwquYYeoj7CoViLR8JZIgDVJscWWjDJg/iW/ZLqFFYV87c7dRLc3QlHEgW8WEezgIE5wyUdwIa
	p+wXQPreudLwK5nfiUxjTtkNQb6kGGP1MMmQsvWqa4uKMFTGa5Lpx9YNY3jtSsqywz3LAIk4kBz
	YH01oSPBwZeiAZrmUEMakeIXVKcDXVFmOT61YciX3WMjpxPRI4YyYA==
X-Received: by 2002:a17:90b:37c5:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-395c4c35ac3mr23768088a91.3.1787571320129;
        Mon, 24 Aug 2026 04:35:20 -0700 (PDT)
Received: from leesin ([147.46.121.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c911646dsm4771885a91.2.2026.08.24.04.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:35:19 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: brauner@kernel.org,
	jack@suse.cz,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	mjguzik@gmail.com,
	viro@zeniv.linux.org.uk,
	eulgyukim@snu.ac.kr,
	jjy600901@snu.ac.kr
Subject: [BUG] general protection fault in gadget_dev_ioctl
Date: Mon, 24 Aug 2026 20:35:09 +0900
Message-ID: <20260824113510.1141236-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

We found a "general protection fault in gadget_dev_ioctl" on Linux v7.2.
The issue was found by our own race fuzzer. We have not analyzed the root cause,
so we do not have a proposed fix to offer.

To reproduce the race reliably, we applied the delay patch below to the
kernel and ran the C reproducer as root inside an x86_64 QEMU guest. The
crash log we observed, the delay patch and the reproducer are all included
below.

The following kernel config options are required to reproduce the issue:
    CONFIG_USB_SUPPORT=y
    CONFIG_USB=y
    CONFIG_USB_GADGET=y
    CONFIG_USB_DUMMY_HCD=y
    CONFIG_USB_GADGETFS=y
    CONFIG_KASAN=y

We hope this report is useful. Please let us know if any further
information would help.

Reported-by: Eulgyu Kim <eulgyukim@snu.ac.kr>
Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>

Kernel delay patch:
==================================================================
diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..b996abcae31a 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1254,6 +1254,10 @@ static long gadget_dev_ioctl (struct file *fd, unsigned code, unsigned long valu
 	struct usb_gadget	*gadget = dev->gadget;
 	long ret = -ENOTTY;
 
+	if (!gadget && strncmp(current->comm, "syzrepro1", 9) == 0) {
+		mdelay(100);
+	}
+
 	spin_lock_irq(&dev->lock);
 	if (dev->state == STATE_DEV_OPENED ||
 			dev->state == STATE_DEV_UNBOUND) {
@@ -1805,6 +1809,9 @@ dev_config (struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 	unsigned		total;
 	u32			tag;
 	char			*kbuf;
+	if (strncmp(current->comm, "syzrepro0", 9) == 0) {
+		mdelay(60);
+	}
 
 	spin_lock_irq(&dev->lock);
 	if (dev->state > STATE_DEV_OPENED) {
diff --git a/fs/ioctl.c b/fs/ioctl.c
index 1c152c2b1b67..090d2d03d91e 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -11,6 +11,7 @@
 #include <linux/compat.h>
 #include <linux/file.h>
 #include <linux/fs.h>
+#include <linux/delay.h>
 #include <linux/security.h>
 #include <linux/export.h>
 #include <linux/uaccess.h>
@@ -48,6 +49,10 @@ static int vfs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	if (!filp->f_op->unlocked_ioctl)
 		goto out;
 
+	if (strncmp(current->comm, "syzrepro", 8) == 0) {
+		mdelay(5);
+	}
+
 	error = filp->f_op->unlocked_ioctl(filp, cmd, arg);
 	if (error == -ENOIOCTLCMD)
 		error = -ENOTTY;
@@ -588,6 +593,10 @@ SYSCALL_DEFINE3(ioctl, unsigned int, fd, unsigned int, cmd, unsigned long, arg)
 	if (fd_empty(f))
 		return -EBADF;
 
+	if (strncmp(current->comm, "syzrepro", 8) == 0) {
+		mdelay(5);
+	}
+
 	error = security_file_ioctl(fd_file(f), cmd, arg);
 	if (error)
 		return error;

==================================================================

C reproducer:
==================================================================
#define _GNU_SOURCE
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mount.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

/* tag(4) + full-speed config descriptor(9) + device descriptor(18) = 31 */
static const unsigned char cfg_blob[31] = {
	/* tag = 0 */
	0x00, 0x00, 0x00, 0x00,
	/* struct usb_config_descriptor */
	0x09,		/* bLength            = USB_DT_CONFIG_SIZE */
	0x02,		/* bDescriptorType    = USB_DT_CONFIG */
	0x09, 0x00,	/* wTotalLength       = 9 */
	0x01,		/* bNumInterfaces     = 1 */
	0x01,		/* bConfigurationValue= 1 (must be != 0) */
	0x00,		/* iConfiguration */
	0x80,		/* bmAttributes: ATT_ONE set, ATT_WAKEUP clear */
	0x01,		/* bMaxPower */
	/* struct usb_device_descriptor */
	0x12,		/* bLength            = USB_DT_DEVICE_SIZE */
	0x01,		/* bDescriptorType    = USB_DT_DEVICE */
	0x00, 0x02,	/* bcdUSB */
	0x00, 0x00, 0x00,
	0x40,		/* bMaxPacketSize0 */
	0x00, 0x00,	/* idVendor */
	0x00, 0x00,	/* idProduct */
	0x00, 0x00,	/* bcdDevice */
	0x00, 0x00, 0x00,
	0x01,		/* bNumConfigurations = 1 */
};

static int ep0fd = -1;
static volatile int t1_armed;
static volatile int go;

static void *thr_ioctl(void *arg)	/* syzrepro1: the victim */
{
	long r;

	(void)arg;
	prctl(PR_SET_NAME, "syzrepro1", 0, 0, 0);
	while (!go)
		sched_yield();

	t1_armed = 1;

	r = ioctl(ep0fd, 0x227c /* SG_GET_PACK_ID, value is irrelevant */, 0UL);
	printf("[T1] ioctl -> %ld (errno %d)\n", r, errno);
	fflush(stdout);
	return NULL;
}

static void *thr_write(void *arg)	/* syzrepro0: triggers gadgetfs_bind */
{
	ssize_t n;

	(void)arg;
	prctl(PR_SET_NAME, "syzrepro0", 0, 0, 0);
	while (!go)
		sched_yield();
	while (!t1_armed)
		sched_yield();
	usleep(2000);

	n = write(ep0fd, cfg_blob, sizeof(cfg_blob));
	printf("[T0] write -> %zd (errno %d)\n", n, errno);
	fflush(stdout);
	return NULL;
}

/* find the ep0 file: gadgetfs names it after the UDC (usually dummy_udc) */
static int find_chip(const char *dir, char *out, size_t outsz)
{
	DIR *d;
	struct dirent *e;
	int found = 0;

	d = opendir(dir);
	if (!d) {
		printf("[!] opendir(%s) failed errno=%d\n", dir, errno);
		return -1;
	}
	while ((e = readdir(d)) != NULL) {
		if (!strcmp(e->d_name, ".") || !strcmp(e->d_name, ".."))
			continue;
		snprintf(out, outsz, "%s", e->d_name);
		found = 1;
		if (!strcmp(e->d_name, "dummy_udc"))
			break;	/* preferred */
	}
	closedir(d);
	return found ? 0 : -1;
}

static const char *pick_dir(void)
{
	static const char *cands[] = { "/gadget", "/tmp/gadget", "./gadget",
				       "/root/gadget", NULL };
	int i;

	for (i = 0; cands[i]; i++) {
		if (mkdir(cands[i], 0777) == 0 || errno == EEXIST)
			return cands[i];
		printf("[!] mkdir(%s) failed errno=%d\n", cands[i], errno);
	}
	return NULL;
}

static int one_round(const char *dir, int iter)
{
	char chip[256], path[512];
	pthread_t t0, t1;
	int rc;

	if (mount(NULL, dir, "gadgetfs", 0, NULL) != 0) {
		printf("[%d] mount(gadgetfs) failed errno=%d\n", iter, errno);
		return -1;
	}
	if (find_chip(dir, chip, sizeof(chip)) != 0) {
		printf("[%d] no ep0 file under %s\n", iter, dir);
		umount2(dir, MNT_DETACH);
		return -1;
	}
	snprintf(path, sizeof(path), "%s/%s", dir, chip);

	ep0fd = open(path, O_RDWR);
	if (ep0fd < 0) {
		printf("[%d] open(%s) failed errno=%d\n", iter, path, errno);
		umount2(dir, MNT_DETACH);
		return -1;
	}
	printf("[%d] ep0=%s fd=%d -- racing\n", iter, path, ep0fd);
	fflush(stdout);

	t1_armed = 0;
	go = 0;
	rc = pthread_create(&t1, NULL, thr_ioctl, NULL);
	if (rc) {
		printf("[%d] pthread_create t1 rc=%d\n", iter, rc);
		close(ep0fd);
		umount2(dir, MNT_DETACH);
		return -1;
	}
	rc = pthread_create(&t0, NULL, thr_write, NULL);
	if (rc) {
		printf("[%d] pthread_create t0 rc=%d\n", iter, rc);
		go = 1;
		pthread_join(t1, NULL);
		close(ep0fd);
		umount2(dir, MNT_DETACH);
		return -1;
	}

	go = 1;
	pthread_join(t1, NULL);
	pthread_join(t0, NULL);

	close(ep0fd);
	ep0fd = -1;
	if (umount(dir) != 0) {
		printf("[%d] umount failed errno=%d, detaching\n", iter, errno);
		umount2(dir, MNT_DETACH);
	}
	return 0;
}

int main(int argc, char **argv)
{
	const char *dir;
	int iters = 20;
	int i;

	setvbuf(stdout, NULL, _IONBF, 0);

	/* argv: <marker> <iters> <nthreads> ; nthreads is fixed at 2 here */
	if (argc > 2) {
		int v = atoi(argv[2]);

		if (v > 0)
			iters = v;
	}
	if (argc > 1)
		printf("[*] marker=%s iters=%d (2 racing threads: "
		       "syzrepro0/syzrepro1)\n", argv[1], iters);

	dir = pick_dir();
	if (!dir) {
		printf("[!] no usable mount point\n");
		return 1;
	}
	printf("[*] mount point %s\n", dir);

	/* in case a previous run left it mounted */
	umount2(dir, MNT_DETACH);

	for (i = 0; i < iters; i++) {
		if (one_round(dir, i) != 0)
			usleep(100000);
	}
	printf("[*] done\n");
	return 0;
}
==================================================================

Crash log:
==================================================================
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000005: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
CPU: 3 UID: 0 PID: 401 Comm: syzrepro1 Not tainted 7.2.0-dirty #2 PREEMPT 
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:gadget_dev_ioctl+0xf0/0x240 drivers/usb/gadget/legacy/inode.c:1265
Code: 41 8b 06 49 c7 c6 e7 ff ff ff 83 c8 04 83 f8 05 0f 84 e7 00 00 00 89 6c 24 0c 4c 89 6c 24 10 49 8d 6f 28 49 89 ed 49 c1 ed 03 <43> 80 7c 25 00 00 74 08 48 89 ef e8 40 3c 79 fd 4c 8b 65 00 49 83
RSP: 0018:ffff88810a27fe58 EFLAGS: 00010006
RAX: 0000000000000006 RBX: ffff88810179e800 RCX: 0000000000000001
RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffff88810a27fe3c
RBP: 0000000000000028 R08: ffff88810a27fe3f R09: 1ffff1102144ffc7
R10: dffffc0000000000 R11: ffffed102144ffc8 R12: dffffc0000000000
R13: 0000000000000005 R14: ffffffffffffffe7 R15: 0000000000000000
FS:  000077fc4fcbd6c0(0000) GS:ffff88816488a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000077fc4fdaf010 CR3: 000000010c042000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 vfs_ioctl fs/ioctl.c:56 [inline]
 __do_sys_ioctl fs/ioctl.c:606 [inline]
 __se_sys_ioctl+0x173/0x1c0 fs/ioctl.c:588
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf7/0x370 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x77fc4fdbed6b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:000077fc4fcbce70 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000077fc4fcbd6c0 RCX: 000077fc4fdbed6b
RDX: 0000000000000000 RSI: 000000000000227c RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 00007ffcdf85dd27
R10: 0000000000000000 R11: 0000000000000246 R12: ffffffffffffff80
R13: 0000000000000016 R14: 00007ffcdf85dc30 R15: 000077fc4f4bd000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:gadget_dev_ioctl+0xf0/0x240 drivers/usb/gadget/legacy/inode.c:1265
Code: 41 8b 06 49 c7 c6 e7 ff ff ff 83 c8 04 83 f8 05 0f 84 e7 00 00 00 89 6c 24 0c 4c 89 6c 24 10 49 8d 6f 28 49 89 ed 49 c1 ed 03 <43> 80 7c 25 00 00 74 08 48 89 ef e8 40 3c 79 fd 4c 8b 65 00 49 83
RSP: 0018:ffff88810a27fe58 EFLAGS: 00010006
RAX: 0000000000000006 RBX: ffff88810179e800 RCX: 0000000000000001
RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffff88810a27fe3c
RBP: 0000000000000028 R08: ffff88810a27fe3f R09: 1ffff1102144ffc7
R10: dffffc0000000000 R11: ffffed102144ffc8 R12: dffffc0000000000
R13: 0000000000000005 R14: ffffffffffffffe7 R15: 0000000000000000
FS:  000077fc4fcbd6c0(0000) GS:ffff88816488a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000077fc4fdaf010 CR3: 000000010c042000 CR4: 00000000000006f0
----------------
Code disassembly (best guess):
   0:	41 8b 06             	mov    (%r14),%eax
   3:	49 c7 c6 e7 ff ff ff 	mov    $0xffffffffffffffe7,%r14
   a:	83 c8 04             	or     $0x4,%eax
   d:	83 f8 05             	cmp    $0x5,%eax
  10:	0f 84 e7 00 00 00    	je     0xfd
  16:	89 6c 24 0c          	mov    %ebp,0xc(%rsp)
  1a:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
  1f:	49 8d 6f 28          	lea    0x28(%r15),%rbp
  23:	49 89 ed             	mov    %rbp,%r13
  26:	49 c1 ed 03          	shr    $0x3,%r13
* 2a:	43 80 7c 25 00 00    	cmpb   $0x0,0x0(%r13,%r12,1) <-- trapping instruction
  30:	74 08                	je     0x3a
  32:	48 89 ef             	mov    %rbp,%rdi
  35:	e8 40 3c 79 fd       	callq  0xfd793c7a
  3a:	4c 8b 65 00          	mov    0x0(%rbp),%r12
  3e:	49                   	rex.WB
  3f:	83                   	.byte 0x83
==================================================================


