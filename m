Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA43D3D8122;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654583; cv=none; b=HL19QqgnHR+71f99sHFtEHYIIrgiSTR5sHGUiiU7JGdlL8OjuYCpwzS54U5YgUj8MbOHhAMeuDWkX0b21Ul5LEwVku5FyKftUxFJaOhWSkIX8UeNLVmhfhv5l/bPtABeTXYtp12cyqTYEbBlKxmBO2p9oUbM5PGQ3Toe4BvtmNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654583; c=relaxed/simple;
	bh=n4qcwQOAWpnOhdNXJpqY+XiT9fYkJ1wr279B5rQKL1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tinH6CaUeCx0fLp5bJQnQcFZ802p7VBO+oaXQhWMwtIb17JNLU3dObKdchf87sBc6cfsfjpzmOgDbFQYppcjsz5+2dQUdiHw6Y1LGj3b+6vIV5O/ZvPr3fTnBjW9A6nEaL0ofKQ6mpdyD2WSc9DfUmq3JNZvspyDIq4hqEiH7nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WudKBFN4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WudKBFN4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E95EC2BCFB;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654583;
	bh=n4qcwQOAWpnOhdNXJpqY+XiT9fYkJ1wr279B5rQKL1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WudKBFN4B9vQ6EfLDKan/fYYaGMB8Rh+jt7zjdtCZPd6aehsJkRVVcppeuyN7E6mF
	 JCywxaX2S95vLCrSjzLC0vG35YDbpRYijen09RAMDqh94qgyc8zqMvpMbFJdw7PY47
	 IMrqqyj5djhwmqqCdvHAn6sKP6MQLV6hnqSUX+K8lY7VhRM6KjzozMUOaT9QVz9dU8
	 wwoGUlid01qeoUvCEyZTS2Aq4h/sQs0C4ln0+CvbLbrl5RQ2KGbnvULPaek+h4M2hc
	 QJZ+ZwLWR1gJj00du43owMJlN1HXqwxv5oKX8/4MlH/1DN/OwRuCmlWH0FL1E16tIb
	 UOM3b9UaCXHnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B5BC61DB6;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 14:42:27 +0400
Subject: [PATCH 2/9] usb: dwc3: core: Allow glue layer to pass reference
 clock
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq-flatten-usb-v1-2-5c1f3170bbe9@outlook.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
In-Reply-To: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654580; l=3821;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=jvcPphTWzl9HnvqjiW15stsU13/prizmqZkkC3i7P+w=;
 b=/PrKQvI5KomoWBa8UIyh3AmedvSdG+Ox3wY4vsVkfrKHkv9xE0YkK/8PqgMrnMVy/IHdBF+Cc
 YhLLqT0y11zDuW9sFQFj2/CEgx6EZjmFmB+gPgZLputRXQ6eN/t4DOA
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add ability to pass a reference clock from the glue layer to the DWC3
core driver. The core calculates the reference clock period and frame
length adjustment based on the reference clock rate.

In the flattened snsp-dwc3 model, it is currently not possible to pass a
reference clock that differs from the default since:
commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library")

The new glue layers (incl. Qualcomm's) set the ignore_clocks_and_resets
flag in dwc3_probe_data to true, which disables the core driver's clock
management, thus it also doesn't acquire the reference clock from the
devicetree needed in dwc3_ref_clk_period.

There's an existing DT property 'snps,quirk-ref-clk-period-ns', but
that's been deprecated. In addition, basing the rate from the period is
often not accurate enough to derive the frame length adjustment value.

This prevents moving chipsets such as IPQ5018, IPQ6018, IPQ5332, IPQ5424
and IPQ9574 with a different reference clock rate from moving to the
flattened model.

So, add ability to set the reference clock in dwc3_probe_data, then
have the core obtain the clock rate and use that to calculate the
required period and frame length adjustment.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/usb/dwc3/core.c | 12 ++++++++++++
 drivers/usb/dwc3/core.h |  2 ++
 drivers/usb/dwc3/glue.h |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..c52920148588 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -420,6 +420,10 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
 	} else if (dwc->ref_clk_per) {
 		period = dwc->ref_clk_per;
 		rate = NSEC_PER_SEC / period;
+	} else if (dwc->ref_clk_rate) {
+		rate = dwc->ref_clk_rate;
+		period = NSEC_PER_SEC / rate;
+
 	} else {
 		return;
 	}
@@ -2332,6 +2336,14 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 		ret = dwc3_get_clocks(dwc);
 		if (ret)
 			goto err_put_psy;
+	} else if (data->ref_clk) {
+		dwc->ref_clk_rate = clk_get_rate(data->ref_clk);
+		if (!dwc->ref_clk_rate) {
+			dev_err(dev,
+				"failed to get rate from ref clock provided by glue layer\n");
+			ret = -EINVAL;
+			goto err_put_psy;
+		}
 	}
 
 	ret = reset_control_deassert(dwc->reset);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..04b15defccf3 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1032,6 +1032,7 @@ struct dwc3_glue_ops {
  * @regs_size: address space size
  * @fladj: frame length adjustment
  * @ref_clk_per: reference clock period configuration
+ * @ref_clk_rate: clock rate taken from reference clock provided by glue layer
  * @irq_gadget: peripheral controller's IRQ number
  * @otg_irq: IRQ number for OTG IRQs
  * @current_otg_role: current role of operation while using the OTG block
@@ -1261,6 +1262,7 @@ struct dwc3 {
 
 	u32			fladj;
 	u32			ref_clk_per;
+	unsigned long		ref_clk_rate;
 	u32			irq_gadget;
 	u32			otg_irq;
 	u32			current_otg_role;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index d738e1739ae0..75c9612527a5 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -33,6 +33,7 @@ struct dwc3_properties {
  * @skip_core_init_mode: Skip the finial initialization of the target mode, as
  *		it must be managed by the glue
  * @properties: dwc3 software manage properties
+ * @ref_clk: optional reference clock for the DWC3 core
  */
 struct dwc3_probe_data {
 	struct dwc3 *dwc;
@@ -40,6 +41,7 @@ struct dwc3_probe_data {
 	bool ignore_clocks_and_resets;
 	bool skip_core_init_mode;
 	struct dwc3_properties properties;
+	struct clk *ref_clk;
 };
 
 /**

-- 
2.53.0


