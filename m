Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612024;
	b=5FGmXAyQaRmKjPxQXVryyAJ8AQ68B6FApetcknl8qaOY9C8w1vtel9BRmh+uuakNP5H7
	 BfJ1Xlo31M5N7rQL1bLpFN22ctMyBTdQeTEjxEtsd2fNyW86Se2Pk7dSVVP2us35i38l3
	 Kwg+xWGuR2gqY926pQXXpLp5zBBuigixYotFZDvWn/C+aQKg/psPpbOQH/pfEBChvCXC8
	 a8BIpEUk/jBIqjegQu8716I65URqopw9/4j6CsJ67Ox6ZRroUB9JGz4iPv5joLuZEQaOk
	 ZE8lea5+jvolHkxJfXt0v4tdCxF3MdZBie5/ldV+5tu5Cx60u7ZE0vIVMNhXipa4VMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5qwQGFZu/GBky4fBvpJhiGHfv/hCV9S2GbqPIpPWblg=;
	b=utn6BvHscty2rXiA2cl6q6SpTh9JTkegxFBYP5X7rpe08NVZfqM8JNhVcUiB+NbPbk0i
	 Y3eQNRU6fYHj10d3yzMhZn0XWCYoRvBkTvWrUuIKwZ2nJ/Rogz0sO53SfPcdWPehYLab4
	 C3PooCFQXNWSGMwW8plEjlYTfb5Z13rkNtjSU7WbRxDq5+eQILSxbvYX9o3qr3Ye9r+nx
	 oqtSBNknlCEwHGf2PAtjHr4IKKACXMx/GtbwtVOkdRg5yqIuXmnWmosQEe/vmPx7/qoNl
	 e1biVMdc7EOT5RRkcT3MmooBxDcE7fCCh02/r7nZ/xHKkGCmgGlBchS/8PZldutD9wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NkMj87rJ;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD5B606A68B
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 13:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD5B606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NkMj87rJ
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3928056c88.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 05:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612023; x=1796216823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qwQGFZu/GBky4fBvpJhiGHfv/hCV9S2GbqPIpPWblg=;
        b=NkMj87rJ0CmCly8f6ufKEZ7lIt88ytlu9CGgLcwr+HV/JO/KhZrPZ/1fdeGlrfgXPE
         IzpEI3ySOQ6323fyQiWfwUo3vQO2AnDPqciRhtqHNGmluogw/6HrY280iGkh+rBldtKs
         aV2wg+XyhCtQxIJSb99iIkJGKKCxOHZy1USoCOgTOpaP2J3iXBa3U+B4CMltVJFeUxa0
         /qfdB7/sqIuspm2lgecIXSp8nH/Zfz5mgDq1yevVrdaTmefRqv5xyWnM5skj7Or7F1bZ
         r/XfNUyRdSWMuQVESyKV84K+tvd7odFDIckPdv9D3LsvnufumJJFQwiQNpcFRdgrotLt
         aDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612023; x=1796216823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qwQGFZu/GBky4fBvpJhiGHfv/hCV9S2GbqPIpPWblg=;
        b=uU2t3KKRcv9JsBoi/2jGEJYeMh0GsMM+kahfHXRmpiIVm0yII+lfiZnqloCYD1KXka
         qR27LWQBxT9SSvd9m/4lastthHp8ZwixFishy5Ga7idKKFLZD8gxU7+YX8Mc3OCddZt4
         CSTzO21h5f7eTLGztPH22lPN9vy7ZKfcidxA1U/DNyrq5eAK2eZSo1rAZn5RDwB8F5gm
         V/muiNe2jdOvhe2A4I7iAWo+3txmaKiKAWA9bYBstcBR7DGP/ScNV5kJdU58H14X6Z54
         GxAXJL4gxjOJq0CMr7nMaGAljgORhE6Z0DsBFNvqq4fVoBQuMI5OF1uD+Z5mzx1QMDfQ
         zDUw==
