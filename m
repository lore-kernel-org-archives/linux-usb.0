Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85863349CE8
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385174; cv=none; b=XeeXHNGdJAjTX8WM8r7SMCOXYsoe9uZBRYxDn2R6I39a2PN1n5KIejTV7hWWjnWcmRN4UCEt6p8Db1RAJpjlvrFw5VosNhZBCdymCJxInJ2EmawDE9UYIRqipr14W6uLdlRoAq+XxW1wY4t393A0pERfoy2FMerTzUdheN5ENsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385174; c=relaxed/simple;
	bh=XgYVXwC6Qbtpg1jrCFNAUGWaPBGKnylLGiRS03qHRuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ufet1uBWqoOZIH0bsIER6IwABqMVEUiocSPmk2gO6h0BEWDWtahhPJ5Mfv0aoSzfirWJEGexRROveDoNp38Y981b+ZMLF2UQ9GzW1jF7b9AHrUcL8LnYSJ80r2WU3HCZsBlICkfQBNLSfW9X0vLNs8Zmq54SjeVtzii0bc6YuCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPx0Q1YU; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPx0Q1YU"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51bfa429aa6so16524891cf.0
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 00:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787385169; x=1787989969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGwg1zuDZKdGriy8KZp6u78c5XQmmAncdFIw6xyowec=;
        b=iPx0Q1YUwDzRvZpfNK5FadAiUeQUPrLA94vZtVeRO1wVwdH1R4SD7yPt2yxafyBFfV
         wW3CaJUqW6j2ONyPpEoqLMEDbPfd3AXYcCFbkb43sER7WfdMnUy5POzAsV4dV8KOxiaL
         pJ2WsTiNP332xNE0mNTqzjR5o4Myl1sCvJa/Uy3dz9aiEj2xPyitFwj5PIru/SKC0Is/
         wWQNkoSHxCgVrowsrsbpQBBWYclSA9O1h76RFNy3dsxv0sZxf/MQmkyq6Ph81k68DmrQ
         lVuao/ofdWgpeDUTyLhP7LANkchbMWfuDNQN8Be2fVd/bw10MlOn8mCEWn4n5Kmq9CQY
         sNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787385169; x=1787989969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGwg1zuDZKdGriy8KZp6u78c5XQmmAncdFIw6xyowec=;
        b=WkP0oJdJ28XCA29p4rOtSSmUWNocqhJLWJiBg+8oO22JoLfESmTu3514aQOQv+z9t9
         4TZAmaHbpvJFG6/TYrrtp4ptmpPrSr5XKZNJ6eBCUoRd49VKmuExA8dwJVJTjSaEw6aJ
         /e67KBReJXsCphmgJhG93P02NCn3czeAgSAcr95JsAXedyzb9kwNBAWG0+kL9sRE+2sw
         mvHpNUN38LK5SLNkREC8cdoHHlSn2jjRk/L8KkEV0VPZEe8WOaJzekRGZqCVxsZ+IVmj
         Zzr3Is6DWVopqEFVybSWFPdQTa9A7KBS1XXD+iZfrxIcf7xvp6WkmQAiOJljrijrzXpj
         GbDg==
X-Forwarded-Encrypted: i=1; AHgh+RpEnJZD/f/Yit54alDslQ8auiBUZBF24D5Kw5zVftOBqhPH/Zd64l3KfQa+Mo9hnIQT0mgn8soa6Ws=@vger.kernel.org
X-Gm-Message-State: AFuF++kQEM9w3/hYVCHn6hO7JlGsrRrzKCRrLpr5Ui6YTdDxHB78Q/Aa
	cwgAWcoswWmHCpF79GqC+dAlJX1EmKT5zjghD85bSvSbZGhOFBVzKKwv
