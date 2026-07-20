Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA0240DFAC
	for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566655; cv=none; b=Ko/0xdIKL8QR/wkspxhMW1jqUcVJjMMiIAsPGOOqvaqUdrpnZx21Skrd0tEfKtj7pHzu9XdGxxtKThWyVqaHVB+z4x5rkSEM+iit4RTDf3RAJUqxNkFfgvfPvT/6F/1sLDuCFb2Y/mUPmqlgP3f5nAKFg2d5L+UlG0yp4H7nWnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566655; c=relaxed/simple;
	bh=txRVoarM9RtPWUWP0CtgOYUtrKwjXI7x8OF9IaeZvqw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FnYwe0YfKSbH7rvg+CtT6CQIabDNEjr3N//bnb3eTCHHa0wj2gTI649hBfnkKHLSIobZZJtsnif+x84+lquxqtPTsQmQtckNrrZcdEpv4Tj22ruQTEyBb7zUu8bNLoCy2jXoYZVej6BKT6fAxfo6KRMFvwKn2a+x17P5qOqinrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sonalipradhan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MAcSuKjr; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sonalipradhan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MAcSuKjr"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so202773635ad.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 09:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784566653; x=1785171453; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pp8INu7R2avTucfkh21LhjYSN0E+XTKfW4u2lNTh3fs=;
        b=MAcSuKjr2851HVM7INV4boXvAXAabgunyupOWNKuijX6NL7kRtf9u4pT5sr/D9LY1E
         bL8O0i9IBKdGQtYIfmcszrLOcDqUFs0T3M0qTOIafqb5aDGmGlaxTy4xuwXoFAUXcIhu
         aZTZQRzs5YAHivsVSq2PvUTZmqHapVw13AF8DVvyWOqIkHe4LPVBusa4qdX1aUOqy0RG
         4Yf86UAAV0ICiSNxaDPfbZcxYNLuBjHYbmD7gZ/Gm/0DbQQZ00nEy+AVDCNIB/agXijl
         Fzj2eJA3hcTTDMIs8GSs4k889fqBWZtp3DnhvsBVYxQhF4eeAEtVE884mjoe6gWYU/sG
         HPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566653; x=1785171453;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pp8INu7R2avTucfkh21LhjYSN0E+XTKfW4u2lNTh3fs=;
        b=VSQAm0iNddzpmNHWNTN1oSnyCaEniUAMBzvjKh0xRcboC+ovR38V6iKYoTQZEeLNJJ
         5maAp/aEC7XpFVNopYRUXFkkhmSrVTCl2T+PUeyrhRz+lelBl8J/ys/enGm471Z2p5iY
         LeR8n4Ez7fEmxnQWpt2U0EU1fja095/N5dw5/bFSYc1U0ZQo44HNUtGSn8DteUgR6wVc
         M713N3b4mvw1V3tS+n2sY3glacUQGJIPr3lvF9U44C39xoXMb/jF475Lp0TYr3QjStnG
         rfX9HUcdoaCYL0jN+5FzuWelGSGW7zCjR5WJoj6ANgh3q+hUKFOggw6fbkn9obOL++At
         Ouig==
X-Forwarded-Encrypted: i=1; AHgh+Rop6hRtiCQyAsVm2xh9/u3khQdL4n0gXwZ8LpA/FKQma7Twpoismdhii69OG2xIe2By+YkvswN/yPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA35doDQwVzRSvgem+8cgyB6j91syo+hXf9VTAGEkn4tBtiwwg
	IHjooItmgj/d7dn2DHpaWJKLUppT0pshqcTGYZzO8cflBs7kJ2M0pMCrzL1VzjUc5ZXsCyHbddM
	Hc5pbAQShfWJkUjUWxccw/F/FUOEj3+whpg==
X-Received: from plim8.prod.google.com ([2002:a17:903:3b48:b0:2cf:7a5b:f7ad])
 (user=sonalipradhan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:8c8:b0:2ce:e75f:b713 with SMTP id d9443c01a7336-2cf349640f3mr154178425ad.23.1784566652964;
 Mon, 20 Jul 2026 09:57:32 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:56:54 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720165654.2224591-1-sonalipradhan@google.com>
Subject: [PATCH] usb: gadget: f_ncm: Use unsigned int for ndp_index
From: Sonali Pradhan <sonalipradhan@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kuen-Han Tsai <khtsai@google.com>, Kees Cook <kees@kernel.org>, 
	raub camaioni <raubcameo@gmail.com>, Jim Baxter <jim_baxter@mentor.com>, Felipe Balbi <balbi@ti.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sonali Pradhan <sonalipradhan@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The variable ndp_index is declared as a signed integer, but it stores
the return value of get_ncm(), which is unsigned.

A malicious host can supply a large offset that overflows the signed
ndp_index, making it negative. Because ndp_index is compared against
unsigned bounds, this negative value bypasses sanity checks and leads
to an out-of-bounds read when calculating the address of the NDP
block (ntb_ptr + ndp_index).

Fix this by changing ndp_index to unsigned int to ensure consistent
unsigned comparisons throughout the function.

Fixes: 370af734dfaf ("usb: gadget: NCM: RX function support multiple NDPs")
Cc: stable@vger.kernel.org
Signed-off-by: Sonali Pradhan <sonalipradhan@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 64eabda2f546..bf02545b37a2 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1171,7 +1171,7 @@ static int ncm_unwrap_ntb(struct gether *port,
 	unsigned char	*ntb_ptr = skb->data;
 	__le16		*tmp;
 	unsigned	index, index2;
-	int		ndp_index;
+	unsigned int	ndp_index;
 	unsigned	dg_len, dg_len2;
 	unsigned	ndp_len;
 	unsigned	block_len;
-- 
2.55.0.229.g6434b31f56-goog

