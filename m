Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF6C443E31
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786977208; cv=none; b=RC0lOh+6oxRSyRKORCXMDu/UqZsUP9RPEVIMeq4OrhErUXSQf2LKBtszelfqazcuk2r3B5YqxYJLlAp2VXTaiE6nUdIm9TNP65lkEMNzsIj3dvJOuAs5Oj3ES5qT9MtvqbIq6pxsA+faAT91Z4CtU8yCUTmZG/zt2YD0qfy94LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786977208; c=relaxed/simple;
	bh=DDFwBhiBLofGa23pCJqnqJo3yOWJ4dehw0ePV0fwogI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BX+MtF9DhFHtDHssKcOXdzybIk330xhjgVH/xa0dfVzbTGgg38yAH8y45uwCPpznJ5Qk5UX3bqkVD6K1ILsRyAZcfJX9d4pPG+2mPf45eqHoVBcUjqwIYeR7Qom0U2Ml3R5LOlvihS6KDd26ME/OY4SohLv8//vz4MxwTdaTKe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgZKjlyH; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgZKjlyH"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848761b5897so1183831b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786977206; x=1787582006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmPzW0++6cESqYY1D8FfWa9d9CR6iOyeJuXogCEEgOI=;
        b=GgZKjlyHW29Ad5wmSfjlbBsHz6kCRHIYal0E8tbZYEzKwtp25N8NwnZT676KcylHZh
         3Xvg60FAOBwgngYiqa3Hi+6aipixiILi9tfrQV/kWWGxCKIgCM3ncw1MnvGcGKpfktv6
         j6nx2punqsYkxvJQfLEJA8LKA/kMmWDBapvfsP3FRB+inFwZPCGF9WUz10X1UF3qVn4c
         ylPfuen9d0o0XoFa3a4RvrsH5oXN0KLYHuJ4ujeY5ACj2afkai+Di2+78pYPH+f9pOH1
         C930rE6ashOmD5HziGy6t/fFLpzI9JKX1GiWe96U0g4A0EQbyEmdsU+fTCVtbG2Z41rt
         OhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786977206; x=1787582006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bmPzW0++6cESqYY1D8FfWa9d9CR6iOyeJuXogCEEgOI=;
        b=iDiU/CbBgHIiEPwiAccF1YbTjGPSKJ2waRAWB4M/z61EQ2BKkXoSJqIaRS9NHyWJqw
         kzr+b7PwpJWRfOeRXMXxZ/LE5OI+AYJQTuiUfcoT62ZtIhD2jMjZb6+yt0MNOHogjHdT
         AoIDlJMeB6egCcicXgkKY449OGn76j1CWP6ORWYWPFb4bZ1Jx/4BZseH+G4jT7MPCG1Y
         etcEDqCja5BrJsz05uv1pZq6S/yqcWZo3oocD0VfbL3w0kmr+iXzdxg5eRcVdxj5sO9G
         Ug2K3EwDl4ukytSsAmorXvdstPl84h0XSPPg1U3TONI7sBmAuK4UzfICwtdaOEL8Zx/L
         hqZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6L5BZL+6QP41s7/n7Sfges+uBNfhq/xKWDqnoiF/FhdLs9ogSAEZvp3ORF20O5u7priSVqungtxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEIcotF+Q11y5SDrLV+jwv1V/rnfXomLvgJndSggDhfpXs+Oi2
	D3yrmbYfUk5kb/wEfQWLY9WJ3jLyv2a2CArIWZJMyHZNa2yN0j+TUew=
