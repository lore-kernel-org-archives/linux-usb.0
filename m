Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0CA282F1E;
	Fri, 10 Jul 2026 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695307; cv=none; b=hDo88ZDpq6rrhw9tV4lI4a7x+Qt0yoOe9RN51FUTK0RpJl9zfAgDZpVTkUoXoia0kElPTG6R+5FdA3KUQLSm86Wk4k3u8+GDIGqJ+jE/gbLeK/gUrNEQSYN0YUjAQI0jHEdduzoDgPw5fLf2QEDAM5Q4DM6SUBqIdufxi7r8nQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695307; c=relaxed/simple;
	bh=4AH2D3gpdm6UmM2L8mvjn1bEL8FcmHEVYw2OVl8ltIw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=sgaWbDFL8j+xhyIS0ajp8HqEkXCwJ9VPFmPn254MT9ZA77hzBvSNH2ZzokCuftrOJhIF8OusXKPlPPLE/kZJVFR58lnk/MO4pE3NTY06pDN/wsXWUXFh40zp/8xTY9vNKcXByAIlJTJq7j8kQ1GbGEAbp36NCY36pWEJgCOZTnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=LiAqBHKm; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="LiAqBHKm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:In-Reply-To:
	References; bh=x7mOm99J//u5hdfKIsfSMxz48i6E4IuSCHegRQaKclE=; b=LiAqBHKmy37XwS
	8XsrAlwBhnnKmjauSyjefoD6RVZQ6mXccJFplSTdwZ0aU9jU8VnubI3WfEdE+MN2QcFWobJulVxnc
	3sBxJwrmBrXB4xQeMT+arnzyWazIypOy0l3XaUiczEkPHCcx81r7uXwbqn8qP2nIV0N6m+rSvp5Hg
	ir1CnZvnD0ut2uoQhfmqCnpJk5f6NWPbiWBpZbEr2sPde8sSScKevJblRJ7akvilSK6v+PUQTh97w
	u3V68WMBFiSOS4+gUMwqEtY14ZVOWwdnR8ROlFRIACjv6vCoFLo3tKdyKa875vrpkG4A73LnvheU5
	dkEW4oYaE/pXyUduGsnQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wiCco-00326z-HE; Fri, 10 Jul 2026 15:54:46 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wiCco-000000026Zb-0O4E;
	Fri, 10 Jul 2026 15:54:46 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Sam Day <me@samcday.com>,
	Kees Cook <kees@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: gadget: f_fs: fix __le16 of wMaxPacketSize
Date: Fri, 10 Jul 2026 15:54:30 +0100
Message-Id: <20260710145430.501893-1-ben.dooks@codethink.co.uk>
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

Fixes: dcc03cef0fd8 ("usb: gadget: f_fs: preserve wMaxPacketSize across  usb_ep_autoconfig() call")
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2:
  - add fixes tag and reword commit message
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

