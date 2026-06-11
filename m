Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CCB32BF4B
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 07:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161928; cv=none; b=ZsBlo+TUPD1R+I8Cl67aM+vU2uqGLw3q73RpZKIjalYUqAwENw7gvlAREAlcKqg2Mshm4g920bF56I6qQ0nbCOA1P5oCZJ3/dIa0HpXHNFDMna14CJUgPJk+lCjH8qXGbYc1sVQT8aExgsdik8n6iA9Q9BoIQ4fHVr3ruSf8O24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161928; c=relaxed/simple;
	bh=7C2ad+tb1T0eon2FFMXXZmEqZKE7Kl6yc9GsOuTL7fE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=bglvb9pnuGNTn/dq97TjdVAJg0zKhkKxaJ/kJ9qJU4tWd8S9M7pqsTs4os6DN4seUSGu2CML251wdlZZ/c33l7UkQAfg6cbZMYGnQ5UD8AZ7pg/KfhjebQlh+I6s2ZA0Ch5scVoZwsEcSlPheKRufHakqTJT6IouFHsdTLTrem4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfD3Bfv7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfD3Bfv7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf1cda2b17so4956985ad.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 00:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781161926; x=1781766726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uUU/QU1yaItwDS+kNcxyupb4Easf6rpr6RO5iKvKvLg=;
        b=ZfD3Bfv71FSHcS/jCbcF6LoBf2hy+X0N8+djDq6m53W/zZ/zxCli2FYttLLXOMAxnh
         i9u1qjWX7CZRDsCU8EVeI5llmA1FPoY4sBTnx5nD9pNUCXH6g0htJwvtBaFe1Q2giORq
         iXl9zMRA4A20SBuEx4+UliLwMl3E/uAslluW9COIUET46Ek2yUhoBzh2fciZhGg9RGNc
         NhXaIGb2X0z7FYLf/Qb0P7mesTwPe2mSzHu9+oCDr/yX+xq416JutLvJpL5WcZb7IMMo
         5RldOWVgkf2fRJIes6XaSXNrjq9DOjKLd4rjog34krPeqqOadZPkj5bFqNT78O3BbVeN
         NqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781161926; x=1781766726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUU/QU1yaItwDS+kNcxyupb4Easf6rpr6RO5iKvKvLg=;
        b=Se8tej8juloWWSG1rq2AF6Q/8bSgdQKsWLYjAcgRoeLoadt1Fifif3kL2B9EP6QrM6
         tQbVjdMf+xehzJvMCJfISJNE6CrM204CFUZTAdG3P7pxwbS7yjUI1IBPJ2K8d9uC6phV
         G6IAWl1RQvjSJB6pktHAq3OS2UPawNOGDMLau6zDTQYXfjjjug81Un6osNK0CK/PcYsY
         1iVXp92sSRW6RMYXbpDCELTe+u97nmALasPE9gQPuGW2CX2dRBMiPLlMtDiaTbzyV8IX
         D2CAIQc+lJjQYc2Xxk9loiIv1h9r8WjMih7R6LVB7a+bcfDXH3oJU6jddKe+xXNzq1tu
         Gb3g==
X-Forwarded-Encrypted: i=1; AFNElJ8SII3gURjlvT+fx3+3hT5f2XU8LqULyMtE7jsZO0eUNJBVv3WyJvu4IBNZSRFZe6xMPqGGgn+RJw0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz9qoq9EZl1aY88d2fVH617mAf4bEa+zNMhMqVzgDFBmeo6Q/z
	HkoK0zUInFR2hxZUocF8OWDkO6I5kz357NGcUIWsIXEiXnfJn/nZoTPp
X-Gm-Gg: Acq92OGh/aQYM9lDrM0WsBLFRJRsoYYl9dpIhP5bMrp8gEomhIMlbdNYvcoN/18ijDe
	D4DrwWCpn4DWqbrG/wHTG2dMO7+wcRiPluNEj8fMZY4ZJT2lk3OA/w/UAlMnmGdt3st8z1tgGHw
	pApD5XZM73U+X67MskesX4v/WjWg+NorCA9G9HePJXTZkxSgNtMFnL91kgTAQSig6n9DzJWlnpB
	zSVifYz1HiYCx8VsN9ALzCzqoDoyBxs2GTC9LLQGp+Fgqf21/k+XHiBjJBtSTs41eUK+EU45dPV
	8L7CSGvWKWMeq3AGMnFsxH2LjjliYOi8IYnwNtOI8GS32qmrfWVZJiD8xqDoGABDkZ77BdlqN+/
	a2HDYlWya9bqKTl63vCxQJQgTizJGYnQNAeWzzGmUQVVlglLKz25X2q4bAu+PrLWuLhNDxdAIV6
	gu7IFdAmHUfBcqRhsb2kq2qBEeNxRV/oVPJ4vkve9waFYj/B6ndVe1BFVM2so4cfQ=
