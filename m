Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4184A3BE631
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782310465; cv=none; b=TYjbhO04BK+L2R5l2uoFcS9G/x28IU1Uzqq8yQRofzXDnI02j5C5hIOYe1QuThHZNVDRqI+sd69pAUbKH3cn9Ldrtgih8IW51rAHFsMdUZ8zVFrAOA+GrRCcizKauuDBpjnx24raTphHJrc2LnZ8xS8SUJ0BZFzgjO/6FL0ByxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782310465; c=relaxed/simple;
	bh=N0HPVbEJ5uqfvlXlf7HlzLLCnBIxOe/hsFF6kAhwumc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RnKeOAULdwV9ICpHeyrQj8Snt48fAJZsag1IJYGraHPUhDVBJGjY16Q3A+LkTqNnDTS1Qxe0K479gQw9Hza7MvS3+GjbL+NvfcDn3OAFJ8ReH5dOPQf1DmHdhZf2pQPSqcWD1FoXfTgRYRFuT81Te+9oQyoy9w4HlLJ45sVRLbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=NdqWhCFY; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="NdqWhCFY"
Received: from LAPTOP-99KJFSET (unknown [115.205.180.138])
	by smtp.qiye.163.com (Hmail) with ESMTP id 439c7ea98;
	Wed, 24 Jun 2026 22:09:09 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	getshell@seu.edu.cn,
	jianhao.xu@seu.edu.cn,
	Slavin Liu <220245772@seu.edu.cn>
Subject: [PATCH] usb: gadget: r8a66597: avoid double free of ep0_req in probe error path
Date: Wed, 24 Jun 2026 22:09:08 +0800
Message-ID: <20260624140908.1282-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ef9f6991f03a1kunm3b60efed39c49
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTB1IVklPGE1MHUpMSU5ISlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSk5VSUtOVUpDS1VKSENZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NdqWhCFY9DQF49vx5kExJFJ6WFAKCUp5raKiTiy3MQ5aZs8h1zDTPAmNLjDwbZivFFXS0TUexo28uh4VToYjnBE7WeCMcHZnLEvmGcSjU9b/knPwY2Krw3/b3kI0LZeampwXMUeB1eMSGdJNM/LZKi29gLO3Xqg/XEe3EfvPuGU=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=qSOQN4DD7Q2eYdPWSy9MG7CpGNR9B6q4DcP2rPUJl9w=;
	h=date:mime-version:subject:message-id:from;

If usb_add_gadget_udc() fails, r8a66597_probe() jumps to err_add_udc
and frees ep0_req, then falls through to clean_up2 where ep0_req is
freed again when it is non-NULL.

Remove the redundant free from err_add_udc and keep the cleanup in
clean_up2 so the request is released exactly once.

Fixes: 776976a67ae2 ("usb: gadget: r8a66597-udc: cleanup error path")
Issue found using a prototype static analysis tool
and confirmed by code review.

Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
Signed-off-by: Slavin Liu <220245772@seu.edu.cn>
---
 drivers/usb/gadget/udc/r8a66597-udc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/r8a66597-udc.c b/drivers/usb/gadget/udc/r8a66597-udc.c
index e7a5d8553c0e..d190e16d43fc 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.c
+++ b/drivers/usb/gadget/udc/r8a66597-udc.c
@@ -1951,7 +1951,6 @@ static int r8a66597_probe(struct platform_device *pdev)
 	return 0;
 
 err_add_udc:
-	r8a66597_free_request(&r8a66597->ep[0].ep, r8a66597->ep0_req);
 clean_up2:
 	if (r8a66597->pdata->on_chip)
 		clk_disable_unprepare(r8a66597->clk);
-- 
2.50.1.windows.1

