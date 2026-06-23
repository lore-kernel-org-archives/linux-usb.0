Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816737F73A;
	Tue, 23 Jun 2026 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782223510; cv=none; b=txpA8r1YikQt1uslzaAyq9vwU8JVUtPOv1FhndH31Mx4JP7OtBTF71hwOw+zKlD1zEBbnpBn2ewkGBopXRa1eW9w/PN1g2pFjHBBhHpOfR2ZGFPaKJwbs82zqvTX6XUwDVUt95t1EXl2Vm2uG7y96Ltfd7jql5aVYiSMf6xT2Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782223510; c=relaxed/simple;
	bh=Z1eitwFXHKTICrZqp8xL00MC72ben16wKEu+AduVlYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MjoA/LGAywqrFAjuAfU9pKe1wgB5x5R1No2aD4ccd6lFyP4JNSBgo5dZNYuvOtJzX/aoneF8gfqAT2zWXkOIbmQf3BTnk2E+VBjuG7MQ7hApOY8Iqh2a7bcaV96U4EXwD5xvi4zkoRx9OmyegOr97lZqe0tuGdry68UJWkmYYQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACnCt6PkjpqZWvYFA--.57057S2;
	Tue, 23 Jun 2026 22:05:03 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] usb: xhci: report USB2 resume-exit timeout as an error
Date: Tue, 23 Jun 2026 22:05:03 +0800
Message-ID: <20260623140503.87226-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACnCt6PkjpqZWvYFA--.57057S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFyxZFW8ZFW8Gw1UtF48Xrb_yoW8Zr4UpF
	ZIg3yFkryDtF47Gr4ayF4UtF4F9ws5J3y7GFyfJrykAr4Utr45Cr1vkrZ0v3srXrZ7CFy3
	tF48Aay5G3WDtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU8-
	B_UUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

xhci_handle_usb2_port_link_resume() waits for the USB2 resume exit
completion after requesting U0. If that wait times out, it only logs a
warning and then continues through the normal resume-done path, ending
the port resume and marking the suspend change as completed.

Return -ETIMEDOUT on resume-exit timeout so the port status path reports
an error instead of a successful resume. The patch still ends the
usbcore port-resume accounting before returning. This is intended as an
RFC patch because xHCI resume state handling is policy-sensitive.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/host/xhci-hub.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index b0264bd85..b7b7d8b31 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -998,21 +998,23 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
-		if (time_left) {
-			if (!port->slot_id) {
-				xhci_dbg(xhci, "slot_id is zero\n");
-				return -ENODEV;
-			}
-			xhci_ring_device(xhci, port->slot_id);
-		} else {
+		if (!time_left) {
 			int port_status = xhci_portsc_readl(port);
 
 			xhci_warn(xhci, "Port resume timed out, port %d-%d: 0x%x\n",
 				  hcd->self.busnum, wIndex + 1, port_status);
 			/*
 			 * keep rexit_active set if U0 transition failed so we
 			 * know to report PORT_STAT_SUSPEND status back to
 			 * usbcore. It will be cleared later once the port is
 			 * out of RESUME/U3 state
 			 */
+			usb_hcd_end_port_resume(&hcd->self, wIndex);
+			return -ETIMEDOUT;
 		}
 
+		if (!port->slot_id) {
+			xhci_dbg(xhci, "slot_id is zero\n");
+			return -ENODEV;
+		}
+		xhci_ring_device(xhci, port->slot_id);
+
 		usb_hcd_end_port_resume(&hcd->self, wIndex);
 		bus_state->port_c_suspend |= 1 << wIndex;
 		bus_state->suspended_ports &= ~(1 << wIndex);
-- 
2.50.1 (Apple Git-155)

