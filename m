Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B09409624;
	Tue, 30 Jun 2026 12:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821407; cv=none; b=u8zTKEaSbD+mus4mUEUtT4ctKVk5mAr3f2ubjP8Jk/NjU926hPi/4zUke+9TQKSfdypw6g9Mb7VXoMZDUwWNLaTWinGxMmRp+4rN1PY+u5Mm8BA+jp6trXMJSPhiPAD5DlfPSsP16K1PN7vZwgaL5kg8gHKGm3Vq5Kql2IP3+0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821407; c=relaxed/simple;
	bh=bIx7qoRtflBhD+2Q4O9LU6x0p3DQoyWT0FnIkXiFXvs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=puFxWpsIdLDMsYPIMJK+ESn7hRtvYhuf9Ct+jBk+iwIA1idgoIaQeNRpP24XhId+5FuojMJejoYVm37dZ7mmzbzIMuzdWSMLdKXYW6sH37CZW5DVO7OdkSPavuSfs9uHojhcjPDINfMEoWC78PmbwEX2879N10pHtBRa6j9+Nxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id B2FD723370;
	Tue, 30 Jun 2026 15:01:14 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH] usb: typec: qcom-pmic-typec: avoid uninit values in dev_dbg() error paths
Date: Tue, 30 Jun 2026 15:01:14 +0300
Message-Id: <20260630120114.185169-1-kovalev@altlinux.org>
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

Initialize the affected locals at declaration.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index bf985efe1cd6..c8379cdcb6da 100644
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
+	unsigned int mode = 0, currsrc = 0;
+	unsigned int misc = 0;
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

