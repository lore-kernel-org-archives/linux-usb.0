Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262254;
	b=KJhO/v9Y7L4K2rDTbNuXOfW9R5OayJu46zzaRDDUa4t/F//9CBmlHw39yyZ5U/byhNZx
	 4RVcej0A9A/slepf8eVWxz5CgwwlyI/IzKP0HLrs/2gV7/MZarDRUNB7AqHOk+m45GQQt
	 1qzGgUAarrARKdqBXCcQplrLXqbUeF/5VWSI5jiJfFksMUo7BOkytrEsSfjHkosTQBfBk
	 eTBGuOZCYXyjTzINmNGCEb/pNZ7GGaYWiG15P2CrTtvnEK1mVDQoBYhidPnqbL3dNdMtH
	 JoRQED7R1N8icBlPP7xP7VGZbpzIH/X46wwtaww9UkHVI7+2P4+BKyE4aUHGQ8WbBtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Jl62TfhWYAfPnyRC2G3aSDjU5xgDd+P3RO6y8pPbcO0=;
	b=nLSXQn5v3IDj9eTD1A5IGuFpVDZ0jHHqonU6ZZfD9/CIf4+60pmZP1yknEz9GiW2Rauy
	 Zm5z+8DJIVZDgFp0g+s1UC61aWQqFm6e64KXw8oY8j4PVemPWihImMgOokRINuWIMJ1tJ
	 tMAbaU7Q+XApH84o2etd/Brsh0w3Yg86AVwJ8mFrZYph6i/gXxJTbxA3FipiRF7vLowrW
	 EyU275NZkawHNMnbxrVS7tGZygYnmIyKqwhA7D/p5H7G5noVse7fhtqZWJFZ1I3GKkMqL
	 x4+REr8dRCHFck1CFx2B43qDwzqWhvMvSpJk/zf/4vd1EodAIrYTM6McBvPxEq2CyXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=logictree.app;
	spf=pass smtp.mailfrom=logictree.app;
	dkim=pass header.d=logictree-app.20260707.gappssmtp.com header.i=@logictree-app.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aE6JFdCC;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962D9606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 08:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=logictree.app
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logictree.app
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=logictree-app.20260707.gappssmtp.com header.i=@logictree-app.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aE6JFdCC
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso901505a91.2
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=logictree-app.20260707.gappssmtp.com; s=20260707; t=1793262253; x=1793867053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jl62TfhWYAfPnyRC2G3aSDjU5xgDd+P3RO6y8pPbcO0=;
        b=aE6JFdCCM7LO9HwJ3nmpqUEZ5Tb1xgSgczp0QUjlpVLgv6TlMsf7w3ivWhK/vnw1TY
         +N9kasdgbbSCGzA/mfKxrMAhdiEuOwQGGkqAD2PIPoN/rrU1wROWH19hksp/yp6O80nd
         U2O3Kcxx37NH+woPi2x7cUkUqP3Zv/lp9vjbZ/tpn7ssENonLbqcLASC4spNRBAJd1Xj
         IDsiTiAeofqeeYS1NzAmrZNvedePS03zVYZRSOSouqNQ8mH85lOOl5sR3H9pSjdRiK7h
         y8oA1nrLpQlAdTsLnz4VxnsowpJpdzhkPkyXr8Op8OHILm2yhshgYxD88zCaigM47yi/
         mTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262253; x=1793867053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jl62TfhWYAfPnyRC2G3aSDjU5xgDd+P3RO6y8pPbcO0=;
        b=j5fJo7TsAJxPGaQEKN/UWUr+QShdssww1hJMaRY1/8gwmcOaTqtqnwlMs+314U8xhE
         mT7RQntIM1SLJiSDGPKPkCqvBdvzO4Gv25egQ997t+zlpfyqp/C8A/ZfZDBJ6pSzAp8G
         0VisXwb8I6Yz9yhvY+yTFAAff5Am9cunsP/wLG/ODBgPYWrAMPXqfwhMWpIADNbkuXVL
         XJAsCQrL9JHxRYwUepttgn3LFRXCOyyhJ9L2zOGaD6UT0y9ck4nGxKYSIvnk19/Klzrz
         drfX9Ax5bCB7teHGuT5JXJ+Hnu61Lvfx163h4kGk01XLvWke5smitgI38363Yp3SuIm1
         hAVw==
X-Gm-Message-State: AFq9FYJoMg4Kr1eEJBSTkxX8GfNrhN0dwy6e722l8p+e08QGfL/5xZ0E
	gwmSFvJQylihTVg/KsD8IlUIUCViZSmg3x43MVhyK3OxJFnFBqMEK6l9RaHeR23xsNtcA40euIV
	tmC2yTw==
