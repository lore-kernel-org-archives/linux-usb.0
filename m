Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D045552932
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653245; cv=none; b=trZctneUDBWxeJgV/zE9K12jN6DF8O34NXQkrhb60sZ6kPy8aVBuk/oUC3fX5GuBPTsm0RhBq+SoaD8IomM+I4FE12YgHB05OIw3pA4n2hehJuzI21VOfU6XdHS/7gAPcga3xpU6Xer0tisphU8TK/F3EjJs+6len6KKLpQHv6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653245; c=relaxed/simple;
	bh=GVAbVs1ko/DCvmd45vSlohdLGyXD4c4o5mSOdN+8aQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ejnQr9+3NUQz/TeQvJAeXvZceoW7CkodvqKa80bUaypS2WJ1ihUoGPonTSupL4SqSu29D1RFCHHse67TBbsKOiGbfg1e5jPWSCiIiZza0eXSdzomqNVmL9DdQIqy4SdKsDFc+70X1RCEMlyTAOHMdLtaApej/JFf7tILqu/UBl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUWP2Et4; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUWP2Et4"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so612034a91.3
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789653225; x=1790258025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QM/bFkqvQv3qHi5Zy8hlal9hiWJ8KUyMb1Ia/K3+NuU=;
        b=LUWP2Et4I1E5Gm7V//Ehf3d/mxFgtKygnQGAfjS6p1xppqcDAZ3QWWZQzyMv4AnLjA
         JImXw0qserROQneJyW54TVa+47P+DKBGt2QUslegbMrcCAdo/62k9EyZHQzW/YRLCT95
         ZnrMlHPe61KOtPl4Fv5sZdRZffoEMil+P8H9j+G7wF69oTaBqnyYtZGy/pCLmIYFCDcs
         Drf63WeWcsbkfkEkpZ8udiLfHeKbDl4wx9rwDt/ikgd5Tl+i7cILz6EN5weUaVyrWwNn
         FJUmh9SpLipV2iKh3hYiMrXiMcKcb9EHDJ3CoyANVs/h/DFKc/sVZ4s+TE9NMDloXU7z
         93Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653225; x=1790258025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QM/bFkqvQv3qHi5Zy8hlal9hiWJ8KUyMb1Ia/K3+NuU=;
        b=CjbhpOhq67AVJ+24shyKDycPpBGkiNJn9OOPu+rs2UmylvFwEiha8Q4JVjqFiPc2K/
         MOeYZKi5cbVMmF90F0tKSCklTntHbzvemtsfOjvrWGbYDigPFnoFl2BIHriJ9fMROKhp
         Ld8+P5YiBXWD5P20mX8qAYEhColh2aEjB0+FR3lytk7iDrqyCbF5gSUeCKUWRzonNdyM
         XkSlZSybwwhq1Rvt/3pE7Jns6aM1D4JirxKz+hTu0sHgFtSvbyyrHT+6Ucf1RDT2mYGu
         1HSEjKVOLRPq85ZR6LBJW1dhYOeKMGL3uSaSJu5gs13u0lcUfyVHJyMq3JHNLmPNhx4a
         I7zQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvO63+7KVZgRl7U9nCGm1RTaSGd5Q59NEG/rgpi/pLRxpOwo1K4pfLNFZFifKZOe+2mDdF6QT2ulU=@vger.kernel.org
X-Gm-Message-State: AFuF++ky7s2cArTPXuDfjJI8efUMvm6CQFBPCzXZypgakFL7gaoWGUcP
	VoeOBNo4CHzPHMFtCYs46Qa7jCQwLyyzpiTEzn6H6UMNZh5v+1BOQcmY
