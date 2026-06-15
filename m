Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE45F2DB7B4;
	Mon, 15 Jun 2026 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514276; cv=none; b=jL9ZCt6EdNvWbjCnyVGCAQ5E+MOEaj06wE5n2tsJJeX+r4gMj82obijnd8F7uFmDCWr3KxlOrj3CSq5ky5RzMgNMQdAxcm9WnV/vJ5w5k0/OP94ozbDeInJmQS+O7iPFWoFA69kHyXqW1BGpO+NayyXVLd/d64dnlgqLcwwZBD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514276; c=relaxed/simple;
	bh=Kjq54gnepljr3inkvCu8Cn2aF7QFYpExDg4CUovBw5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AwrEGHqSR5deMtRiObKRt9uJyuVf2+TJH/72FTCDJxvcWT7di9mBjttFzzPfiEoP9IC/LSd/esJDc/dy/Z5oJmOgADcp4+UYnHrefuS9Z07DzJ00xw1qlOdiVDWpSl9vY0cfC72vbRriQBGKLdUtOINUJJbxae+pwHZakIVb1V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=atH3IDUs; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="atH3IDUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781514248;
	bh=EZiN2SrOUL6TUvZ9WYTPdGQOJ4W3jxSEwX6kUVBN/7o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=atH3IDUs4jpGEi2fGG8T2QQB9orW54iLtxOy08QvxTCKs5RklvfcLm/uTGdWNH/N9
	 OFSQ5BVS2tCNHLwGfEe6b1I4XIIa7sE/YO0ls7f4aPzNlQRq46Lh4odxtiNm7zpZjl
	 GchpFwNncWV7nTIhT+DTxvM2/ibud2zBLTnvEGsQ=
X-QQ-mid: zesmtpsz3t1781514232t3dd523f3
X-QQ-Originating-IP: mIwBwtNS0AEDilduLOFWC59En8W60eVpsE8I/O3TOkA=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Jun 2026 17:03:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11783087623038272413
EX-QQ-RecipientCnt: 6
From: raoxu <raoxu@uniontech.com>
To: andreas.noever@gmail.com
Cc: westeri@kernel.org,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] thunderbolt: fix bandwidth group reservation indexing
Date: Mon, 15 Jun 2026 17:03:48 +0800
Message-ID: <1ACD3C00B2C83FD0+20260615090348.3058017-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: NzSDQCFWCzVTVdJ1pbNSV0uHuxjqH07fMOkUr4wsEVYjtD5k+DcVtXVx
	xHfpE9gMQ0kBUTKXaYfh3HyPLcwxoQHhrxwD0y+cElXioA/HDnhOw9gohEpa6Y6MAmP0tN6
	tpEwElY4+72PifMhQQbfACkX1SUC1G8HBTaQg+0YUWcLrzIogahozzWtE6b5LTNxrVPcRR7
	Rfb5W7iVU8fD0jjjqA/2VLq3Ex5jdrqXX153xfVq9Xlgcp/yuso1U+AAeAmSoTqwfRe5jAQ
	USU/JkWlofQcKGPIhEkGwKtQcY7uaFWKVCCqzvzFbbOPMgt3xtYwRUg0wo93DvOth0q3u60
	F5yNvtE5sgF7u/+4Y01jZlir80o7JDoFgKw6woQCZeFmwKF4Nk/5CEsCJHDUxMZLYmlc0c2
	mqj94TatlQq7Iqv3PTCzUqPvuVKZxN8mqjhMHGUF+0o7KZVDSrZx0ymNZKGBt+PxXnzFSop
	omrx8sg+n8+s7TMyxqFJdJblHtjv0Boct6uBR/RsAHlAy5ln/Jv7keKjW76WtpnsAA1lUsP
	rhwq3SJIwN0GgFh4S16mNgZE/HsQL4uRP82WHdlQwgPx8GVQcLP+mguDfFREhhOxpQTjqKU
	62aKmGg19cK5V5S4GjfU6EZQX7MYmqZrfuLGeApYyNF40EHpOHhx2gdrcgy2IXIt+IcmWsq
	wGfdTdQbHNfsPeJK+ajc/toOyFk+7OHwHrOEBmBKhFWx3mrZqrmiXaaoY7nhrSMTn0wtPxH
	SBFNzcOyyufJ7WkEzxUqvZ4Ygcf11wZP7M+ELyuwDNMD521bynW64JyyKN3nUBao+W4yyP4
	eGpt1PsUHze7sbtlYh4adWv4QAENsAst8BJk986nT75e5UuK1/LBIYukgCLUlhv+xlhmLLk
	HJz40+bBQ4nabAGn3jjXieunLzZKo0XFl7ZcMZUAtMlmnhrZat1vgpP/0ZCZQrFzITWNQeM
	JCNqRPPbLSbTAU3U+S68Iupvlc7HSFasBZtn5Fxq/RPOH1qpnFpmk/gGbSUlz73V0zCob9u
	C7aeRlDKFkmXXMbjiGd5Q3JBGMw44=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

tb_init_bandwidth_groups() initializes each bandwidth group with
"group->index = i + 1", so the valid group index range is
1..MAX_GROUPS.

tb_consumed_dp_bandwidth() uses group->index directly as an index into
group_reserved[], which has MAX_GROUPS elements and is zero-based. This
leaves group_reserved[0] unused and makes group 7 access one element past
the end of the array.

When Group_ID 7 has reserved bandwidth, the condition reads beyond the
end of the array and may also write beyond it. The reserved bandwidth
for Group_ID 7 is not included in the consumed bandwidth sum either.

Convert the Group_ID to a zero-based array index before accessing
group_reserved[].

Fixes: 52a4490e89d7 ("thunderbolt: Reserve released DisplayPort bandwidth for a group for 10 seconds")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/thunderbolt/tb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c69c323e6952..64b481d2b4dd 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -640,8 +640,8 @@ static int tb_consumed_dp_bandwidth(struct tb *tb,
 		 * tunnels in the group).
 		 */
 		group = tunnel->src_port->group;
-		if (group && group->reserved && !group_reserved[group->index])
-			group_reserved[group->index] = group->reserved;
+		if (group && group->reserved && !group_reserved[group->index - 1])
+			group_reserved[group->index - 1] = group->reserved;

 		/*
 		 * Ignore the DP tunnel between src_port and dst_port
--
2.50.1

