Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [207.226.244.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909F32D1911;
	Tue, 27 Jan 2026 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.226.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769511961; cv=none; b=W0/8dPquqq6P1x2aJfVH2QtNdmwhIlhe/tyIiIIEUMLYIQ8KE06NlGrIoWZP1rNWGk2+77GwZ3o3iTi/PyYNbvabK2nR1MzeYOfxrOhttOwNhxF8cJb3k6Hm4Rw12HL1rPUxmCK2ZXUSoYcWEMyC0GkOqTEmXr4s8FaPqkhiHYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769511961; c=relaxed/simple;
	bh=dIAZVxzelLrKyTtspxoFthnzQkzr2lcgvVWFc1WYnzg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mv+hsE39MWNWK6ttFtZL8JYfMrZS9S+InCCI+O6JNO41WSXuk1LG4SfNDyC+hM5Ylar9E6H6l3jYV6G/IrUZ9ofmVvKxa/8mFjekGSejooXsgSXNfbXYHBFT8+19iVVRi8G+62vYG5jyk7afl/ibYIGqjLVG9hRy6k+5wusuSqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=207.226.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: CSVXKOgJQJeKX/hJJ/P8Ew==
X-CSE-MsgGUID: 2PYb3BNPQRGUKU3R5kuYAw==
X-IronPort-AV: E=Sophos;i="6.21,257,1763395200"; 
   d="scan'208";a="165448361"
From: jiangdayu <jiangdayu@xiaomi.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Longfang Liu <liulongfang@huawei.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, yudongbin <yudongbin@xiaomi.com>, guhuinan
	<guhuinan@xiaomi.com>, chenyu45 <chenyu45@xiaomi.com>, mahongwei3
	<mahongwei3@xiaomi.com>, jiangdayu <jiangdayu@xiaomi.com>
Subject: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Date: Tue, 27 Jan 2026 19:04:22 +0800
Message-ID: <20260127110422.306711-1-jiangdayu@xiaomi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJ-MBX07.mioffice.cn (10.237.8.127) To BJ-MBX03.mioffice.cn
 (10.237.8.123)

When the xHCI controller reports a Host Controller Error (HCE) status
in the interrupt handler, the driver currently only logs a warning and
continues execution. However, a Host Controller Error indicates a
critical hardware failure that requires the controller to be halted.

Add xhci_halt(xhci) call after the HCE warning to properly halt the
controller when this error condition is detected. This ensures the
controller is in a consistent state and prevents further operations
on a failed hardware. Additionally, if there are still unhandled
interrupts at this point, it may cause interrupt storm.

The change is made in xhci_irq() function where STS_HCE status is
checked, mirroring the existing error handling pattern used for
STS_FATAL errors.

Fixes: 2a25e66d676df ("xhci: print warning when HCE was set")
Signed-off-by: jiangdayu <jiangdayu@xiaomi.com>
---
 drivers/usb/host/xhci-ring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9315ba18310d..1cbefee3c4ca 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3195,6 +3195,7 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 
 	if (status & STS_HCE) {
 		xhci_warn(xhci, "WARNING: Host Controller Error\n");
+		xhci_halt(xhci);
 		goto out;
 	}
 
-- 
2.34.1