X-Gm-Gg: AYBFou1NJuDykptn7X5bquq1PtDj5iC97qWYMP2TQV7loFnmVnZf9aG5XnJbs0UuH8Q
	BvyzD1VXPOvZFS7EpOFbn7thpXE7uWEvZMoQIQ/iGLV/RK752r2XVv2LoV/M8cKmPWWx7RobFGL
	H2Z4aIe2vuoBLbPHRQ65QMTFHq/Xj6tKDambi+oWSdfxEEEntdmZQ2QU+9jgHUMj4crRzL5a1CK
	z7r173bn35Aiuy9E5M0mbO5PEQVk9L7nwzD0r3f8KjsftG9iGRc9ka4qwf469QbiLU4Ifhn/+Lw
	lRiJIy9J7SctAnhHNIN1v4lBKDhMYL3oZuSUmJLOgvBQTm9bCHg28Rf5P1s7MrMiLRxN9025Ll5
	+QvOcB8myWK5yW60ZhlIdpvQkfLuG7QfJH3TLKr+fwWNDHvHUmhIoiwi43nuHSfZ+E2jeHOvf3Y
	7dfwAtKHWe8p+HoGd+3jtigY+YaMiRK7QxfQ2cFaOj+b15zWcGTnzrIWHIemgXfk8RkI0Z6SZ0e
	seFO/IR+zDkNS2NQA3O1lHORUK3WrWp/w==
X-Received: by 2002:a17:90b:1c87:b0:39e:261:4e12 with SMTP id 98e67ed59e1d1-39e1e51d7dfmr15166649a91.23.1789653224957;
        Thu, 17 Sep 2026 06:53:44 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:2428:17da:9062:91b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360ddfc2sm5303334a91.16.2026.09.17.06.53.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 06:53:44 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Nazarewicz <mina86@mina86.com>,
	Robert Baldyga <r.baldyga@samsung.com>,
	Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zjamg <ndaugoing@gmail.com>
Subject: [PATCH 0/1] usb: gadget: f_fs: fix NULL pointer dereference in FUNCTIONFS_ENDPOINT_DESC
Date: Thu, 17 Sep 2026 21:53:36 +0800
Message-ID: <20260917135337.65444-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch addresses a kernel NULL pointer dereference panic in
FunctionFS when calling the FUNCTIONFS_ENDPOINT_DESC ioctl.

In FunctionFS, user space can legitimately supply only a subset of
speed descriptors (e.g., only full-speed descriptors via
FUNCTIONFS_HAS_FS_DESC). When the USB gadget is subsequently connected
to a high-speed or super-speed host:
1. composite.c:config_ep_by_speed() detects that the function lacks
   descriptors for the current speed and gracefully falls back to
   full-speed descriptors (f->fs_descriptors).
2. The endpoint is enabled via usb_ep_enable(), and epfile->ep becomes
   valid.
3. However, when user space calls ioctl(fd, FUNCTIONFS_ENDPOINT_DESC),
   ffs_epfile_ioctl() selects the descriptor index solely based on
   epfile->ffs->gadget->speed (desc_idx = 1 for HIGH, 2 for
   SUPER/SUPER_PLUS).
4. Because user space only supplied full-speed descriptors,
   epfile->ep->descs[desc_idx] is NULL.
5. The subsequent memcpy(&desc1, desc, desc->bLength) immediately
   dereferences the NULL pointer, causing an instant kernel crash:

[    2.154836] Call trace:
[    2.154836]  ffs_epfile_ioctl+0xe14/0x2c40 [usb_f_fs] (P)
[    2.155003]  __arm64_sys_ioctl+0x128/0x1a4
[    2.155298]  invoke_syscall.constprop.0+0x64/0x260
[    2.155374]  el0_svc_common.constprop.0+0xa0/0x240
[    2.155441]  do_el0_svc+0x3c/0x60
[    2.155494]  el0_svc+0x38/0x98
[    2.155547]  el0t_64_sync_handler+0xa0/0xe4
[    2.155606]  el0t_64_sync+0x198/0x19c
[    2.156463] Kernel panic - not syncing: Oops: Fatal exception

The fix restores the speed fallback loop mirroring config_ep_by_speed()
and historical f_fs behavior, defensively checks epfile->ep->ep->desc
as a fallback, and returns -EINVAL safely if no valid descriptor is
found.

Testing with QEMU ARM64 using dummy_hcd confirms that after applying
this patch, the ioctl succeeds and returns the fallback descriptor
cleanly without any crash.

zjamg (1):
  usb: gadget: f_fs: Fix NULL pointer dereference in
    FUNCTIONFS_ENDPOINT_DESC

 drivers/usb/gadget/function/f_fs.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

-- 
2.53.0
