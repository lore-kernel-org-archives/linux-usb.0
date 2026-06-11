Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10081A6806;
	Thu, 11 Jun 2026 06:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160386; cv=none; b=aZBsgV4Tebvb9+ljS+Ls3OPlLlbwea5Rp0vxUf1YgHTruBMgu6U7I6ape7zxRsbg3dtG0G6OlrSjuzWtveysjSA8fCYTO82ZO2wl1n4yR42BoAS4emcmFQM6pRy6At4ZLATyHJgMtYI6LFMMNqyueP5Hd9B6E8wxOk7NNU27ybk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160386; c=relaxed/simple;
	bh=diixlMzdJpRSigImyYoCy9zqT5bO0R3kTpZh024KOfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H9ynKOmX29ikGfHIiVtSlsVbrMvGZs4K3Mi3910ep/kiyTxX8kvR4uK+wWf2PZgE3jJvyOpkjmsF4r+e38YQKFgmW0xOOa+hCR7esJAeZdfobBcDJ7ALThuxUUQMbWp2P1lDFL9txMf5gkqaVYMcarN4/pFMPAqMdN6RRGjyEx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=VbDsRpDA; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="VbDsRpDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781160349;
	bh=oAneX2Jst3cGgDYlnr7UCQpY7eIad/5sDz7Her705sg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=VbDsRpDA9YkR4GAYuY4kR9XpKRiPjAwuvlPSwgwoUyd1olEjt6Sb7+kD+JV+ht6lK
	 i6lEMIaoDTF7TDIL2Fg81n7gAO3I3V4VkMiVGrBcFPJeoPK18RVpO4IYkaUT1m6Lnr
	 35rb1eVib1i0plwEmoPPOeKgRjruqrd3OolipJDs=
X-QQ-mid: zesmtpsz8t1781160334tb311bae9
X-QQ-Originating-IP: mhdvUARqfsdrneGfDv/F76KU38uHEPm/pYo+b5iqsEI=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 11 Jun 2026 14:45:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1298815341638788172
EX-QQ-RecipientCnt: 6
From: raoxu <raoxu@uniontech.com>
To: andreas.noever@gmail.com,
	westeri@kernel.org
Cc: YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH tb-next] thunderbolt: stream: unmap buffers with mapped size
Date: Thu, 11 Jun 2026 14:45:30 +0800
Message-ID: <BCAED571E6DC370E+20260611064530.3495292-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: MsgkoYRPt7igE6Woe1dwdo6L6Ko0gArbTvInzS9Kl6eG2kmdhVbZ6/Dm
	OJIymxi8VwOSprEZnUaHkpdDkgMBtQ9t1CZGZrnIrnsxWqAvmyKAV+cZoGdPxYlku5fRKm2
	+HTZJLYaSSm5W3bsijXY/J5vMwXdW6jcQ1pi/BKQR5XnlY1rR0RrUYBpHUQ6tC+1l5ZaWKF
	2nihCVjS66CWezJVLRaDczdAnnL5tWrKNzKJBR5EuRG2JV4M667cnYOB0D61jlyJl/Mh7ul
	gJNtHhavS57B2H4vaGOkn6UgG3+xtHzEJ2Hvme1vP0FXx3FMxYsqPjAnpVxQVwzQIYJiVMy
	a+ZF7LFtkpawUgTqAgoqnO3h7Mmx4sJxvd+SbyNfXptRyiRHG/WRE+dM91EJ5/T9DMAesdj
	wWokctrDAJaJrGa7c4a6Ajn6H7qMSLgexfd2APz+FxnUAQ6kW9WurqMBwxzwEoL3Z3XVCsh
	TWHYJmaAudTUNag9zSOKc7jydiSB1qoNsffxgZIoYb8jc36RObYrWoLCLKcsY/CyBcEukS0
	1jZqw7ph5DTz/QsRzSeCxAVA0cPcFCWw3DDyHq1v3v392P7pO4YdDR6w/O+z//mLjzOykqx
	uY26igStObBCu9R+I0B/jftkJDTxrr0kUNV3WeYOthuz2x/kdPNJ3w1s4RLI7Wgo5iiCcWb
	a7Nu1bx/U9YGmqXw41NRivfDkHDXf+bGl6ZWJ9JLAVns3SusdNIv4YAeogH0hdVIzXhcryR
	Ir4AcWfNScfpuG6CoQrqV1LbPBR2N06m8yAndV0lihDd7QaeP0bOjaZh5F8mcme1aI0KDR7
	A3UsHLocztq1VDGv7OKE8J8wFtay6a22PFSxTUjViRqlrbameAUE/lRu0XsGBiZTONS/ZdD
	BAg27eeFffSiV6clOiBdMRJrlcSdIxjWXGWL6FAMVBn28IJe11voV4qKY2/CID+HJJlWZna
	E7z4jDBJD/q/jfUTQvOh/LdwK8rwV5iAO690xyhYH6QhKteaj3th1tTINta8ipNYnwBzX8H
	OvkqPgFMY3WlFiHoeKs2nNGB7fx/LD+l2hAhweOHjPcHDlENjk
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

The size passed to dma_unmap_page() must match the size used for the
corresponding dma_map_page() call.

Stream RX and TX buffers are mapped with TB_MAX_FRAME_SIZE when the
buffer pools are allocated. However, tbstream_ring_free() currently uses
tb_ring_frame_size() as the unmap size.

That helper returns the current frame payload size, not the DMA mapping
size. On the TX path, tbstream_dev_alloc_tx() stores a shorter payload
length in frame.size when the payload is smaller than TB_MAX_FRAME_SIZE.
This happens for a short final DATA frame, and also for the CLOSE frame,
which is allocated with SZ_256.

In those cases the buffer was mapped with TB_MAX_FRAME_SIZE, but
tb_ring_frame_size() returns the shorter frame payload length. This makes
the dma_unmap_page() size differ from the original dma_map_page() size.

Use TB_MAX_FRAME_SIZE when unmapping stream buffers so the unmap size
matches the DMA mapping size used by the buffer allocation paths.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/thunderbolt/stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index c1f5c55583d0..4cc86d8d6491 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -257,7 +257,7 @@ static void tbstream_ring_free(struct tbstream_ring *ring)

 		if (sf->frame.buffer_phy)
 			dma_unmap_page(dma_dev, sf->frame.buffer_phy,
-				       tb_ring_frame_size(&sf->frame), dir);
+				       TB_MAX_FRAME_SIZE, dir);
 		sf->frame.buffer_phy = 0;
 		if (sf->page)
 			__free_page(sf->page);
--
2.50.1

