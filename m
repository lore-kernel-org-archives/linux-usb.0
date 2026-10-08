Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302FA3C7E1D
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791461183; cv=none; b=ZKCYDvEPUCgsP65mULmTpdh7UW0zzSYnUw7EcU7z3//jWM0+JpqhFF54BE4YprfA0JUUltO5ivdjqx5+E3reJHkQMzhXbLhQTm6xboYTB59pQ9ie67XMHGNwZFKWDPNhpoN77NDbYUdxT8fmn5GaQA4tHvJ7elDyGbWEzx2kfPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791461183; c=relaxed/simple;
	bh=qe2i7UaKKeFMqLT1+PmmU3Q03v+U3YczDOxJwzkMprk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qgownD0kGEfv9b20uYjdYNwXE7/PRiQWaF3n4/cgoygyGNmJnIi4f8wyea24j/K33BNk4PX8gHgSSceyBxxXy21w3EE30SlUMG26C+h0rFe0pKMlC/2aOeCLaVAp5LKMLvErGfd8Q+Ch1DXwoFJ/lIwemEXHyKVe6Rnkn2eOMws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ooD4KnGs; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ooD4KnGs"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so3230215a91.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 05:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791461182; x=1792065982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbaEe5GrjL+yS14DIWtAWidXzloj6k7U4c4aGDvLpYw=;
        b=ooD4KnGsuZ45rIqavna8k4dVdzHzc92Po5WbvehzyuTUU+H/Mhmarlp+6RPlKC57UF
         eE/WudtI9yo/rAksu6Pi/YzbQb8qAMYCbuJF40FtHBnlkrVMwxlim5a46ijNP02RsXKt
         jnwo4A1TPqShL4tw0mS++S/sXX08Kwvq2DfwMvO5Vzr5sx4ijfLsIn2XmQP8goyB2ueH
         XTkSahpapNIxcUuPEFuRkL1l1ADaRxfyGO20RCAmUNI+9M7coHztzTDmZ+30nEVXZqn4
         LRbDgfGk/LFt83KSfZdWU8TYBHfoBsn3CaVtp2B4/vXymjmOvds2vOjz2X3ir8WhkyvL
         TZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791461182; x=1792065982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbaEe5GrjL+yS14DIWtAWidXzloj6k7U4c4aGDvLpYw=;
        b=z3rKkEwHiiyExs+6fljmrQwnjXVIl5GEG7scB3RVdrw4zVW+R/xFVGknNBmKx5yvnv
         lo81gQVBSc6ACPehtjU/sX0AhPspRcMK+hPaZiAau4LUKIhjwqNTYry4WqC99jh64Yjf
         zc/j7WSU7VOV4VPmtU6vB5NbXxEU9Y7nXeyf7Knyev6uRrqmpCLP4xeubA5riP8HAYhJ
         FABm9HM4v5wooPdCccLdRLMrcqwXt6zNUQeONDib5fklnElp61zeWFDgffUJGC7pXlpF
         gWeLjaoa/tiYje1oQ/mBftmTd/JJ1eyiegv0oApN4Iqn3M82svx1WxgQv8CrKEdtds6T
         jP0A==
X-Forwarded-Encrypted: i=1; AKwUvBzsnnbs77hUKWlhJ3x4x0WpPAj84yCkWzJzqaENFAyI68fO20NWAKxxNVFOq2hvfpaekW02+2WmgNs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFOZVfo9dLpa3Zr76acp9TAImRMaFvhlZ7h32zylp8KipTkVP8
	GAu6xdePIJKYTOu4gcoUNmFjX6lZejp2cizA5HRi3jxn5ocNpyX3c5ZYFPfTn8uxV7xu1TzDOOU
	=
X-Gm-Gg: AYBFou27pwvkiOVio2Tt1/LO1WfWnPqytA/sjJkx8zvWIodMTMjVJJzEOpVoVqrdMuT
	S76zLoOSgPQyfy49R7piV22vDPry3pbqzWl4P06GLvJ6eEYtjOG3uTIObY6lY3mIB2yQS/Zshlw
	mB5oe3jCoiCA67QDFKe4dKjh1mRXYQr1imkuzAFwwIUvcf4ASCDE5lFaKipQBLSeOXAba0PO2dW
	RjaXhBs4n6x9d9nVBq8YCJg+Z2N9Ml8hQrew+V+rC9GtLMfWcA3S2983ytp97vpL+uYzII+QKK1
	JDVhl4wnq2+n/m2Xf1via8IOAHVjSLAJYVpHCUczSDI2qfUDhPGmeoOPPrwdec5e42s/u5oogDX
	6PfX5b1Kgc7NrWO2kcKHRJbTUXirJTLCixz2GSFriRZ5YbNKjkQ/Chs5YWIZmKfX7MY6fT95JDF
	x+mGmhew4SL32GArN6P/AEJbJzqyQ6pMWQQdytKNPyddxGSBrc1BBXk/6Uttex5HlgrT1P4g==
