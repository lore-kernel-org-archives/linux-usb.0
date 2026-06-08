Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66301E2858;
	Mon,  8 Jun 2026 06:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900364; cv=none; b=IfrPnjmutVqG/WkT2ZngF4erj/9hRwjG2Lj+jnFPopbxazXfazOE+JB+6HN0QQjLzh1q3QqC4ANo7DXp5zTtpB/acE5pZM9LIJvRcc+kyvr5O41i78z716vUulcgvvnBLKVOVvYJvrbXnTIAi3ej1Dep9P7OloaZARgTwlygxRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900364; c=relaxed/simple;
	bh=rCV1Sy289Q3pqonqWXdWbYjJZnXELv8xnUOZLUsILaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ICaA7mBbk93nKAWsWZAWPZR/5uo+v/baNcmSs8lBhLEd0xSqCXnWPCAWs9gIV9qBLbKqyrPLQGuWmXRFg5B0VjZVI2xTwtbu8m/61deFnyyhbHblZDLN8FH9+7DT6/UitwEhBCZxiCV1aNlaqcJbBBYVZhiEx3Nq+7WtHJ7RHGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Hm05z132; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Hm05z132"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780900327;
	bh=ksZB2/GX3gUlIEnHuom5++39MiBF0v7l7oMVxtOJcvM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Hm05z132rTk7ffVkyPJtCzgbNw6GNENeaVUHLLhqyVJ3ihWmcNCfa5ZKk7ZIpF4KO
	 P6XANJQtdCI/zUK6cCMZm/+URl7lDkrKw5cqdHvfZwPemlGsNmXmirFPQKH26DyhC3
	 /jHj5A2FHKhm7ZUTwH5/GGoDP+9NXWDNFTmGFrGY=
X-QQ-mid: zesmtpsz7t1780900311tc1a75f4a
X-QQ-Originating-IP: KNgkMA7M6tP1gwCxuz9rHXtmMPUo/fXXWUcccwilUi4=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Jun 2026 14:31:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 981993511686728096
EX-QQ-RecipientCnt: 6
From: raoxu <raoxu@uniontech.com>
To: andreas.noever@gmail.com
Cc: westeri@kernel.org,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] thunderbolt: debugfs: fix sideband write size check
Date: Mon,  8 Jun 2026 14:31:47 +0800
Message-ID: <E4D8CB8444A9950B+20260608063147.794444-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: NJmTK03TIqERi1rNFv6dLm7IwL1XQU1ruixnzplr2t1D8D12VMMOtiIs
	AJZO8nR1D9CH99LY++G3txU6C9VcPiqpiPQEv1cAH8ePPR9rhOz7VoseiGKggX2bsl1RGJH
	ccBUQwPt8An7PTjYoWbrx1wrXQvydT/BGPhjqqG/2Sxfoa2Zf79/hS4k6RxnaIIVEVPMtlp
	7cEFHgZS2rVnCh6C7w0SxyN3PV4h3Bdhn67R1hih+j3UxAXqKII64YV+FGffTVhb2UmDJai
	bro2TpMAQ9Eb81xTyZ8VbelhcNdoTcJBZP/hr2ek52ximGcvIKV+8a4Y2nEw4Qwn9DkKHkM
	CzVWm1fzyjU53TgPTfhFBg/onEQZ8RH3O7kiB16Onc0hk50Zr/KyDj2DV7ED684t33gdpv9
	DoBqBzcQz58cNFhtQLRN0cX6JO3UKH1wTuLjSPhEeSKgNT4FICCt3TibMyzKW4NSK/huG++
	hFmdGHez4nPbhdxno4B5sDbCFvogmPUtb2xHLbMPUjRYAKXV1zOEEXc+D5Ggeo5Hn5Mo+QV
	1UTkuS2N35sqhyGaDnZeIrtG6WqAih85iKG6vUk15djE48bQdebYIWxPyXXyK5sxmUFr5bu
	bemauEJuyTTZpQ+hzrcAf3fQr5/HVj1kdCNl17EJMau7y635pHBDIeGPgpGebf0/ixuXhiJ
	2APYF1wndHPP5Udw0TMK4Ghuz0CkPycburBXub5bzcKIfaPI1qNZhjiqt8vO763ylYFdhE4
	cpjJwdjHBh1YiX/HUxxNjgMm1A3fWLP0F+z4AkK9bcpOSqqe0zp9i1mgN8WFhUq1GlUqGXB
	qK9MNOy2SPw0r6IKHcQoQqih+db5XyaNFjfVGRMRikue+pRRmyom0Zfres5xZQzPb8eiJg7
	nmmvdxKPISao8dRAJSgEMYtLhLYN+s7zEOGtbAhFlvpvNZwgyzlY2LO7ktUc+ss6jbEWkM4
	7qeMzDQjlXBYx0mRymz5TnXnc9Az8Q+HwrgTZmu4wBVzOXtFBa1nVnDPJDpmQvAx+BEx5zj
	7n1RzA8c9ebHWzI/gUC37eb4yYAd0VWULfqT8Q74nSYbqwgd+L
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

sb_regs_write() looks up the matching sideband register entry before
validating the number of bytes to write.

However, the size check uses sb_regs->size, which is the size of the
first entry in the register table, instead of the matched entry. This
rejects valid writes to larger sideband registers such as USB4_SB_DEBUG
or USB4_SB_DATA.

Use the matched register entry for the size check.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/thunderbolt/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 25f6ea6ea094..45ec31e2d040 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -366,7 +366,7 @@ static ssize_t sb_regs_write(struct tb_port *port, const struct sb_reg *sb_regs,
 		if (!sb_reg)
 			return -EINVAL;
 
-		if (bytes_read > sb_regs->size)
+		if (bytes_read > sb_reg->size)
 			return -E2BIG;
 
 		ret = usb4_port_sb_write(port, target, index, sb_reg->reg, data,
-- 
2.50.1

