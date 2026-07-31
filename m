Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B763D75C4;
	Fri, 31 Jul 2026 08:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486941; cv=none; b=jpGfRzjQZpVSq650qTKAVl+RXjY6LUmsgsSFOFjp97UZtoYzPXLOykOV6ksPIwAPMI/nf75xU+cmIaDroTADlgPjzU83kHF5hR5iuUzpOSRLCiCCuBMXQrlYNqULmqkhPseI/6yYhn7LqJ53hnV+S02F5EQE4FzHgBxJn2yTg9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486941; c=relaxed/simple;
	bh=a0HmalGWzR4vYjVN1w9iJOjRcfCKYjEFE8M+1THWDbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UKQ7Pgh/7/1nFzmH4pXoqw5GuRAzBTsYuu/6wPoitRm8tM9PGn7unXmk43jF+SptLt5nYzNJG0v4dY17wL54fme0/rcejJCOLFQhcfHlZhdhiDNMQI1DglrPLkBkiq7o9JJbRDEkWNBaAahrtAAwCZuTxqi3WvaE0WS3iWlXNa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 51CB520276B;
	Fri, 31 Jul 2026 10:35:36 +0200 (CEST)
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1wpiiO-002BFd-0n;
	Fri, 31 Jul 2026 10:35:36 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: xu.yang_2@nxp.com,
	18255117159@163.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] usb: typec: tcpci: add alert.fault handling
Date: Fri, 31 Jul 2026 10:34:59 +0200
Message-ID: <20260731083529.2659924-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimal handling to clear the ALERT.Fault bit which may be set in
case of an over-current or over-voltage detection. At the moment only
the IRQ clear support is added since the TCPC Spec mentions that the
handling of such events is vendor specific.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/typec/tcpm/tcpci.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index a56e31b20c21..d2d5bf7ca618 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -692,7 +692,8 @@ static int tcpci_init(struct tcpc_dev *tcpc)
 
 	reg = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_FAILED |
 		TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_RX_STATUS |
-		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS;
+		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS |
+		TCPC_ALERT_FAULT;
 	if (tcpci->controls_vbus)
 		reg |= TCPC_ALERT_POWER_STATUS;
 	/* Enable VSAFE0V status interrupt when detecting VSAFE0V is supported */
@@ -720,6 +721,19 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 	irq_ret = status & tcpci->alert_mask;
 
 process_status:
+	/*
+	 * Handle nested fault before clearing the alert status to not
+	 * re-trigger a fault alert immediately again.
+	 */
+	if (status & TCPC_ALERT_FAULT) {
+		unsigned int fault;
+
+		/* TODO: Add a proper over-current and over-voltage handling */
+		ret = regmap_read(tcpci->regmap, TCPC_FAULT_STATUS, &fault);
+		if (!ret)
+			regmap_write(tcpci->regmap, TCPC_FAULT_STATUS, fault);
+	}
+
 	/*
 	 * Clear alert status for everything except RX_STATUS, which shouldn't
 	 * be cleared until we have successfully retrieved message.
-- 
2.47.3

