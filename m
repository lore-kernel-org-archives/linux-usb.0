Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C926377ED9
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 03:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380893; cv=none; b=ojHjkGY7rZxfsaMpVfIcBZPywngR7ULOiHUe0BGbWlEW8YlImfTp7DjdV3tW2eJAqe7nnvf7cMX16HmcNogbcaMeRRZ1wvMd2ww0rDBnSch9O5TOkg7YTH1n32AYSX01MT4RtT35EFCP33quYVXozXxsNMgIOx96KYkMsYYzSZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380893; c=relaxed/simple;
	bh=4Yjmn2WOkVpLe8VYEyQISbvZgK8n3WDI2qsSfL34KBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TUVgDA+ZnUgwg7nCrgI74Z7eliGtcInM0qB6dKJBQEkhunKiMINDXUEHQxBEo7LY4LrsY/CKoGooBop9QCTHmYmP/NKEbhGSXoC0pzVXejEEhIa5zryIjrKVSnYsSJgV7ctCm4B0frAALNLTMVm8Etd+oLiIBCZ8BZR/1/J3KDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjghTI/V; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjghTI/V"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso412691a12.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 20:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792380892; x=1792985692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDpleH9Ke2Y1+8VcMmyF2Ssvoq0mqvQ/mLFZpD9YEIk=;
        b=ZjghTI/VEzIkyay/IEWQu0fUouUfkuU6Y40nhiYDE61F4V+ezSw6GSSL/96VhzmX7f
         8tbwgWytgPKRt1U0zljpJTBx9j9R1HLLJP130mUxJ4xe1iv18dPf2Je0+rtDJxhUZNqg
         ssDFAo4KXlG+5pSnvGgKi2BB25hrmlosbizDgpE9ykXNS6NFOHkS5BVk3mxjXp4OPKL4
         4kd1BT5T02QdvWd5fW2E7bHNaOPqoU6lRh5edC1x7UPdQkSEdDgw5zhG/YIVaf4rO/MK
         DeUKt0nL44qVCPqHbA89d1ldYwaOwTzdzZIrLcbyH1mljPNGjc6k9qDpGmPoCGLxHfu5
         hMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792380892; x=1792985692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDpleH9Ke2Y1+8VcMmyF2Ssvoq0mqvQ/mLFZpD9YEIk=;
        b=uN1FQJAJXOqa5A2M8gqxmW5Ox3M7ARYByy17K2WcRdhGwYz50BJrE3OrrBAl2C15f5
         DewafiC9fl+pnYinbm9ksd0G2lbs7IwWgcpGa9xruYfGGmSMNwPOJQvsGsWeX80LHqHU
         ZKCNQZDaE87ge1r+wlLZDF7Ik2TNrOzn7yQWjT9Jc/HX8dHUYMrhARCZxJlZCmqYZgXo
         PL+Gw+SiJCO8TYsbmDKpxLlL9oEM5OZoJgkq0nrA3t52dpHBaqr2Xrl1BuZ7kG10lcge
         mqtG/FClnzKt3UziVEJeaXyO29uUub2io2ulPQ93EG75XCsvClJZ4DU6AjGlvKtAaP1h
         qq4A==
X-Gm-Message-State: AFq9FYL2BpEl7QGMxVH005s4ZmXvwQSuE2Wbyzms6ThLrZXIN4Tpp7jS
	yUhanUEhgym4+K65FD/PQSDcpKdsL7+X6i2QxUkHuvYgyNELE2w6T9sq
