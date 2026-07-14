Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3B3DF59;
	Tue, 14 Jul 2026 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047167; cv=none; b=LOmTSG80/+i6N3CaCYQavc7SVHAS1pKG/5ee/+UWol6Dwyu9i15M7MsGNTrALOVxS29tRFGuSlGuIGZWEE7XfQjrlXlAQIgYmXaxhUbcYfj9Gz99mJ149aBKFNHxz3KOAddhogoTz7ZbqEPm0ly1OWKqX5mZmYKoT+XhjFvUdlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047167; c=relaxed/simple;
	bh=0ake2YNqbb32UF2x4d2QaYtdmrOFhSI805JvLQP5H9o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dU2N9QjuTS2aXVfevzDZardjiRMKKfHNXivvAuvfvyC5Om9AQwvG2tyXmbx8GNGmEPHe5Ymo7KoRCpeGFjPt8gN5nVaApwm60Q0VED1H97NPsdpkUDRd8c8cLH+n3yTdDWc2HIfHXsqngxvpkedwB2XMDqc4QhlxN93U5uJLJOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 3789623374;
	Tue, 14 Jul 2026 19:39:14 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	"Alexey V . Vissarionov" <gremlin@altlinux.org>,
	kovalev@altlinux.org
Subject: [PATCH v2] usb: typec: qcom-pmic-typec: avoid uninit values in dev_dbg() error paths
Date: Tue, 14 Jul 2026 19:39:13 +0300
Message-Id: <20260714163913.151008-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several functions take a 'goto done' shortcut on regmap_read() (or
switch default) failure before assigning locals that the trailing
dev_dbg() then formats.

Initialize the affected locals at declaration. For 'currsrc' in
qcom_pmic_typec_port_set_cc(), use an out-of-range 0xFF rather than 0,
since 0 is a valid value that maps to TYPEC_SRC_RP_SEL_80UA and would
be indistinguishable from a successful assignment in the debug log.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Suggested-by: Alexey V. Vissarionov <gremlin@altlinux.org>
Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
v2:
 - Initialize currsrc to 0xFF instead of 0, so it stays distinguishable
   from the valid TYPEC_SRC_RP_SEL_80UA value in the debug output
   (suggested by Alexey V. Vissarionov : https://lore.kernel.org/all/20260713182500.GB22956@altlinux.org/).
 - Collect Reviewed-by from Bryan and Heikki on v1.

v1: https://lore.kernel.org/all/20260630120114.185169-1-kovalev@altlinux.org/
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index bf985efe1cd6..73270e4846c2 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -366,7 +366,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
 	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	struct device *dev = pmic_typec_port->dev;
 	unsigned int misc, val;
-	bool attached;
+	bool attached = false;
 	int ret = 0;
 
 	ret = regmap_read(pmic_typec_port->regmap,
@@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
 	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	struct device *dev = pmic_typec_port->dev;
-	unsigned int mode, currsrc;
-	unsigned int misc;
+	unsigned int currsrc = 0xFF; /* invalid; 0 is a valid TYPEC_SRC_RP_SEL_80UA */
+	unsigned int mode = 0, misc = 0;
 	unsigned long flags;
 	int ret;
 
@@ -535,7 +535,8 @@ static int qcom_pmic_typec_port_set_vconn(struct tcpc_dev *tcpc, bool on)
 	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
 	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	struct device *dev = pmic_typec_port->dev;
-	unsigned int orientation, misc, mask, value;
+	unsigned int orientation = 0, misc = 0, value = 0;
+	unsigned int mask;
 	unsigned long flags;
 	int ret;
 
-- 
2.50.1

