Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE2532FA14;
	Wed, 10 Jun 2026 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084368; cv=none; b=L45JEc8N2rPYzH0ht+f0xT+kli+6+hH3etmzY/9rkzznk6fqxJhGT7eNv06rQp5QfHrhDBIL6DJ1PrJig3WFm4SxTgbp/6SnusQPwztrBjVZKRzQp9xitkzZuXH5hXR07JoE52xv5W4mkBPMODSnxWSNuzwFiP07fFv8bVtpFn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084368; c=relaxed/simple;
	bh=/e/Vg3jGD4+hMeg9nfyEWx6Qrg8frO5fU9V+ic/KzAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iu1EAHjl1ni+RWVEe8tEZGdjTxy0fxAAX85viMqxkA7tH3YTebLF3rKsh4z5d0W0eI2RNYrTa59QH85wc7kgNw0oWYfFoOfeXAz/04i4XaGvrS4Q75qyGm8UMHe2fJ2hQ+QzChdV6bzPOZxRQBjA3P0uxDpCkheO+a3eaqpSi3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=hulZrORe; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="hulZrORe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781084347;
	bh=1yusN21ndlODZdGNbLu3OUkPd9ycqqrIF2gVJY9o//I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hulZrOReEtm3o8S3XjNbd0u2PliNbRwDiQULCS6p81VaXlgWxmubspHfhM+SWoiXb
	 TB3Vpo1MJEEKq8eKjA5vjCN7TkQclknKaPH/7Y2bGaRGGBMMk+4UoyjZeDtKrMeIw7
	 irCzCgIGPA/UREF+jnVpABxqEL/uk1llSw6LT9bM=
X-QQ-mid: zesmtpsz2t1781084343t83f4fc92
X-QQ-Originating-IP: HCc2/sg77EJcERF13nFExpRRa24JB1LR5D++eg+RyJY=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Jun 2026 17:39:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3929559481487058294
EX-QQ-RecipientCnt: 5
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [RESEND PATCH] xhci: sideband: fix ring sg table pages leak
Date: Wed, 10 Jun 2026 17:38:57 +0800
Message-ID: <37074E2036AAAC12+20260610093857.1427999-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N3gATt1+RV61u4bidiOhAKAlyMrIyomE5ZhLXeDqbwQgcWFm8ImaKavL
	90GvncjaurZmtekuVVyl7WNvEhmWFbl1EmdYFclqTYPeHzYXgCR4mWV7iPqo2mug5izz3+1
	GRg0Nwe5JX77ixJlZBcGmTlwTpCC91a+FmgAg4a01RXTugtCZwkt9nelwpHP3ETAVOhdSCQ
	8v26yt2QWUTk+OAiflh78YHXa12LQWO3K89+ra5G8MGZ394d3I6TaeBWT6hPbF0Nge0krVC
	NipgqRDooWv2XeXXoxEBbpx7erZegoevKLQTdLnSTvhMXZ656B5zoLrqdJhRA7V31+JTPiN
	93kYR9VW+/qIvNZAYM+gUuDhUHYhLzGXsBOj2llpchoB+nNn9WAQbXpaUAxg/vV8/tiwTG9
	rdN5GbMFaQa5AamFfQI2rvNtaSpOPGjjws2KA/eJElRBt0kCAhI4oqCYVxJTuByrOOfLCjD
	+1bHV7LLJInuXRoGH0b2oIEpKPkicluO7x/tWyipYz+JO3a7FvePA3JQWR8kVzGEkaK+sLv
	2OO9KPs26MWEkFICTch5ukInV+rAVX3RcMPi31h6tA6Bjk7dohMMXmbBNPi8Lm296X4TVMj
	H5eQ9Ns/H2qs2/aHvEQvgphH4V3x6MTDSIPlQBBXBXW0r5ia9uuEYIasAJS2Q8YNGGCcViS
	5PRVLvOpM0/O9dDesiIVNs+fG2g6TsQYShazQgBGWL6lzlUlcR0VX0APGupihwnB6Vlq8m8
	OK7nddN+CvtOHOltyW6Hx6yek6kpEsutpF4lqmvZ4+VGtFEhPRdj8t/yjB7EKuEW+v+zcLF
	uQs1mlqI9wszZIFi6ZsF89j4W9sLJ6OoHaBYrMdlmvMUeKPdAeVkc8wJAtcI6VAdNC28k37
	lbEs00Kalf/CLx6ywTQ21zgSznAlyNP6dt+zCtINWl/lEHJaT7V2W9YEfTZcwVH5yW1syve
	B8VxEUWUw+lL5rOItF6obw/HmbaoYge5A08rmXL9CcOJ+c2Jo1+njoAe/yrtQc2a6/RLIQ5
	pwEtIC8la3dV5NK8tnA4Qif+UbjdAQGllvOIvQAkXaVdU+y0wL
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

xhci_ring_to_sgtable() allocates a temporary pages array and
uses it to build the returned sg_table with
sg_alloc_table_from_pages().

The error paths free the pages array, but the success path
returns the sg_table without freeing it. This leaks the temporary
array every time a sideband client gets an endpoint or event ring
buffer.

Free the pages array after sg_alloc_table_from_pages() succeeds.
The returned sg_table has its own scatterlist entries and does not
depend on the temporary array after construction.

Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secondary interrupter entity")

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/host/xhci-sideband.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 23153e136d4b..a5deeee4d5dc 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -58,6 +58,8 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
 		goto err;

+	kvfree(pages);
+
 	/*
 	 * Save first segment dma address to sg dma_address field for the sideband
 	 * client to have access to the IOVA of the ring.
--
2.50.1

