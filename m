Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D12E3AB29C;
	Thu,  9 Jul 2026 05:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576092; cv=none; b=Th+haNeEa6dccPKvxwIoU7rsEuwnqebkVQbbosI/U59/j0wW6XXHqPX4TtnUlm2pwO1xvcAHe4leAFrjvOJgbakg+4Cz5Nlycxgxs0e9N1Fm3flT1UneIgJ5tHOfxGeFlAm7XsNnHUSffexYolu4Dlt5FeDwkKZW8QvKyw0U8OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576092; c=relaxed/simple;
	bh=A7RqKK4rjl++T2Jq0TIEWBs85+//nrCmadkImFGpN04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kd/RFYaeQTxD8QJQjx+hVSVvbyNEYYdzZptptrM6Up2lWS8qitz564KAH8ZtSwVJ30xMlPcTyjdwwuaAzM92nBztMnmx5VkYMB9HOVH3zyYuzAkwAHgckirHLPVCEtGmoy82U8FT0Fvrogv8ibKyQ7VUpLiyjxC6vhjUIFP5dSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=mMnzexXf; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="mMnzexXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1783576027;
	bh=X2xdvuzsMxzeDpWgHv5usGbIlnKPmKxvX0nPcoNXJ+g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mMnzexXfe1atcPXEHA3gNkCGI+bMWRIIXcCEmEYEBadqiPhFwazCsbsD9LO6P9qHf
	 QI+usFPzPPGE9PLAjw3tp1OqFAdUCPL2L8WBzP+TuX0Pwukd0sP1QUoi0rakmcJs+C
	 ehsUUwCF968+lzOQaI2rTtupKLXFQahNCzoR0S7g=
X-QQ-mid: zesmtpsz4t1783576010t8997f176
X-QQ-Originating-IP: AgtJ4PjUU0QYfAY97ftk5pefNc53YbxvU7MKepfbZRM=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Jul 2026 13:46:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17075756925530812036
EX-QQ-RecipientCnt: 10
From: raoxu <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: mathias.nyman@linux.intel.com,
	sakari.ailus@linux.intel.com,
	michal.pecio@gmail.com,
	johannes.bruederl@gmail.com,
	kees@kernel.org,
	dengjie03@kylinos.cn,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH v2] usb: core: config: fix SS companion log for interrupt endpoints
Date: Thu,  9 Jul 2026 13:46:41 +0800
Message-ID: <70C90942668659F9+20260709054641.346797-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: MvyKdZyVtFx3ogxxWRGDkb3eXo3jQDlcPObrYATBwqyDUCsVsoEe2Pvb
	TRTima7SWaUD/gAH0wr127ezc2qTkxhVnlyX49Ev6KU9mTbj/vBujk9HP9ttI6I2xXLaSMk
	F0jB97cnm3G7vzHBr5CslPpDYVuooz4DwD/++utcoXMTz1PJnTVwa2jb3BpwQPCFvCCpW5k
	kA3vtadmF/Hwl7OK73UWCG4gvccyWWfSuZuLNa39FLSvUyvb1JiskCRXcOfJgyq7vhVNNQO
	f5nC17U4bXlwWpE1P6QIAkgyRh6ygsObMIrUU2myn0FQhGT7+7tKJIVRhREh09a70ctK5vg
	4QklN/TepfpnZJlvct/Ov2HUZBN7Q6MV4KB8KOOHgkewZd7a7j9rGFXD/UcC9AuU7ok+9sl
	Y7XFbDjHXJLLyzxHgTr+kX2y/y23XqJwpRso0ln9+eR/ss5OltQsovSRxCWZwU11Cl1tivb
	W2hjz5yUsKkR6cjN0UvQa4qOajy5UveFqaIP9fz9Q4ZcpZoaCkuuKL1UT4rj4tKJq6zlYih
	v3v2UiZxnygyWGMGCbyo1TkzIiDti3AemI7roGQxad2xqAF6imf6BVdDW64NaJTrxKlBw8G
	HPcUltrYTSU1eomMIhlFjgZCW+rh+BuJefmWxh136lVtj/Vffm6MovVT/NMp4uVFqVaIvau
	ZQaDeagCja/RyshnoYdkD8KYJTlaywUng3Ck9XBFQ/9NCXXMrjdhc5WSA4gBW7SJXvNDPXd
	cIa2A7s/8UGarjNSH2XLzqPQrpS6mgPzSjqnk92CEkZ7+gkX8vPK9AFixQwURs09R7o2XlN
	fAO/TmgXdOpcKbLzAmxWr2SyiPOTSVL93YPcVzQb5/J5E6B5EZ42WeFuwhYwMeue5qB3Fp9
	384xiChc0KOwX0djN6DZ/oJ9C8ZLzor41Hz+MoxWrH3XvSwDL3wh3QLkIs1or9J/EVMlggn
	HeeM8cQSBdCvSo1rn2O1kBKfEF/HPU6NoWYL5GAF9Oc2pu4l9tG88JP+lyrRZPQ2+3YABeo
	X1eELl/LaHS4Il0MmXl/PgoBnWlPCTzvOe9B2FCnGsbGzAGxgifm6bNVAg3bU=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

usb_parse_ss_endpoint_companion() clears bmAttributes when it is
non-zero for control or interrupt endpoints.

The diagnostic message reports Control for control endpoints and Bulk
for the other branch. However, the other branch can only be an
interrupt endpoint because bulk endpoints are handled by the following
else-if branch.

Report the endpoint type as Interrupt instead of Bulk to avoid
misleading descriptor diagnostics.

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
Changes in v2:
- Rebase on the current usb-testing tree after the endpoint address
  diagnostic changed to use 0x%X.
- Add Mathias' Acked-by.

 drivers/usb/core/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 45e20c6d76c0..cd3231d21090 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -151,7 +151,7 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
 			usb_endpoint_xfer_int(&ep->desc)) &&
 				desc->bmAttributes != 0) {
 		dev_notice(ddev, "%s endpoint with bmAttributes = %d in config %d interface %d altsetting %d ep 0x%X: setting to zero\n",
-				usb_endpoint_xfer_control(&ep->desc) ? "Control" : "Bulk",
+				usb_endpoint_xfer_control(&ep->desc) ? "Control" : "Interrupt",
 				desc->bmAttributes,
 				cfgno, inum, asnum, ep->desc.bEndpointAddress);
 		ep->ss_ep_comp.bmAttributes = 0;
--
2.50.1
