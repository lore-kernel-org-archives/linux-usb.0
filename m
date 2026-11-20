Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155583;
	b=JRCDZ2QCZUysJFCbVgO6mzIQBeGHEbEuVm9rmQuByTbbhv3l87qn43+zYIktmpEU2pbh
	 KtqYX2zsEFE4jsBylS1H72VpnfHU31f45M+ycpbvhHyOEMc9D84KOoa2Ku5nvcKsor1GE
	 ZPNInrnC/YoZXF6TgWj+VwS000ZxFimy+c5XMZ3sozKi7mC6xrFbSj62cmYuSAk8yyLMA
	 RY10qh+S2N2Qd9lLkaPng8bMEgeWLlLmI3vlvn74D5DvKcsS4wB3yu7jU5GtPLpNlRhNj
	 KKWCxYaBdQisb/uhcQozYxhy+6cJtc5ag86GsaM//6ndnl6kGaXvwfQ6S7Z2AmQO9+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155583;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xmvQzEMIemlYEhT1xs9weXJwUze0K1vOuhFskwSIB94=;
	b=ExDwBEH1tliA297VJ9jic9Ek/slOzBPL67TkMsw51JlsRXgsIazucTW1AlEOwqPxCOhi
	 U0sp8tUrHW+BvJIGIYg3BIaYETT/wRQTzU0Ghx8MxUJW4MWUQuE+9uazaXW5AeskdPxuP
	 LE8X5TQ/LEWNk5NUzDPEJHzIPGgydJIjwmmEXK9pRODZ59abBi8ZXTCByYFlBShXb228L
	 pBDJOuruTG+Ki7t3kOpjJPAlUUBnnbfOgf4TcK6fGXM+C30T7eygeJOVbrAvMLhxe1LVM
	 h+USdPAoZvzfuefKgpsIHkfbLKLJG1UNJr8pPzjVr3XF37gV3H2YIiy9LdZhH7a+wdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=mZy9uWNk;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E40606A50C;
	Fri, 20 Nov 2026 06:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E40606A50C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=mZy9uWNk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=mZy9uWNkGBJDgfBXZD8+GaF8ZQ0wKd06tNccuM3qQX01zXm96twYO4lOR6jpOBSTKEZqHheDUeaHn
	 r3BLUX1mzfXsexMfQ8Vxm6HdmdhvH8bQkjo2+TqMIWkuNfd4ifHvlxT5lrbTlW2iox+Ih2FGaQWUOY
	 RXYzmR5aVZE/2sWw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66affe67b520-f1852;
	Fri, 20 Nov 2026 14:19:39 +0800 (CST)
X-RM-TRANSID:2ee66affe67b520-f1852
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86affe67a1c7-80cec;
	Fri, 20 Nov 2026 14:19:39 +0800 (CST)
X-RM-TRANSID:2ee86affe67a1c7-80cec
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: mgr@kernel.org
Cc: nkapron@google.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] tools: usb: p9_fwd: Send complete requests to the TCP server
Date: Fri, 20 Nov 2026 14:19:37 +0800
Message-ID: <20261120061937.98224-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

socket.send() can return after sending only a prefix of a request.
The forwarder ignores that result and waits for a response to an
incomplete message. Use sendall() so request forwarding completes
only once all bytes have been sent or a write error is reported.

Fixes: 673f0c3ffc75 ("tools: usb: p9_fwd: add usb gadget packet forwarder script")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/usb/p9_fwd.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/usb/p9_fwd.py b/tools/usb/p9_fwd.py
index 12c76cbb046b..d5ffb2f0c5ab 100755
--- a/tools/usb/p9_fwd.py
+++ b/tools/usb/p9_fwd.py
@@ -124,7 +124,7 @@ class Forwarder:
             data += self.ep_in.read(size - len(data))
         logging.log(logging.TRACE, "c2s: writing")
         self._log_hexdump(data)
-        self.s.send(data)
+        self.s.sendall(data)
         logging.debug("c2s: forwarded %i bytes", size)
         self.stats["c2s packets"] += 1
         self.stats["c2s bytes"] += size