X-Received: by 2002:a17:90b:4cd0:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3a8a17f8db0mr5122045a91.15.1791461181262;
        Thu, 08 Oct 2026 05:06:21 -0700 (PDT)
Received: from UBUNTU2404.. ([154.83.84.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab0458bce8sm1163556a91.3.2026.10.08.05.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 05:06:20 -0700 (PDT)
From: Kun Luo <luokun485@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kun Luo <luokun485@gmail.com>
Subject: [PATCH] xhci: dbgtty: convert rx push tasklet to BH workqueue
Date: Thu,  8 Oct 2026 20:06:05 +0800
Message-ID: <20261008120605.174601-1-luokun485@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel is converting remaining tasklet users to BH workqueues so
softirq handling can go through the workqueue path. The dbc TTY rx
push path is a straightforward bottom-half: schedule from IRQ /
unthrottle, run the same work, kill on port teardown.

Replace the tasklet with system_bh_wq. Behavior stays in softirq
context, so existing locking is unchanged.

Compile-tested only.

Signed-off-by: Kun Luo <luokun485@gmail.com>
---
 drivers/usb/host/xhci-dbgcap.h |  2 +-
 drivers/usb/host/xhci-dbgtty.c | 17 +++++++++--------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 5b18efb2c1ea..78e9b5e674a3 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -127,7 +127,7 @@ struct dbc_port {
 	struct list_head		read_pool;
 	struct list_head		read_queue;
 	unsigned int			n_read;
-	struct tasklet_struct		push;
+	struct work_struct		push;
 
 	struct list_head		write_pool;
 	unsigned int			tx_boundary;
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 3d51e8d82659..c18215751d92 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -11,6 +11,7 @@
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <linux/idr.h>
+#include <linux/workqueue.h>
 
 #include "xhci.h"
 #include "xhci-dbgcap.h"
@@ -189,9 +190,9 @@ dbc_read_complete(struct xhci_dbc *dbc, struct dbc_request *req)
 		}
 	}
 
-	/* defer moving data from req to tty buffer to a tasklet */
+	/* defer moving data from req to tty buffer to BH workqueue */
 	list_add_tail(&req->list_pool, &port->read_queue);
-	tasklet_schedule(&port->push);
+	queue_work(system_bh_wq, &port->push);
 out:
 	spin_unlock_irqrestore(&port->port_lock, flags);
 }
@@ -384,7 +385,7 @@ static void dbc_tty_unthrottle(struct tty_struct *tty)
 	unsigned long		flags;
 
 	spin_lock_irqsave(&port->port_lock, flags);
-	tasklet_schedule(&port->push);
+	queue_work(system_bh_wq, &port->push);
 	spin_unlock_irqrestore(&port->port_lock, flags);
 }
 
@@ -400,13 +401,13 @@ static const struct tty_operations dbc_tty_ops = {
 	.unthrottle		= dbc_tty_unthrottle,
 };
 
-static void dbc_rx_push(struct tasklet_struct *t)
+static void dbc_rx_push(struct work_struct *work)
 {
 	struct dbc_request	*req;
 	struct tty_struct	*tty;
 	unsigned long		flags;
 	bool			disconnect = false;
-	struct dbc_port		*port = from_tasklet(port, t, push);
+	struct dbc_port		*port = from_work(port, work, push);
 	struct list_head	*queue = &port->read_queue;
 	int			untransferred;
 
@@ -438,7 +439,7 @@ static void dbc_rx_push(struct tasklet_struct *t)
 	}
 
 	if (!list_empty(queue))
-		tasklet_schedule(&port->push);
+		queue_work(system_bh_wq, &port->push);
 
 	if (!disconnect)
 		dbc_start_rx(port);
@@ -467,7 +468,7 @@ xhci_dbc_tty_init_port(struct xhci_dbc *dbc, struct dbc_port *port)
 {
 	tty_port_init(&port->port);
 	spin_lock_init(&port->port_lock);
-	tasklet_setup(&port->push, dbc_rx_push);
+	INIT_WORK(&port->push, dbc_rx_push);
 	INIT_LIST_HEAD(&port->read_pool);
 	INIT_LIST_HEAD(&port->read_queue);
 	INIT_LIST_HEAD(&port->write_pool);
@@ -479,7 +480,7 @@ xhci_dbc_tty_init_port(struct xhci_dbc *dbc, struct dbc_port *port)
 static void
 xhci_dbc_tty_exit_port(struct dbc_port *port)
 {
-	tasklet_kill(&port->push);
+	cancel_work_sync(&port->push);
 	tty_port_destroy(&port->port);
 }
 
-- 
2.54.0

