Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161E737BE93;
	Mon, 13 Jul 2026 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945724; cv=none; b=H8b7OEBzgsBhTuhrX1yGNwMbXneeySa+3xn351xV6QfdeGM3jgaIEXHo7hlimP0WGhpu66a0hiLLas/QOjzz+nBvLjIY6VIvttf2tyMRUYRGUVWRft3AkejwglF4XrfcItRJWF2BUST1F731VEqFnF6PzAna7APseXdCzu93W8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945724; c=relaxed/simple;
	bh=x8YYLwffgpYPKYANXa4Nn7hLKgjwYP2KvWp6M6FdTKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aJD/STGrD3EO7oRQEB+W5YhHljKZXgAOvyCouCm4zjJZlW5a3VaWB3xWszdluZI7JcFbn/5LgoWZ+sAhpzctskS50K5vqZKEPhzarP/VLebPVCzDKRx8n5q0ZnZE2UlVIMEXfZtVJxJAFSVkbamlQKZ+eT4O1PerURJJms7qj1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=NMHaGRhJ; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="NMHaGRhJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=TsyKjXZn+ctIT7sE13BOuXpqo/nsJHJbuuT8ejPDUFU=; b=NMHaGRhJ/NP38p
	r+Xaj5094ruu9xhjQWUh5bVFLj5miUlKSa+u21i/X3//Uo34hniPqT1GYnZK50jnoJJxaU9gj6bxp
	mfCK/QyKXWYRd9TiSboUvlGN0R1h6qBUpPs1+CMYIJmuK7bzjKivgn2pKLDlAb+EvWmp+JfxlsFbM
	QWN6C10xN1xdnFDGw4sE8D3JLX+Co9BsQBw0tLZMUuY43TsjhqnQILLwEoULxfAamoNfoYkmZcwiU
	E5ekhJ9yWibVR2tpGl6RzKXKOt2kyFbqT7BpYGkflPB7OytzIKVrXywZ5NwlORq5prXqI+2LShGYa
	uOYfyL9DnF+9kl/dqIQA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wjFlo-006T6G-Om; Mon, 13 Jul 2026 13:28:24 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wjFlo-00000005aLK-1ZGt;
	Mon, 13 Jul 2026 13:28:24 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Neill Kapron <nkapron@google.com>,
	Sam Day <me@samcday.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v3] usb: gadget: f_fs: fix __le16 of wMaxPacketSize
Date: Mon, 13 Jul 2026 13:28:22 +0100
Message-Id: <20260713122822.1331334-1-ben.dooks@codethink.co.uk>
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

Fixes the following sparse warnings:
drivers/usb/gadget/function/f_fs.c:3346:32: warning: incorrect type in assignment (different base types)
drivers/usb/gadget/function/f_fs.c:3346:32:    expected unsigned short [usertype] wMaxPacketSize
drivers/usb/gadget/function/f_fs.c:3346:32:    got restricted __le16 [usertype] wMaxPacketSize
drivers/usb/gadget/function/f_fs.c:3371:36: warning: incorrect type in assignment (different base types)
drivers/usb/gadget/function/f_fs.c:3371:36:    expected restricted __le16 [usertype] wMaxPacketSize
drivers/usb/gadget/function/f_fs.c:3371:36:    got unsigned short [usertype] wMaxPacketSize

Fixes: bdcc03cef0fd8 ("usb: gadget: f_fs: preserve wMaxPacketSize across  usb_ep_autoconfig() call")
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2:
  - add fixes tag and reword commit message
v3:
  - fix mis-copied git-id for the fixes
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 44218be1e676..68114278a150 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -3335,7 +3335,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 		struct usb_request *req;
 		struct usb_ep *ep;
 		u8 bEndpointAddress;
-		u16 wMaxPacketSize;
+		__le16 wMaxPacketSize;
 
 		/*
 		 * We back up bEndpointAddress because autoconfig overwrites
-- 
2.37.2.352.g3c44437643

