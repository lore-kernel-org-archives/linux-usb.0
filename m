Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D4736A366;
	Tue, 30 Jun 2026 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804972; cv=none; b=HpN+xp0v+YXo1vfOKlHaE2+0cuZrY38ggBTS4KvwSM3lmcUYwUBzxNhrteaR7Q95LZcqUo3S0A9Dx6gMFhDzXT7a8WqoS3P1KJyCqE3N8W0JvC8+NzJ4sYGKIDV5+CzUCesOa1EehURgvQTRUUUYqt2vuRaF0Rl+kJdB7QT2vwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804972; c=relaxed/simple;
	bh=iQoNK//jY6X5gt7W3pdpRbFqYiA8XpYm0pkElMFCzsE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mEJb7fN9QEQgEHaAMYxsTqT+ptXQVcGs3NmLPer7iOoXp9RmdWBYi30nLNJwO8HLkdq9VtTQ/sHbJ23Gua7O/p9JERcQMJvVogqVnVFxj0uF5scQ+1wLrqMFPFDEz8chxDrPoVw1WpIF+P7qVqVcCwrIaNjm5z3qH5NWCTvyqu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 59cfa7d0745611f1aa26b74ffac11d73-20260630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:4d9f0308-7913-4935-8fe3-254f3d4bd7b6,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:8edf4c7b399541a2cb1579196e3ffc84,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 59cfa7d0745611f1aa26b74ffac11d73-20260630
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 454408629; Tue, 30 Jun 2026 15:36:04 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu
Cc: dengjie03@kylinos.cn,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] usb: xhci: prevent spurious root hub resume during suspend
Date: Tue, 30 Jun 2026 15:36:00 +0800
Message-Id: <368829d76a12e371e09f203e14b5c80b6515c025.1782804779.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

handle_port_status() unconditionally resumes the root hub when
hcd->state is HC_STATE_SUSPENDED, regardless of whether a device is
actually attached to the port.  This can cause system suspend to fail
with -EBUSY if a spurious port change event arrives on an empty port
after its bus has entered suspend.

Fix this by checking PORT_CONNECT in handle_port_status() before
resuming the root hub.  If no device is actually present on the port,
the event is spurious and should be silently ignored rather than
aborting suspend.

Logs:
handle_port_status:1700: xhci_hcd 0000:04:00.0: Port change event, 3-2, id 6, portsc: 0x202a0
handle_port_status:1706: xhci_hcd 0000:04:00.0: resume root hub
handle_port_status:1821: xhci_hcd 0000:04:00.0: handle_port_status: starting port polling.
PM: pci_pm_suspend(): hcd_pci_suspend+0x0/0x38 returns -16
xhci_suspend:1017: xhci_hcd 0000:03:00.0: xhci_suspend: stopping port polling.
PM: dpm_run_callback(): pci_pm_suspend+0x0/0x190 returns -16

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/usb/host/xhci-ring.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4f98d8269625..3bfe49e788ed 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2042,8 +2042,13 @@ static void handle_port_status(struct xhci_hcd *xhci, union xhci_trb *event)
 	trace_xhci_handle_port_status(port, portsc);
 
 	if (hcd->state == HC_STATE_SUSPENDED) {
-		xhci_dbg(xhci, "resume root hub\n");
-		usb_hcd_resume_root_hub(hcd);
+		if (portsc & PORT_CONNECT) {
+			xhci_dbg(xhci, "resume root hub\n");
+			usb_hcd_resume_root_hub(hcd);
+		} else {
+			xhci_dbg(xhci, "spurious port change on empty port %d-%d, ignored\n",
+				 hcd->self.busnum, hcd_portnum + 1);
+		}
 	}
 
 	if (vdev && (portsc & PORT_PLS_MASK) == XDEV_INACTIVE) {
-- 
2.25.1

