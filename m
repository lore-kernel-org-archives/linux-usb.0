Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B441428640B
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782665472; cv=none; b=f7Rk4KBIGIF0pfAUZQaF1M88Oh5cipmLa9HYRe1lB3f+IJ4f9jgz/LZmf+QCGwcfsSOEOXX70Jbv7tWI9KJa7XwWkBaeppGR43A+ItnLbrWnTH7G4VM5qN7j22GH2FmaSgxiEqsXxXe/bjGIHkCCizFjqcVYzba9eaEcoHx5xF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782665472; c=relaxed/simple;
	bh=DLZAG/jvCuQ64ytJWF+23hdM2Ezj9VMclpD0ZpWkC0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T2YME1SQe7//KHwo4lsYbsyg3G5ZatM+6WIjV2tHQ3VG6F3V8r0RWH7DuwUyQpPyxRtxUQ/BLcNAnKPEC/kZJjUAR97ZmYBH9FFL8mYKer8iVFN3dDlBATChl9MsNsof/sMbq7t23P9oBRYXxpqDpdjMYDxkQXHW6cJniR4XF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oj45Ka7L; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oj45Ka7L"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-472a14c9965so519838f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 09:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782665469; x=1783270269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZzhdJwd+CLxmg2Ls3OFaFn+ZKd5IWUX/1g96vuNOVc=;
        b=oj45Ka7LGRJzLtDsp0ktfDcVVC83WK40NJ1Xxne3QvoLcx6srQ8jAWrIrN2Xp/1Cim
         r7z/XYBy3YXeXB5bO8VtUamDQMs0jFvsFNCaIjer7jedPrGc783551ICec1R2DxSO+HT
         +53N6VqCNl7ttvk22aWprIPW0NqtyRA4UkWmMrojhCSwXVkk0wT7BdEPocPtreJLAJ8F
         rrKA0y3UMWwazS13cAu/4/GFr7SW05Ps5nvmlfIrprLTU7bJmzN/WH3fRFqhzFy7y92Q
         T97tWK0F4arPQfFkcHFKfskiIQSOqtMw5u41ebDTp6F3GZVDjbvLYSazkwYaOcsAP3Jb
         eH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782665469; x=1783270269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZzhdJwd+CLxmg2Ls3OFaFn+ZKd5IWUX/1g96vuNOVc=;
        b=f988Uo3DpcMFUvJyR6CWsAhTDFEp9fwdwY5LOl1JT9cyIyYxzd33WXOeN1u4oAveQu
         Sb0bbN+KqhLqFepiE+709i6EHZ8G8DjCk5Fcu0ERO52Y5uAheOIFhN784GGkFTwKv2cl
         i1i8ZaX8/47PZHdkT7PpUPRLpQgDCNQuJ289WJmFTDUlLjnUUB6JzhZjfrcaIc42KIsb
         7fXfz8dLiYlhNm10IMLAPG97lpi1jqLOTm6nyb4Rl+gT6k62Wbxi3E49Qs+r6oQ5iPR3
         1wounBLJVXSlISWNEnMr9a8VuyIpnXVGkRtncLeyTXCxmvgSvha72n+VZG4OTsrCEkWy
         WsYQ==
X-Gm-Message-State: AOJu0Yx+bZ/uJFIjB1Rj304EDrjVehi25xisGJGebmwBJa9D3gnOr1ca
	oaKC8rke4X68LupCRyy3GgHAKYLRNIKGMat3Z6pTEQN9V6Q1VErFQJ4vlMR6nF0DyTXRcg==
X-Gm-Gg: AfdE7cllyCU47kbPeEt/DQIUTbfjkRs2YG15ZexeR3Rmvl3nGvu4yaMS4xHng5Sd+TM
	YT/OMlkUXcBlgLa8eJ6d3zk7CqwqdKmW2ZMSYjnogkHLCbsWEweErGi6ngEWtFUCM3kjpw58r6y
	z9BRfbiM+BXYaOvxNQgY+69BvSoqZx9T5lBTbYVILHXLnRyH+SyhZiMfx46jFwE2I+FmL2QWkCO
	H2UHb1sNRkZRPHQtWDMGQdCmu0dBBzb+nh/3t0fBkWMcP6OvMA2vAw49KG4mU0JRNcy2tWOHTXP
	SnkgB8KUGtVQMQqFS0K+5Ccf63Tcy0aHNJXsLHLArkyS5Qt+Og3bkku72EhW9lrH2NwUWVmfTnI
	LM/eJSV2ngmfIkld6kKroRajA0cXP1BdCFJ7wH1OD7GXLBsj1XklLhX1zNMw1G1SVVa4/TbsNWw
	G5pwhulnrdZVk4Mt0lvg/v+OYVtg==
X-Received: by 2002:a05:6000:2485:b0:460:e0f:8d19 with SMTP id ffacd0b85a97d-46dbfe8cd80mr22542385f8f.9.1782665469170;
        Sun, 28 Jun 2026 09:51:09 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-472de944719sm7435499f8f.2.2026.06.28.09.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:51:06 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH net-next v3] net: usb: rtl8150: handle link status read failures
Date: Sun, 28 Jun 2026 18:50:33 +0200
Message-ID: <20260628165033.17842-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_carrier() ignores the result of the USB control transfer and tests
the stack variable supplied as its receive buffer. If the device rejects
or aborts the request, that variable remains uninitialized and the driver
chooses an arbitrary carrier state.

Leave the existing carrier state unchanged when the link status cannot be
read. A transient USB error should not be treated as link loss.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9db6c624635564ad813c
Suggested-by: Petko Manolov <petkan@nucleusys.com>
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/net/usb/rtl8150.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index c880c95c41a5..d51e43170e03 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -732,7 +732,9 @@ static void set_carrier(struct net_device *netdev)
 	rtl8150_t *dev = netdev_priv(netdev);
 	short tmp;
 
-	get_registers(dev, CSCR, 2, &tmp);
+	if (get_registers(dev, CSCR, 2, &tmp))
+		return;
+
 	if (tmp & CSCR_LINK_STATUS)
 		netif_carrier_on(netdev);
 	else
-- 
2.54.0