X-Gm-Gg: AYBFou3Pq/cV7cLYd6FgAIhLL4Tlfh8zJiDXTBS9qoX8n2at0TLv5nvVdprQLGNvYjl
	6xWG4xv7M/f0ZXMTIim+fO84e8LrcLBvx6HjM/IhHyVJV5EXym0hSMFWzqV0D7IBBw7ErmKnPvw
	Xpa9NytsPS5liAVgId3IOg+oA+TfrDFn1gm3e2EnfIaNNaygF7HhtKDE5TKybaXX2VNbzFFqAca
	YrTeNSRnefjpFaV9NvRfcjhUlLaT5+Ida0EmFRm7gSLlNYjKRBMkLQ1fd4O1ysT6gfOMJkHJ2wC
	tCSVJ89O3Q4WlyTYBrd+hSktgAnmoW/8m6yNF7CbYe1MzTDdmeuOpo0nh6H1I3owvJiJU1f1YYX
	dikVBoITP3p738dQ+kPJn2mD31NvijMADKNhj3C6qiNOTku7lfGtJ137Hyga1E1c5hfsmJDryHd
	UnoAK/tq9c6v3/l90azPg1Z5zOUN/lnL+oGyp+m0hWObdS5leZiZko6+pLExnMfqQnF/0gd3mVz
	6QO556gTxKXto/1TvbGklFGx2R+Uh429x5gKUelvGkg89mISoqiwZBERS6h2HCnO4GfxveN+7ws
	rQIUa1u43pMfMGAmaoDVcQbfLLvTbJMIRUcirlP75ruLJ1Le
X-Received: by 2002:a17:90b:2ec3:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3acef134d96mr5136229a91.23.1792380891798;
        Sun, 18 Oct 2026 20:34:51 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd05c9255sm7373900a91.2.2026.10.18.20.34.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 20:34:51 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] usb: gadget: u_serial: use-after-free of gserial in gs_write()/gs_flush_chars() remote-wakeup path
Date: Mon, 19 Oct 2026 13:34:46 +1000
Message-ID: <20261019033446.73554-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

gs_write() and gs_flush_chars() cache

	struct gserial *gser = port->port_usb;

at function entry, before taking port->port_lock. In the
"if (port->suspended)" branch they drop port_lock and call
gserial_wakeup_host(gser) on that cached pointer, with no re-check of
port->port_usb -- unlike the sibling gs_start_tx() path in the very same
functions, which is guarded by "if (port->port_usb)" after re-acquiring
the lock.

gserial_wakeup_host() dereferences gser->func.config->cdev->gadget. A
concurrent gserial_disconnect() clears port->port_usb (under port_lock),
and the following unbind / function teardown frees the enclosing
struct f_acm / struct f_gser (which embeds the gserial) via ->free_func.
The cached gser is then used after free:

  BUG: KASAN: slab-use-after-free in gs_write+0x120/0x240
  Read of size 8 at addr ffff888006c5d430 by task ...
   gs_write+0x120/0x240
   n_tty_write+0x355/0xc30
   file_tty_write.isra.0+...
   vfs_write+...
   ksys_write+...
  Allocated by task ...:
   acm_alloc_func+0x34/0x1f0
   config_usb_cfg_link+0x15c/0x220
   configfs_symlink+...
  Freed by task ...:
   kfree+...
   acm_free_func+0x29/0x60
   config_usb_cfg_unlink+0x1a9/0x240
   configfs_unlink+...
   __x64_sys_unlink+0x34/0x50

gs_flush_chars() has the identical shape.

== Reproduction ==

acm gadget on dummy_hcd (CONFIG_USB_DUMMY_HCD, CONFIG_USB_U_SERIAL,
CONFIG_USB_CONFIGFS_ACM), KASAN. Put the bus into suspend so
port->suspended is set: write "auto" to the gadget's host-side
.../power/control with autosuspend_delay_ms=0, which makes dummy_hcd
suspend the port and run the gadget ->suspend / gserial_suspend. Then:

  - task A: write to /dev/ttyGS0  (enters the gs_write() suspended branch)
  - task B: echo "" > g1/UDC ; rm g1/configs/c.1/acm.0 ; rmdir g1/functions/acm.0
            (unbind + drop the acm function -> frees the gserial)

The gserial_wakeup_host(gser) call in task A then touches freed memory.
(I widened the window after the port_lock drop with a debug mdelay to make
it deterministic; without it this is a narrow race.)

The sibling gs_start_tx() call in the same two functions is guarded with
"if (port->port_usb)" after re-acquiring port_lock; the suspended/wakeup
branch dereferences the pre-lock cached gser with no equivalent check.