X-Received: by 2002:a17:903:1a06:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c2f1ad41e7mr13538765ad.23.1781161926404;
        Thu, 11 Jun 2026 00:12:06 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df6esm291655925ad.48.2026.06.11.00.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 00:12:05 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>,
	Sean Rhodes <sean@starlabs.systems>,
	Kees Cook <kees@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: core: port: Deattach Type-C connector on component unbind
Date: Thu, 11 Jun 2026 15:12:01 +0800
Message-ID: <20260611071201.1235545-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

connector_unbind() is the mirror of connector_bind(), but it is missing
the symmetric call to typec_deattach() that connector_bind() makes via:

    if (port_dev->child)
        typec_attach(port_dev->connector, &port_dev->child->dev);

When a Thunderbolt dock is unplugged, two teardown paths race:

1. The component framework calls connector_unbind() first, which sets
   port_dev->connector = NULL without calling typec_deattach().  This
   leaves port->usb2_dev/port->usb3_dev in struct typec_port pointing at
   the USB device that is about to be freed.

2. usb_disconnect() then calls typec_deattach(port_dev->connector, ...),
   but port_dev->connector is already NULL, so the call is a no-op and
   port->usb2_dev is never cleared.

3. Concurrently, UCSI detects a PD partner-disconnect event and calls
   typec_unregister_partner(), which reads port->usb2_dev (now a dangling
   pointer to freed memory) and passes it to typec_partner_unlink_device()
   -> sysfs_remove_link() -> dev_name() on the freed device, corrupting
   the typec/UCSI partner state.

This corruption leaves the Thunderbolt tunnel in an inconsistent state on
the next dock hot-plug.  On affected hardware the dock's I225/igc NIC fails
to enumerate: AER fires a slot reset while the igc driver is still
initialising ("PCIe link lost"), and the subsequent igc_reset attempt hits
igc_rd32 on an already-detached device:

    igc 0000:2e:00.0 eth0: PCIe link lost, device now detached
    igc: Failed to read reg 0x0!
    WARNING: CPU: 9 PID: 129 at drivers/net/ethernet/intel/igc/igc_main.c:7005
             igc_rd32+0xa4/0xc0 [igc]
    Call Trace:
     igc_disable_pcie_master+0x16/0xa0 [igc]
     igc_reset_hw_base+0x14/0x170 [igc]
     igc_reset+0x63/0x110 [igc]
     igc_io_slot_reset+0x9e/0xd0 [igc]
     report_slot_reset+0x5d/0xc0
     pcie_do_recovery+0x209/0x400
     aer_isr_one_error_type+0x235/0x430
     aer_isr+0x4e/0x80
     irq_thread+0xf4/0x1f0

4. UCSI later handles the PD partner-disconnect and calls
   typec_unregister_partner(), which still sees the stale port->usb2_dev
   and tries to remove its sysfs link a second time:

   kernfs: can not remove 'typec', no directory
   WARNING: CPU: 6 PID: 55 at fs/kernfs/dir.c:1706 kernfs_remove_by_name_ns+0xe9/0xf0
   Workqueue: events ucsi_handle_connector_change [typec_ucsi]
   Call Trace:
    sysfs_remove_link+0x19/0x50
    typec_unregister_partner+0x6e/0x120 [typec]
    ucsi_unregister_partner+0x107/0x150 [typec_ucsi]
    ucsi_handle_connector_change+0x3ec/0x490 [typec_ucsi]
    process_one_work+0x18e/0x3e0
    worker_thread+0x2e3/0x420
    kthread+0x10a/0x230
    ret_from_fork+0x121/0x140
    ret_from_fork_asm+0x1a/0x30

   With worse timing the same stale pointer is dereferenced after the
   backing memory is freed, turning the warning into a use-after-free.

Fix the asymmetry: call typec_deattach() before clearing
port_dev->connector, matching what connector_bind() does on the bind side.
typec_partner_deattach() is already protected by port->partner_link_lock,
so it serialises safely with the concurrent typec_unregister_partner() path.

Fixes: 11110783f5ea ("usb: Inform the USB Type-C class about enumerated devices")
Cc: stable@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/usb/core/port.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384ce..b4452b665f591 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -740,6 +740,8 @@ static void connector_unbind(struct device *dev, struct device *connector, void
 
 	sysfs_remove_link(&connector->kobj, dev_name(dev));
 	sysfs_remove_link(&dev->kobj, "connector");
+	if (port_dev->child)
+		typec_deattach(port_dev->connector, &port_dev->child->dev);
 	port_dev->connector = NULL;
 }
 
-- 
2.53.0

