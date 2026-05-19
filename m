Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BD937C906;
	Tue, 19 May 2026 06:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171544; cv=none; b=SjfBSqr/Vm9KQU1nAKHoic5LeGYbGSi1/YP7Rigy3rgpqN9mjWVnWl3DziBOKBe0z4tskcHJKeU6sVV/Ehn1myElwt+e2akHZyFfJclTbYjGLP959OtIF+bPGksn2ZjhNW6gvaGXy3fs9Gbe4vVk8eNkJmAyZB3wKzuMNYhonYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171544; c=relaxed/simple;
	bh=pTfMdLEX3/TgmNGrh43gyxUelcsFohQX9tp8XWAIJf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HHpiQFEr86yORCUXAlWnDVH1tzzmpKazxLR0y+9MSu3ZpfFN/9H204E3GPvH64M0e7iQGviUmue3SYd4HU8YsZDx+s7ouLhYZ7/FR8jMMUECqm2znoA8+h31dj7ZAxfg5asyfZJL8GYZnC6WWOzUmPjKhalY8eytMsdP6qikrjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXyG0tyI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXyG0tyI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22709C2BCB3;
	Tue, 19 May 2026 06:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171544;
	bh=pTfMdLEX3/TgmNGrh43gyxUelcsFohQX9tp8XWAIJf0=;
	h=From:To:Cc:Subject:Date:From;
	b=uXyG0tyIvhm7t+H7XSiz1sk85zrAWCy1+Sj2syW5bUX37uf1kBOAQkVq+Hk63UXZQ
	 wj8qcAE/MrqlZ6Qpt7q+TbroH4Pf0xgWiRdV8yDMrG6ZgZMIkEXjJi6jgpDQ/WQnPA
	 jqA2Ay11ZQsVkcvndXfy2d6c+m78YxcD9fcMg6VKu/ASagNlqC9VbOKkb84te1ZRU6
	 KaRbiWzumVMsrFqVTT8FzLCC/8NHJ3nQ0F5mVXYrOXlHn1qv6MkNU7wQpdMID9DTXN
	 5A/hf/O+vXPKW/ntSsUmv4230qhXkSlvH/X08rbecqIaUKzMQKLtii1NLe8aNwp8cP
	 +/n0n17cDiGxQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc2: remove useless check of !chan
Date: Tue, 19 May 2026 14:00:01 +0800
Message-ID: <20260519060001.13199-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It looks a bit strange we check !chan after dereference of this pointer
with "if (chan->ep_type != USB_ENDPOINT_XFER_CONTROL)".

In fact, when entering the dwc2_hcd_save_data_toggle(), the chan won't
be NULL, because its caller or indirect caller has ensured this,
specifically, it's checked with below line in dwc2_hc_n_intr()

if (!chan) {
    dev_err(hsotg->dev, "## hc_ptr_array for channel is NULL ##\n");
    return;
}

This addresses the following issue reported by klocwork tool:
  - Suspicious dereference of pointer 'chan' before NULL check at
    line 518

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/usb/dwc2/hcd_intr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
index 5c7538d498dd..397c63393c7f 100644
--- a/drivers/usb/dwc2/hcd_intr.c
+++ b/drivers/usb/dwc2/hcd_intr.c
@@ -515,7 +515,7 @@ void dwc2_hcd_save_data_toggle(struct dwc2_hsotg *hsotg,
 	u32 pid = (hctsiz & TSIZ_SC_MC_PID_MASK) >> TSIZ_SC_MC_PID_SHIFT;
 
 	if (chan->ep_type != USB_ENDPOINT_XFER_CONTROL) {
-		if (WARN(!chan || !chan->qh,
+		if (WARN(!chan->qh,
 			 "chan->qh must be specified for non-control eps\n"))
 			return;
 
-- 
2.53.0