X-Gm-Gg: AR+sD11ZH2pRhmCM/FMTItOTeIJ+dbRhg57vFGzuc8efw9SMUW+dMNPVOHMX9M0mtWR
	wWX/Wi2GovSwkMz5hczNze8LN532sd7eDDBsiolN64AiT+6LSniVh4byo7QD4iDM8FOCmESLbdL
	ZRP8tp4fmb005je96N1/3j8P4VphT+leYzHpJe9X6+068806bdjVkGep+Q9qXMBUbMz/2zbyoiV
	8cE3iZRVPeWSDOjjevVbm2hGZ/jalj6uP5eY9hpq1yo3oumKrwEGs0DdbcF+KS0Lq0pGRaPndbj
	9utdpemYZAM/t4vw6H03U94MLF0rJJOQiryE2fiYmSZIl7l0UTN+MH+/hZmmV6H0bm+jEE3Frbv
	PZbDLV4ruWQmRd8Nz6nFxyvq1qZyuDmBoozOAmdIxEj3vzk5L0gXDBjdpzRygPobpIVi83jA6Zz
	Rt5kLGbcekiCE1fiZJBFhi5QJxmycipOVioq81Ff422xpwjhS3bxxYUuhndZJNG4c0xvDJ/bA16
	ifvzqtw2CzuItwKCMfcQm0IAELuDmCxgHwc+eNZ0jz5XIVTHC/IrJQ=
X-Received: by 2002:a05:6214:2d4a:b0:8f1:74b0:a4ec with SMTP id 6a1803df08f44-90c811e5bdcmr112300816d6.4.1787385169528;
        Sat, 22 Aug 2026 00:52:49 -0700 (PDT)
Received: from KernDev (pool-72-83-148-136.washdc.fios.verizon.net. [72.83.148.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a5e82asm8436346d6.40.2026.08.22.00.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 00:52:49 -0700 (PDT)
From: Alexander Bendezu <alexanderbendezu10@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>,
	Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Alexander Bendezu <alexanderbendezu10@gmail.com>,
	syzbot+3a0d6aa450317f25e501@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_phonet: fix out-of-bounds read in ifname_show
Date: Sat, 22 Aug 2026 07:52:30 +0000
Message-ID: <20260822075230.70609-1-alexanderbendezu10@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The f_phonet_ifname_show() function incorrectly used gether_get_ifname(),
which casts the net_device private data to 'struct eth_dev'. Since the
Phonet gadget only allocates a small 'struct phonet_port' for its private
data, this resulted in a KASAN slab-out-of-bounds read when accessing
dev->ifname_set.

Fix this by safely reading the network device name directly using
netdev_name() and dropping the u_ether.h include, completely avoiding
the invalid struct cast.

Fixes: 0736390bea65 ("usb-gadget/f_phonet: use per-attribute show and store methods")
Reported-by: syzbot+3a0d6aa450317f25e501@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3a0d6aa450317f25e501
Signed-off-by: Alexander Bendezu <alexanderbendezu10@gmail.com>
---
 drivers/usb/gadget/function/f_phonet.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
index b1ee9a7c2e94..a17e74bcc07c 100644
--- a/drivers/usb/gadget/function/f_phonet.c
+++ b/drivers/usb/gadget/function/f_phonet.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/device.h>
 
+#include <linux/rtnetlink.h>
 #include <linux/netdevice.h>
 #include <linux/if_ether.h>
 #include <linux/if_phonet.h>
@@ -600,7 +601,13 @@ static const struct configfs_item_operations phonet_item_ops = {
 
 static ssize_t f_phonet_ifname_show(struct config_item *item, char *page)
 {
-	return gether_get_ifname(to_f_phonet_opts(item)->net, page, PAGE_SIZE);
+	struct net_device *net = to_f_phonet_opts(item)->net;
+	int ret;
+
+	rtnl_lock();
+	ret = scnprintf(page, PAGE_SIZE, "%s\n", netdev_name(net));
+	rtnl_unlock();
+	return ret;
 }
 
 CONFIGFS_ATTR_RO(f_phonet_, ifname);
-- 
2.53.0

