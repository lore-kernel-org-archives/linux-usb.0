Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A19D3B7760;
	Wed, 17 Jun 2026 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781686788; cv=none; b=ZgVSukzakci1OR2LmSXtlCKhMkNmw2sbXS9IO+Kdl2Ep8xq7ZpVoc2W2luhelUPIxpzBvDj3EGirhorPnvkgq3l377vqNxmuglzAItUNspcGeE7jpDLCZutYzturAVmvI4iSRLPtlGzAkhC9Ht5vGvrGBMHgQE/UePjjM3wuhCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781686788; c=relaxed/simple;
	bh=i+pQKXGUcgPKUzvbQwHL/hm1XTmlhqYpkFDI4LYaTxI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SC5fseeQ7UnIWIPDdyaYR29uoQWV3cGQzqW5gJ9q1NQkw6T13nTGX+RdKa/+D6aDB89Q7ocIaHKhIGKukM7gSfQAG2Kt/qX/AqAi+TtfEmtjg/CAjbMj85QzZu+7kBc+WW6AqOmjQZxI11J1kRM/nB0AdIaRs//8DN7a2RbcokQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=XwQjN5Qb; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="XwQjN5Qb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=e/8o+urkQdir5oSiiAqoJ1zlhz0zqdz8NUBU/Dbm8sQ=; b=XwQjN5QbnoUsoE
	4Uh1yOuSw6Hww5xeaSh3g1aAySj/WUm7H5AGJSGZHuivoNNNS+LDUVcjKsBjuKKPeL6bAl66NViSD
	UtuXTmSx3OrTwLOIZS8ybbP4JY03aa/lt10Tqfgy+x+MhXpnlMYQkbz7XV+mdeuPn9i1ARAuHgvS5
	WVqHnwNCHkXUYt8q4/FxEMXmci0+CzmGZ0gasnvwuwmBsQcuDQdctU3ulrQuwTn4HY71u2i+nDvxz
	2wmhNggm6r0mQackIupU+zzupqGAJCSgJaGQLQRjbpWfkPdUtM/YxbWTEEPXh1Yan5dB+b9hb91ea
	B+UFqRtpwVLMviklX4Bw==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wZm7Q-008NBU-Ue; Wed, 17 Jun 2026 09:59:33 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wZm7Q-00000002z0J-2Vns;
	Wed, 17 Jun 2026 09:59:32 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Sam Day <me@samcday.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] usb: gadget: f_fs: fix __le16 of wMaxPacketSize
Date: Wed, 17 Jun 2026 09:59:30 +0100
Message-Id: <20260617085930.711146-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

The wMaxPacketSize is __le16 type, fix the sparse warnings by changing
the type.

Fixes:

drivers/usb/gadget/function/f_fs.c:3346:32: warning: incorrect type in assignment (different base types)
drivers/usb/gadget/function/f_fs.c:3346:32:    expected unsigned short [usertype] wMaxPacketSize
drivers/usb/gadget/function/f_fs.c:3346:32:    got restricted __le16 [usertype] wMaxPacketSize
drivers/usb/gadget/function/f_fs.c:3371:36: warning: incorrect type in assignment (different base types)
drivers/usb/gadget/function/f_fs.c:3371:36:    expected restricted __le16 [usertype] wMaxPacketSize
drivers/usb/gadget/function/f_fs.c:3371:36:    got unsigned short [usertype] wMaxPacketSize

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 75912ce6ab55..35d885178b52 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -3332,7 +3332,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 		struct usb_request *req;
 		struct usb_ep *ep;
 		u8 bEndpointAddress;
-		u16 wMaxPacketSize;
+		__le16 wMaxPacketSize;
 
 		/*
 		 * We back up bEndpointAddress because autoconfig overwrites
-- 
2.37.2.352.g3c44437643

