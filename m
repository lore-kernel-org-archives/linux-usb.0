Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698110;
	b=pqtBSmFU7dkep4pgfyU0j9MZV0eUo9Gb/FbP8Hk79sytyA/LUKvv/OYZ+kDvumMRF/rI
	 DTR02HnyMlf1FrIvVRUaQa4D92a4pp6Mq03YJcP020METs7bTQHWM/WBNKTOI0jdIGcKv
	 WfXT51gSe6L6HHw/x4qV2dC/V7kxVEi/lqld1NsNTBe/cseNyCf7E9xkXWvgLc91UIGan
	 js5KdsBixr1y5q5FMgsM0W7USNTZ8XHuVMI5UMj+2I5waEEbRhPq4yBLvLOpbTuGzmLHq
	 64G1yopExbcqji/Xu+ar6RJqi+d8kf3bkvXwjNtHq3RaWCCJD5hd0MTSm7lUZ0HO2gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698110;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Aic9k4Ahs9FV6XRalFHE+SxtDauWtJO1roL4s44pKHk=;
	b=ygaHHR2DoKOFR7rcruhuDQkfrdKzhk066dVCAf2w07ZNEgLW1tAALrLRyZdpo7DyPfLj
	 hkzyLLlM/mvuxONo8zwbzwFVrX4qgaFmMmnP1148HX3xv94uxJK6T0W29yYOQWkg9tqdb
	 mEHzemZzUVrW1o07Fcz/occAov7p40lGut36uAQSJ2UV48IdusUma4oqoSPEBAy/C2ozU
	 nZq+1F4pkBFhzBEi1CYbU5xjbr2BLRurS6CwP94wVPrrP3j1s/8y8LrMJEJMEmk+a4Ds5
	 snPA0Gprtuu+BRa0YXxjthg2qMfrzLJefoBLe6Y8XfcZ6ncXmTCA4d1IpsbrGQnLkJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ous/vebX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7C3606A683
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ous/vebX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC561F000C6;
	Thu, 26 Nov 2026 13:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698110;
	bh=Aic9k4Ahs9FV6XRalFHE+SxtDauWtJO1roL4s44pKHk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ous/vebXswcgajHB1ueX2KXixxWWgxCd0rZQ4rlxnsel7triwHrsNR2UEmLltp235
	 j1R9Pwk7T22TAl1GYfrMF75aGJLTAAf1CCvqdQKcEgqu2Ty9bLitkkGV/lH8S80HCz
	 nYm8b0/a8N84crEpuyZ3lLOzDKXMLQ/ACgGzcWy0DM7S8H85zZEpj8YVBTCqyK6bfg
	 4wRRu5DDDgMUknOFLCTHy/CVDtacwi+tItrUKzBCSsJis+O7thcSKe42WCp73nPdb1
	 KjeV1caqaEaqTYQOQkSru/pDVAmC9t9yPkyXCnvwJcq5uzglSuQlueocbJSAiNjL5L
	 4g1zKV0sxVLNA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 26 Nov 2026 14:01:41 +0100
Subject: [PATCH v2 1/4] usb: dwc3: gadget: serialize connection bitfield
 writes
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-topic-usb_dwc3_fixups-v2-1-c0cc2b75c518@oss.qualcomm.com>
References: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
In-Reply-To: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiazi Liu <jiazi.liu1984@gmail.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795698105; l=1892;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=jJe4BaNuiElTH7Ytm5Z7ync+f5dMJsdzhk6M2vnNAj4=;
 b=CNjFgSBFk7RQ7HJJKSj1rrCE8g4TNZl80hGeKsju4uPb/vPmYPI3Pe0nyYypJ1D7wD3E+9cn8
 8lmz+U8d4XJBHI1+kzmzXj8gZASosGxR/uHOsje7bFnsKUpfyiMuFhr
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

softconnect and pullups_connected are bitfields that share their storage
with dwc->connected, which is written under dwc->lock from IRQ context.
Unprotected writes to these bitfields can race with the IRQ's updates to
the shared storage.

Take dwc->lock around the softconnect assignment in dwc3_gadget_pullup()
and the pullups_connected assignments in dwc3_gadget_run_stop().

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 702cbc8475a8..4fab2d57e7d3 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2680,6 +2680,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on)
 	u32			reg;
 	u32			timeout = 2000;
 	u32			saved_config = 0;
+	unsigned long		flags;
 
 	if (pm_runtime_suspended(dwc->dev))
 		return 0;
@@ -2723,11 +2724,15 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int is_on)
 		reg |= DWC3_DCTL_RUN_STOP;
 
 		__dwc3_gadget_set_speed(dwc);
+		spin_lock_irqsave(&dwc->lock, flags);
 		dwc->pullups_connected = true;
+		spin_unlock_irqrestore(&dwc->lock, flags);
 	} else {
 		reg &= ~DWC3_DCTL_RUN_STOP;
 
+		spin_lock_irqsave(&dwc->lock, flags);
 		dwc->pullups_connected = false;
+		spin_unlock_irqrestore(&dwc->lock, flags);
 	}
 
 	dwc3_pre_run_stop(dwc, is_on);
@@ -2851,11 +2856,14 @@ static int dwc3_gadget_soft_connect(struct dwc3 *dwc)
 static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
+	unsigned long		flags;
 	int			ret;
 
 	is_on = !!is_on;
 
+	spin_lock_irqsave(&dwc->lock, flags);
 	dwc->softconnect = is_on;
+	spin_unlock_irqrestore(&dwc->lock, flags);
 
 	/*
 	 * Avoid issuing a runtime resume if the device is already in the

-- 
2.56.1

