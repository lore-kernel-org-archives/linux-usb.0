Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAC844CF25;
	Wed,  3 Jun 2026 10:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780480904; cv=none; b=Grtw70JzJpigMJ+9PlLcdaWXiqkYi7+YD3mG3BBsFVaUJerfFWKpVvTxklrnzhXmBoE9nj1sTYaIjjMC//4KtEgjtFq+WkdznnGXzJOL3ndB7/b5w5e8SwjSrP2ZaJMeLOUMszjVlpwX0FuaCVZT4TyMTmabS7mHAogLtFtQTwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780480904; c=relaxed/simple;
	bh=9HniKuJTweZrT2GKcDlyNZg1leqFl62U2Sd1Ydzbm8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ROocWS/9T3nFIK2SmQb8R0o7I+nQE6w0OeH8UnSI83cEFdxmiBJdLE2D7uy58J7nuNc7bA8gNXBIur75ffN6MgeUTMRvs1I7bDl6qg5fMGgMTQRt6KUEcwFQoWIOMOXPtbm5oUG2BHwm78FSe6x1T6otNr7728xrYy0/byV2obA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Q/xF1IY/; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Q/xF1IY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780480860;
	bh=naf49GqByxcoqNAdjt4netjJ8gse0CyYGuBLHKtZUXE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Q/xF1IY/2SjqHZKbk5XmCFPJfwCTGHu+v8Fv5eMIUbcRgAz1EGS5A0ENNCOYloVJL
	 3rDgRR+yJI9QN68D9psXWb6Qj7xep82iEXdhU8jmiNMy5HyqEZVz1X5HQ0L6xE0970
	 A4Y/o3A/P09cauNMVOdHHnqaMOPZxC0xhVdpZC/8=
X-QQ-mid: zesmtpsz4t1780480844t17236796
X-QQ-Originating-IP: jrj/gBtWK1zJFe+tihAQ2imGPyOW5vdWSFudCP7mpV8=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 03 Jun 2026 18:00:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7591530443748897547
EX-QQ-RecipientCnt: 6
From: raoxu <raoxu@uniontech.com>
To: andreas.noever@gmail.com
Cc: westeri@kernel.org,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] thunderbolt: debugfs: fix margining error counter buffer leak
Date: Wed,  3 Jun 2026 17:59:57 +0800
Message-ID: <5DD51F2D1DD8155C+20260603095957.1126008-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: N+n6UtIkOPCa/45xjGFuDTjewm+Bw2AzjDSWhqfnJchUeeMXsIOoyQLD
	s1GTdOPWhcNPMx0zaCLm5FYV8sOZhUQH0+gdDiTlku4J2Wlk/YqO7fHpQryTRQ4DTcYl5Vs
	NzfsSnF9zho5LrP2AgMZ3ZL1iLO5QWA482GZqLl9Vmq4bFTTOaaUzmmlpVhtGN2x0pH2R0O
	n4zUf2/DVE5/wF+GCNylw1YOj0Fp4a3JRe2P0Ej/uKuI6D1quTXFhwv3smqh2Z38/x1gXLt
	4yweDwFGVhMTBemyfWKQ5ERNAdXaDl+O5QpPwd1hAwneRAADGypHf53DGiXpZMlafNBVdLu
	B6GYtEg+Iu8VIHBuCDf4jiBF8jxo1v//Kobdji/jCR6ACLJHd/k2uWos3u5MxeZoPbG1+3x
	zJs28ONNvFjHhqN3poV9F0cafRabJt+auFJNLIdtN2qhTSua4WDdcpcD1a5NC8MkW/s6WJC
	91itXsgizZjYKQSJbrhCqNcwP8ZZ/LWSv+PJSBtgXM9n7h2qlHta6VV3MpKDX5zpPWbrCP7
	qMccOyMqByXb5qbUhbYj4Jzf/kNVNfStfLDrvlFTFeSBVKDjsfTPDtLRbC7Tbe7HKjU7KLs
	BsyQLvnfSvkLc318W20GSjkfZLUogk/inlgRyF4YWKYVV9lYfaR5qwZvq34fcz9Fh2aRii0
	zeDrvPsA3ho6RbqSVdIrmwXv/X3CA37+2VlSOlXYtURh+q/lS4Ho1tzfzUhFXrf0en7VP3p
	V02h7XVgmV33ljJz//f6ycGaBOvT/5O57406yXybkko5SDu/85Lox65pKs8CUYVYDu0hw9k
	5iyKYJczno1V2kPwNxjEmyzkxE7qmfO8m/HphQQYs/HGQMWBBIydFk3Dj4wwlnRX8kXtoN7
	o3qqEYMPIUxMNgK2Hxn6Cp9Lic/koFDv18YuwjQZQRdD0HiZgTCymLChd48bCPqzSorcB1v
	XAAqnxVOZzpT37o0qN6sqB9X42nq63+cU5WaImjQni9Khc2L4dqsbuUB6MIDAIM4P7gL0ej
	22YmELAOQMeCJU0qDft/KAnh7nGTUq7WKO1Q4e/wfCzN9UGbCo
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

When USB4 lane margining debugfs write support is enabled,
margining_error_counter_write() copies the user input with
validate_and_copy_from_user(). This allocates a temporary page that is
only needed while parsing the requested error counter mode.

The function currently returns without freeing that page. This leaks one
page per write to the error_counter debugfs file, including successful
writes and writes that later fail while taking the domain lock or because
software margining is not enabled.

Free the temporary page once parsing has completed, and also before
returning from the invalid-input path.

Fixes: 10904df3f20c ("thunderbolt: Improve software receiver lane margining")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/thunderbolt/debugfs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 042f6a0d0f7f..25f6ea6ea094 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -956,7 +956,9 @@ margining_error_counter_write(struct file *file, const char __user *user_buf,
 	else if (!strcmp(buf, "stop"))
 		error_counter = USB4_MARGIN_SW_ERROR_COUNTER_STOP;
 	else
-		return -EINVAL;
+		goto err_free;
+
+	free_page((unsigned long)buf);

 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &tb->lock) {
 		if (!margining->software)
@@ -966,6 +968,10 @@ margining_error_counter_write(struct file *file, const char __user *user_buf,
 	}

 	return count;
+
+err_free:
+	free_page((unsigned long)buf);
+	return -EINVAL;
 }

 static int margining_error_counter_show(struct seq_file *s, void *not_used)
--
2.50.1

