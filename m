Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19373290D1;
	Wed, 24 Jun 2026 05:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280657; cv=none; b=XAInHkLdosfcATN3E73jOsp8TpVfWND2t4F6WsKV4kkoOc/3Wm935mcWP4UdmFc6gppSNGcHjPlf4F4fCGlga6TC143RKLhLB0NJBwaqAst6l/H87LRA5nPYLbTnU1zDeSx3+Smw9q9mUWP/bo6h7o9lAcXy4kcK8ChorJHWpAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280657; c=relaxed/simple;
	bh=WlXmYIl4eC/qw1l0szNv1vcljvMMwJop+TpOZYviabE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FyjY6ta9D6A0Om/58elP50hjEVoXMLgJfm3LVzi89H/YgjsmnVp11jVCSwSxe3WmSL1WL37XfrQK362mac4uAh3GzjMD6EN9EOJDpkwmoZuyqmTrGajB/7ePAusacMqZNWE/aLspSBEtTdXf+Ozu3WG23QaopThQIbL5aLq983w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADXwajIcTtqXSqtFQ--.64136S2;
	Wed, 24 Jun 2026 13:57:28 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] usb: dwc3: st: Propagate reset deassert failures
Date: Wed, 24 Jun 2026 13:57:28 +0800
Message-ID: <20260624055728.46078-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADXwajIcTtqXSqtFQ--.64136S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ury7tFW5Gr1rAFyxur1fCrg_yoW8ZrWrp3
	y7GrWSyry09rs3Ja1fAF15uFyruFWSqFWUG3y3Kw18Awsaq3yDtryYkFyrJa4DJFWkAryU
	CF4UtF4rua9FvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnGQDUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The ST DWC3 glue driver treats the powerdown and softreset reset
controls as required resources, but ignores reset_control_deassert()
failures before populating the child DWC3 device.  Resume ignores the
same failures before returning success.

Check the deassert operations and unwind the already deasserted
powerdown reset if softreset deassertion fails.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/dwc3/dwc3-st.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index 5d513decaacd..bbabfd933798 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -242,7 +242,9 @@ static int st_dwc3_probe(struct platform_device *pdev)
 				     "could not get power controller\n");
 
 	/* Manage PowerDown */
-	reset_control_deassert(dwc3_data->rstc_pwrdn);
+	ret = reset_control_deassert(dwc3_data->rstc_pwrdn);
+	if (ret)
+		return ret;
 
 	dwc3_data->rstc_rst =
 		devm_reset_control_get_shared(dev, "softreset");
@@ -253,7 +255,9 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	}
 
 	/* Manage SoftReset */
-	reset_control_deassert(dwc3_data->rstc_rst);
+	ret = reset_control_deassert(dwc3_data->rstc_rst);
+	if (ret)
+		goto undo_powerdown;
 
 	/* Allocate and initialize the core */
 	ret = of_platform_populate(node, NULL, NULL, dev);
@@ -328,8 +332,15 @@ static int st_dwc3_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 
-	reset_control_deassert(dwc3_data->rstc_pwrdn);
-	reset_control_deassert(dwc3_data->rstc_rst);
+	ret = reset_control_deassert(dwc3_data->rstc_pwrdn);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(dwc3_data->rstc_rst);
+	if (ret) {
+		reset_control_assert(dwc3_data->rstc_pwrdn);
+		return ret;
+	}
 
 	ret = st_dwc3_drd_init(dwc3_data);
 	if (ret) {
-- 
2.50.1 (Apple Git-155)