X-Gm-Message-State: APuU4Z8Fsdrt/2cl0HSm5pVLvzluwTBNG8xA4tAJNykqDqrfpz/nYuj/
	Bj+WnE4iGv/MgCTAv5kZGsSHpYNx59xQucn6bymJ2PtAc6didgZQ3p9RRB0Quvt8wA8EzoQBVsI
	=
X-Gm-Gg: AZFdTZf9l4CKUOUEqfsDuRN8QDcaE9BNNQXPcpI3x0ByLyh80Pm9LZRw4ZkYD9oB3JY
	nHo5EVKNPp18I4iDloqvCjbAs2stjW9xkonJXOzq2M51wGqB6q/Spv9KVk8LU/Js9HVhV0PAzFU
	RAfLr/77xlvOvTJbkYHw+Pup/ika/CypfbqnHVEoRYCteUy3vl0V9R75S96ZoZ8urK74xEkANLL
	WdO8qZdlge2fROdVM6X6Vd7KMIJUs8rMU/6NOMoGkqNa0PJJjv7+kcMZMCbWJmHCUDJ381YGRv3
	NIqG+YNAODegkBSwDb+AYLeBP/7kp4XvGPwlGwemwNwfl82qrTPJxK1fDG0PPZ1SjtW4RYJd0Oi
	MYaVZTxj36hpDXFRbK8R1RH8jHvxWZ6ZDpFnjPWxzT9ewtyZSWRbAPAMf6uoWtbIb5Muf9B0Rns
	uoazymeJZq0+CGVk/b6HkeYVyOPx3SQx3GUNHYjZfxuIeVv5+jqSVASje32z5oz83/kOSKh1NlE
	EL7iHJrA9pl38VI6bxuOGZ4fG9p6WRdWqynltcEoi6YZHtkddAPYg0DANGrjjwwdHS/hk+ymSpZ
	37BHfyh4KyhhGkOVefdHSSohGWopkR4tDPcykWUv9W4lcbAgkXB1fUNnsTZm540jS4te9CKouBf
	W1vYkHl/FO1nFtbl96AKN/fiR3ThtOelw8299t+Qrl1wHYxHQrtiWnl+QE/JJf0SGXihi7smHc3
	SJVOlJFEgoje3Er6Ibz1z1yD1bqXOwWIHqkbxWnzOb4Zk=