X-Gm-Gg: AYBFou0RpumusvK6tlQB93Sur+OXvJDQ50BcG4ZgWfU9c7aG5pRouixnLuzS+nDw2q8
	qjo/RcvQ85Kg66xr41z1OLvU9k7LGYTJFP9EHLX6KD+3b2vjZWy7fmZ0bkKlzuatYdyoyk8w73U
	GwI0kdAG7eHs6wiTNvIWq5DJGCQ2kwa4T25wcJewFhA8tFFNTtwvmjW7sl1BmB49ehCGUwqIGIM
	EJ+ype7NLutbGm3zhywkZ3Bd+oCPPrPm/kCbUEenp0G49jD6dGMSMnUDeC5fedoOLyttb5uRFkI
	2oohD0jzLhJksRnJ9nUioaa45sgybjCYBEsG9BV3Wselx2nf+AoaqJhxJ+puhQm+hl6Dc7YUhwx
	+a5ezNrenUAjJC8CpB3lqMMlIe7p8/D1OqHTEd1HPswk7kFNyiyfQjrN24ocd7UWrKaB7o/kKY8
	WbQevCKrHaPNF6AjMDWbG2QKTN13oif6/SCu7JJ1zclq2CBGB7Q0HyiXivfNg4MpbE9EZ2i+BHa
	Tp/AIp2ZKNw1BiDSZRymiXAu8umc0IBmAXRxZNoma0DJW/b3IiJEp47RcBjzFI0mQ3bhjnNPPbq
	5/oSpTyvjVzTuAv1HOM0EERZPHgUu+4Nj2cGspsszp+u/reD8rIIW/YyloRth6G1ixwYsHUKdQX
	UtiPPSzlAc01omD8OAkwfV6lpQivt8RRV34Y1aoS8DWPIi9TfrIMSjqA3/aLn0s9DUABKy3Rm5e
	XeNc15Q0Wfqw==
X-Received: by 2002:a17:90b:1c8b:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3ae5817e0a6mr3383992a91.45.1793262252637;
        Thu, 29 Oct 2026 01:24:12 -0700 (PDT)
Received: from localhost.localdomain ([1.251.203.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7f9cd0sm3150530a91.6.2026.10.29.01.24.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:24:12 -0700 (PDT)
From: JaeGwon Go <ceo@logictree.app>
To: linux-usb@vger.kernel.org
Cc: westeri@kernel.org,
	andreas.noever@gmail.com,
	YehezkelShB@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] thunderbolt: Send header-only XDomain properties changed response
Date: Thu, 29 Oct 2026 17:18:34 +0900
Message-ID: <20261029081834.91559-1-ceo@logictree.app>
X-Mailer: git-send-email 2.54.0
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

Commit 19813551701d ("thunderbolt: xdomain: Avoid potential stack OOB
read") turned struct tb_xdp_properties_changed_response into a union of
struct tb_xdp_error_response and struct tb_xdp_header, so that
tb_xdp_handle_error() can safely read the error field of a received
response. tb_xdp_properties_changed_response() still sends sizeof(res),
so since that commit the response Linux sends is 36 bytes instead of
32: it carries the zeroed error field, and its XDomain length field
says 6 dwords instead of 5. The other responses changed by that commit
are not affected, because their non-error members are already larger
than struct tb_xdp_error_response.

macOS sends this response as the header only. macOS 27.2 (26B123) keeps
re-sending PROPERTIES_CHANGED_REQUEST when it gets the longer response:
after link-up it repeats the request every 1.5 s, ten times, and then
resets the link, about 15 seconds after it came up. thunderbolt-net
logs in and passes traffic before the reset. The same host stayed
connected to the same Mac for about 23 hours while the Mac ran macOS
27.0.1, so the change in behavior came with macOS 27.2.

Send only the header again, as before that commit. The union stays, so
a received response still has room for the error field. Linux
requesters accept the shorter response: tb_xdomain_match() requires
only frame.size >= response_size / 4, and tb_xdp_handle_error() reads
the error field only when the type is ERROR_RESPONSE.

Tested on an ASMedia ASM4242 USB4 host running an Ubuntu 7.0.0-38
kernel, connected to a Mac17,6 running macOS 27.2. With this change
macOS stops re-sending after the first answers, and tracing shows an
8-dword response with length 5, the same as the response macOS sends.
The link has stayed up for over 1.5 hours, about 80 minutes of which
carried a multi-gigabyte transfer every few minutes. Not tested: a
Linux peer, the error response path, and macOS releases other than
27.2.

The analysis, the fix and the tests were done with an AI coding
assistant.

Fixes: 19813551701d ("thunderbolt: xdomain: Avoid potential stack OOB read")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: JaeGwon Go <ceo@logictree.app>
---
 drivers/thunderbolt/xdomain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index b187a60..563a8b6 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -509,8 +509,8 @@ tb_xdp_properties_changed_response(struct tb_ctl *ctl, u64 route, u8 sequence)
 
 	memset(&res, 0, sizeof(res));
 	tb_xdp_fill_header(&res.hdr, route, sequence,
-			   PROPERTIES_CHANGED_RESPONSE, sizeof(res));
-	return __tb_xdomain_response(ctl, &res, sizeof(res),
+			   PROPERTIES_CHANGED_RESPONSE, sizeof(res.hdr));
+	return __tb_xdomain_response(ctl, &res.hdr, sizeof(res.hdr),
 				     TB_CFG_PKG_XDOMAIN_RESP);
 }
 
-- 
2.54.0 (Apple Git-157)

