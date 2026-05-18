Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819573E3155
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095942; cv=none; b=ckOQw94mpQRn5C5FyfK2nVx8lHvZ4G0v5M/XPqdZIy4E0VtJSnBaoYqRrZgpND7VsUjc5rco6OgAArJpbNcyLUNqroDgU34+Ym0nklCSgLJv0jxjo5vQ8bV7SHlKE+vkAaIVfmuD6qiWKh4T+3MCP8R4MtDJelwjDwmVyTy9uM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095942; c=relaxed/simple;
	bh=qTjf5MEBrsBEeZzbSZRx8h9kU7ecbQL0NIW1Z+mdao0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=odKXiE5rYNdLHtQ2CUWkOD6mqgQHEnEhC8CPxF9j+opyQHnb3dNETpJYtay0nn4v/AVFaOyQcx7bQOXXJ5y8gH5XmcpVQm8OwkGhTqumLWOG6p0W9Ahu1vU2+AUgH5s9iP+1KSl4T8qWgFCs35lzPpwXTBHTeuHDKzyumAxdpuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=Hz613ICk; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="Hz613ICk"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1779095936;
	bh=b9Xom/yVmQ1rXJdvyFv4DAQzlgu6E3vq/lWxeia0LLU=; l=2442;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Hz613ICkhuMgcIAxpGNMulxGhOlnfJ/qgM17vVwoITw2GWtHlc12P6STonGOE0RrZ
	 hl+4T9n/8PCL6bfYH1kfZCRCnRFNS2RmN3FLQtBYm5X2fRNMP8eAuFeR4YLYOqAdCo
	 /Nzslh7ZtOE0WYVwR3O7bpz4xFm45HT7G+4KTd+SHQmBPifDxIl/m+XEl0s149XhQ4
	 k7CzVAHCFYPwSwli73ckBvMPE83hpXJ32nClZc6EBSsn1KRgNZoSO1SNTdusGKuQIz
	 Dmrz1uK+f3DikjI/Me5asWE0kx5GLI7QAhwWpNVbXR/e4Ybvm4G+zG6aPWzIStZqIO
	 2a0tNPF8Y+9Wg==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1227036:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 18 May 2026 17:18:55 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 18 May
 2026 17:18:54 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Mon, 18 May 2026 17:18:54 +0800
From: <cy_huang@richtek.com>
To: <linux-usb@vger.kernel.org>
CC: <badhri@google.com>, <heikki.krogerus@linux.intel.com>,
	<gregkh@linuxfoundation.org>, <lucas_tsai@richtek.com>,
	<cy_huang@richtek.com>, <ren_chen@richtek.com>, <kevin_hung@richtek.com>
Subject: [PATCH 2/3] usb: typec: tcpci: add low power mode support
Date: Mon, 18 May 2026 17:15:13 +0800
Message-ID: <20260518091513.3277975-4-cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260518091513.3277975-2-cy_huang@richtek.com>
References: <20260518091513.3277975-2-cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Lucas Tsai <lucas_tsai@richtek.com>

Add low power mode support,
due to no standard about low power mode in TCPCI Spec,
handle vendor low power mode currently.

Signed-off-by: Lucas Tsai <lucas_tsai@richtek.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
 include/linux/usb/tcpci.h      | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 0148b8f50412..8f6df4c708f5 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -227,6 +227,14 @@ static int tcpci_start_toggling(struct tcpc_dev *tcpc,
 			    TCPC_CMD_LOOK4CONNECTION);
 }
 
+static void tcpci_set_low_power_mode(struct tcpc_dev *tcpc, bool enable)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+
+	if (tcpci->data->set_low_power_mode)
+		tcpci->data->set_low_power_mode(tcpci, tcpci->data, enable);
+}
+
 static int tcpci_get_cc(struct tcpc_dev *tcpc,
 			enum typec_cc_status *cc1, enum typec_cc_status *cc2)
 {
@@ -857,6 +865,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.set_polarity = tcpci_set_polarity;
 	tcpci->tcpc.set_vconn = tcpci_set_vconn;
 	tcpci->tcpc.start_toggling = tcpci_start_toggling;
+	tcpci->tcpc.set_low_power_mode = tcpci_set_low_power_mode;
 
 	tcpci->tcpc.set_pd_rx = tcpci_set_pd_rx;
 	tcpci->tcpc.set_roles = tcpci_set_roles;
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index f7f5cfbdef12..0ecf11b7b8f2 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -177,6 +177,8 @@ struct tcpci;
 /*
  * @TX_BUF_BYTE_x_hidden:
  *		optional; Set when TX_BUF_BYTE_x can only be accessed through I2C_WRITE_BYTE_COUNT.
+ * @set_low_power_mode:
+ *		Optional; Callback to enter or exit low power mode.
  * @frs_sourcing_vbus:
  *		Optional; Callback to perform chip specific operations when FRS
  *		is sourcing vbus.
@@ -221,6 +223,8 @@ struct tcpci_data {
 			 bool enable);
 	int (*start_drp_toggling)(struct tcpci *tcpci, struct tcpci_data *data,
 				  enum typec_cc_status cc);
+	void (*set_low_power_mode)(struct tcpci *tcpci, struct tcpci_data *data,
+				   bool enable);
 	int (*set_vbus)(struct tcpci *tcpci, struct tcpci_data *data, bool source, bool sink);
 	void (*frs_sourcing_vbus)(struct tcpci *tcpci, struct tcpci_data *data);
 	void (*set_partner_usb_comm_capable)(struct tcpci *tcpci, struct tcpci_data *data,
-- 
2.43.0