X-Gm-Gg: AR+sD123ij8vwWyuRmTA6YNmMQNRWf+hphW+Ijj1ajTxdTt+7hnr573gtQ5BOph+f/L
	FMIUx69/drdmizp9kRqGZzhF9nPKyFuOw3JPhCovEqdu8LgHKqUOHLysJfmr+g+rdzRvNYZ2gFb
	SZk9KaZX9pgn3VEnKyBAjbMcGfdvvJrDD4mh+dcWWqCZ4KJgpil7MRkiUk9TV3MPNnaIFmR8KqS
	6dyFCBGBXAfuXa9YGwHEalfKA2Hccrl3vRgOZcN622sJEp6b4AadD+YClDEm54yYvYVG5GWsLKB
	HPMnjsfw+70K01OBAfrH952u+Oi9KGDbmY69v3wO/mJY/Zc4sGo7AR5idGnWublCz4Pvavq1jLJ
	VtkY7/2kanzTGCSKtcHvrjd79bH15zyaGgPhn8beM4DlPHEMjFXq/oASE73ll8UW47BGyZR+pVr
	HTCIz7Xd8V/w0nN5M3DpCavHsdeXj6Cs8BBfnJHl0Pp/BvtoJi+gusSyBdlgUfWI7IMhoEceggS
	KUmB4G2tTMSNhly6bSUwrGW3zmwLVYG+U2m0BB8j9maiPkZBLt/xJCzz1BDG+uUjzPxGfz2Qw==
X-Received: by 2002:a05:6a00:ab8b:b0:848:67ca:bfd with SMTP id d2e1a72fcca58-851b87faa1fmr1192725b3a.16.1786977206514;
        Mon, 17 Aug 2026 07:33:26 -0700 (PDT)
Received: from codespaces-2db70c.m2fxbej512jepnsor2itp05j3d.ix.internal.cloudapp.net ([207.46.224.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b404944bsm690961b3a.23.2026.08.17.07.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 07:33:26 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
X-Google-Original-From: Triet Hoang <89897892+HMTCT@users.noreply.github.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	pawell@cadence.com,
	peter.chen@kernel.org,
	rogerq@kernel.org,
	triet.hoang.dev@gmail.com
Subject: [PATCH] usb: cdns3: Handle ZLP request allocation failure
Date: Mon, 17 Aug 2026 14:33:12 +0000
Message-ID: <20260817143312.163155-1-89897892+HMTCT@users.noreply.github.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026081757-fog-lunacy-2df9@gregkh>
References: <2026081757-fog-lunacy-2df9@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Triet Hoang <triet.hoang.dev@gmail.com>

Check the return value of cdns3_gadget_ep_alloc_request() before
dereferencing the returned request.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
Changes in v2:
- Allocate the ZLP request before queuing the primary request.
- Free the allocated ZLP request when the primary request queueing fails.

Changes in v3:
- Move patch version descriptions below the '---' marker.

 drivers/usb/cdns3/cdns3-gadget.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index 42311c1bfada..05d225f99012 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -2641,7 +2641,7 @@ static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
 static int cdns3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 				 gfp_t gfp_flags)
 {
-	struct usb_request *zlp_request;
+	struct usb_request *zlp_request = NULL;
 	struct cdns3_endpoint *priv_ep;
 	struct cdns3_device *priv_dev;
 	unsigned long flags;
@@ -2655,24 +2655,36 @@ static int cdns3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 
 	spin_lock_irqsave(&priv_dev->lock, flags);
 
-	ret = __cdns3_gadget_ep_queue(ep, request, gfp_flags);
-
-	if (ret == 0 && request->zero && request->length &&
+	if (request->zero && request->length &&
 	    (request->length % ep->maxpacket == 0)) {
 		struct cdns3_request *priv_req;
 
 		zlp_request = cdns3_gadget_ep_alloc_request(ep, GFP_ATOMIC);
+		if (!zlp_request) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
 		zlp_request->buf = priv_dev->zlp_buf;
 		zlp_request->length = 0;
 
 		priv_req = to_cdns3_request(zlp_request);
 		priv_req->flags |= REQUEST_ZLP;
+	}
+
+	ret = __cdns3_gadget_ep_queue(ep, request, gfp_flags);
+	if (ret)
+		goto out;
 
+	if (zlp_request) {
 		dev_dbg(priv_dev->dev, "Queuing ZLP for endpoint: %s\n",
 			priv_ep->name);
 		ret = __cdns3_gadget_ep_queue(ep, zlp_request, gfp_flags);
 	}
 
+out:
+	if (ret && zlp_request)
+		cdns3_gadget_ep_free_request(ep, zlp_request);
 	spin_unlock_irqrestore(&priv_dev->lock, flags);
 	return ret;
 }
-- 
2.53.0

