Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C723537CD;
	Mon, 13 Jul 2026 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783967105; cv=none; b=E98Ga/kWR/zxoLLy7Y5Dy6XgmenfvvyfFa6JzktiwdaNzmZY9sgEO5QWUzBmkDXEzpHY1x4+4zIJLrim9oeRUr3Gon7rnQpaYGw2JUYDH8nWLkx0O0NKtczGFTXafKte2wkgTCarfIJ/3MBW0xkzTtRrvZNtWrcEMkxq+iArarI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783967105; c=relaxed/simple;
	bh=OX/McDO1qPytlQlVUz0pVIuCo1NendmpnWnZRv7aBFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IytuJsKcFTd7CfJXjDGF3BQCGPF7W+t2pBZCS9SQ8YWdEEDIlqdwzpVjStfWkCg3srD+SA+mEqC4uN5k65OLYvTbcRTlaJxzOD0dlLl+HBjcJX6CN2qLYD168xVumfn1Gb0KNJrpuIRGR3BHpkeMQbxFQNC4qOKM7V2PLYaFZEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id 80D2A23370;
	Mon, 13 Jul 2026 21:25:00 +0300 (MSK)
Date: Mon, 13 Jul 2026 21:25:00 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: gremlin@altlinux.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v1] usb: typec: tcpm: qcom: initialize currsrc explicitly
Message-ID: <20260713182500.GB22956@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

When regmap_read() fails, the execution goes to done: label, where
currsrc is passed to rp_sel_to_name() and used as an index after a
proper check. However, to make this situation easier to notice, an
explicit initialization of currsrc with obviously impossible value
is suggested. Alas, we can't simply use zero value here because it
means TYPEC_SRC_RP_SEL_80UA.

Found by ALT Linux Team (altlinux.org) and Linux Verification Center
(linuxtesting.org) using SVACE.

Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index bf985efe1cd6bea4..d7cb69cf6044841b 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
 	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
 	struct device *dev = pmic_typec_port->dev;
-	unsigned int mode, currsrc;
-	unsigned int misc;
+	unsigned int currsrc = 0xFF; /* error, easy to notice in the log */
+	unsigned int mode, misc;
 	unsigned long flags;
 	int ret;
 


-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net