X-Received: by 2002:a05:7022:1583:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5568c0198mr19423248c88.25.1795612022737;
        Wed, 25 Nov 2026 05:07:02 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-47-129-125-69.ap-southeast-1.compute.amazonaws.com. [47.129.125.69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm31969855c88.4.2026.11.25.05.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:07:02 -0800 (PST)
From: Bin Luo <luob87709@gmail.com>
To: linux-usb@vger.kernel.org
Cc: andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: [BUG] thunderbolt: request work may outlive control channel teardown
Date: Wed, 25 Nov 2026 21:06:54 +0800
Message-ID: <20261125130654.1449-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261125130000.475-1-luob87709@gmail.com>
References: <20261125130000.475-1-luob87709@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Correction and a self-contained reproducer for my previous message: the
previous message listed files as attachments, but the mail did not include
those attachments. Sorry for the confusion. The test-only patch and exact
reproduction steps are included below; no local files are required.

Baseline: Linux v7.4-rc1,
`6628e7d4c6b25c8d18f1345e3a20d21829aae7e`.

Build an x86_64 KASAN kernel with the test hook:

```sh
git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux-tb-repro
cd linux-tb-repro
git checkout 6628e7d4c6b25c8d18f1345e3a20d21829aae7e
git apply thunderbolt_test_injection.patch
make ARCH=x86_64 x86_64_defconfig
scripts/config --enable USB4 --enable KASAN --enable KASAN_GENERIC
scripts/config --enable SERIAL_8250 --enable SERIAL_8250_CONSOLE
make ARCH=x86_64 olddefconfig
make -j"$(nproc)" ARCH=x86_64 bzImage
```

The test is a `late_initcall`, so it runs before userspace. No initramfs is
needed to trigger it. QEMU will later panic because this test boot has no
root filesystem; that expected panic is after the test result. Run both modes:

```sh
timeout 45s qemu-system-x86_64 -m 512M -smp 1 \
  -kernel arch/x86/boot/bzImage \
  -append "console=ttyS0 panic=-1 thunderbolt.test_request_uaf=1 thunderbolt.test_drop_ctl=1" \
  -nographic -no-reboot

timeout 45s qemu-system-x86_64 -m 512M -smp 1 \
  -kernel arch/x86/boot/bzImage \
  -append "console=ttyS0 panic=-1 thunderbolt.test_request_uaf=1 thunderbolt.test_drop_ctl=0" \
  -nographic -no-reboot
```

The injected run reports `BUG: KASAN: slab-use-after-free in mutex_lock()`
from `tb_cfg_request_dequeue()`. The control run reports no KASAN issue before
the expected no-root-filesystem panic.

The hook directly resets the request-list head, optionally frees `ctl`, and
calls the real `tb_cfg_request_work()` synchronously. It demonstrates the UAF
if that order occurs; it does not call `tb_ctl_stop()`/`tb_domain_remove()`,
use the system workqueue, send an XDomain packet, or prove a peer can trigger
host NHI removal.

Test-only injection patch (not a proposed production fix):

--- BEGIN TEST-ONLY PATCH ---
diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 965988b1860..000000000 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -9,5 +9,7 @@
 #include <linux/crc32.h>
 #include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/moduleparam.h>
 #include <linux/slab.h>
 #include <linux/pci.h>
 #include <linux/dmapool.h>
@@ -535,7 +537,63 @@ static void tb_cfg_request_work(struct work_struct *work)
 	tb_cfg_request_dequeue(req);
 }
 
+static bool tb_ctl_test_request_uaf;
+module_param_named(test_request_uaf, tb_ctl_test_request_uaf, bool, 0400);
+static bool tb_ctl_test_drop_ctl;
+module_param_named(test_drop_ctl, tb_ctl_test_drop_ctl, bool, 0400);
+
+static void tb_ctl_test_callback(void *data)
+{
+}
+
+static int __init tb_ctl_test_request_uaf_init(void)
+{
+	struct tb_ctl *ctl;
+	struct tb_cfg_request *req;
+	int ret;
+
+	if (!tb_ctl_test_request_uaf)
+		return 0;
+
+	ctl = kzalloc_obj(*ctl, GFP_KERNEL);
+	if (!ctl)
+		return -ENOMEM;
+
+	req = tb_cfg_request_alloc();
+	if (!req) {
+		kfree(ctl);
+		return -ENOMEM;
+	}
+
+	mutex_init(&ctl->request_queue_lock);
+	INIT_LIST_HEAD(&ctl->request_queue);
+	ctl->running = true;
+	req->callback = tb_ctl_test_callback;
+	INIT_WORK(&req->work, tb_cfg_request_work);
+	INIT_LIST_HEAD(&req->list);
+
+	ret = tb_cfg_request_enqueue(ctl, req);
+	if (ret) {
+		tb_cfg_request_put(req);
+		kfree(ctl);
+		return ret;
+	}
+
+	/* Model stop orphaning an active request before control-channel free. */
+	INIT_LIST_HEAD(&ctl->request_queue);
+	if (tb_ctl_test_drop_ctl)
+		kfree(ctl);
+
+	tb_cfg_request_work(&req->work);
+
+	if (!tb_ctl_test_drop_ctl)
+		kfree(ctl);
+	tb_cfg_request_put(req);
+	return 0;
+}
+late_initcall(tb_ctl_test_request_uaf_init);
+
 /**
  * tb_cfg_request() - Start control request not waiting for it to complete
  * @ctl: Control channel to use
--- END TEST-ONLY PATCH ---

Best,
Bin
