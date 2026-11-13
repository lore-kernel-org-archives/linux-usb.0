Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562111;
	b=p6yoea3O/d1R/LOli2MS5pFS99MU+sj4FpZnpSH4BwZ5GwpUMIcI7/vpV6Uo9G17YN1P
	 vrxxPHLrgwUjDhZ5Rdy63eQYHxYvk67jhScJ1LLwJzs7kF1pEgPh+tvX2nn6Tn04lpj46
	 mxARsXYgyhLg3fWmSeC/btjdmPW32evjt/5rL74uPiWL1IXnly+OxjZgypiBwprromiT2
	 kEojTuwWO2SNUaynt2pDAv739WEcOyp2YohEezNm+6GXkb3bZJ2YbwxHpyLqrof1wn4aY
	 SKGZ3a7UcrhnWnHIdts1AYKexTwMrcggG3LbQAgruZFKOKNIuGsqtr4ceHZCFCWt/og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=CIlAjjzP5ZXkuJIu4Whn5N+9lP8TULOuvWMoUXH2eBk=;
	b=0YQ+ECoPd5vwUGmoxsnKTwhmPBGz0MGMZpehbxVnguIc/fpkLCgeOx5a8PejgaQfZ/ym
	 YyBMduHamUjS2QD98uTFZ6xMR2N9xu9GwwxxDLGK8QgIm8t/W6o7L8w1I8NT28mBLNG9P
	 LgrcUkYG0JU5ix4W8bufoLJX4q6bI2AMVfreh3lZtW5L0fWlk8w78f6G+QrZfvFMEkrD6
	 2IIRYYPCamqTKrh9UV2KbXslGsx6hqgKsZTAmGxjgcRC1J4Sf3iM7JPvu1nnrPT32MlGb
	 W0T5wxOSDTkOCY4ca1qQ4QN5uMkQkSsuOrX8uOW5JuEU+uy5DQempRb6fhw3Swu8+mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=tMyJJZ7d;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CCB606A886
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 09:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82CCB606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=tMyJJZ7d
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso3849765e9.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 01:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794562110; x=1795166910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIlAjjzP5ZXkuJIu4Whn5N+9lP8TULOuvWMoUXH2eBk=;
        b=tMyJJZ7dm0Zrfs81fs07a8kOa0DEdvi9J3wePjDtL0TbRD1onKbr487LUAiBe8MrT/
         lqXfCfc7Sn+gszaAsV4SKMFIuuXPY3Xxvl5/z1TvQZG1AbNjczFNICpoG3RebBqAWf4X
         ksWWlPhuFS3F/OMFz9F3fDBoVMB+jd1dp8JfmanVIGzsrK8C2OpHEbBORZsp9G+kDbD7
         UQHtzMRKEsvG3SB76rE69Aoc+6x+3dSMZN21/bKA4eozJkSZ65R7xm05vTHQtHl2WnbP
         PlMBUT2SB9LENhOHmkO8Z2tWdEO/A1ffYLg6GUutRg7VQeCIVDp/3Jkki7r1dVyWhlG5
         Wgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562110; x=1795166910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIlAjjzP5ZXkuJIu4Whn5N+9lP8TULOuvWMoUXH2eBk=;
        b=2RAt51Oq9jWrBcNiw4FXYZMhe1PNWztfZmsc7+5/zilAXAgOTx+oB3IE0DSBM+PaBa
         kn8mLvSjWR1cApOokcSJ2NS0VDbbWYWKQcSXX7VZkAcn9Mtx9FJ8sAAamu2nM/i3M/oY
         rqu8bDGRzpCe3WLInsdZQYM4lnm2avKsz30JEE/q0pLtSUF+NDIgu/IuIu8wVkmw5dvQ
         aK2k8pyHlT0X03x3iHOWFHn5ft2NU+Ov9648lvhQSPOuNjM5vXfR8OyL78RhgvpTmtVp
         4ib/sfLCWE8GWq84OTANP8yUXxB9OToFnuSbp4Ozd8tpQZP+xJsupMfi0OdeFVaXd+nm
         u/fQ==
X-Gm-Message-State: APuU4Z8EOY1GSI5tZzbniCi+rsI2teR6ncrK8akp8SCuZLKT7r5BMkS2
	u++cg8XRVfqZAH278Sw2xz8NcwvY6YlaSB1J5v7EmMY9avzJyxcunxvsxJXNr0apPss=
X-Gm-Gg: AYBFou0onIzy7UTgTFyemE0XpMRiV9see1Nqfz6FOxaf0wnlgyfGPlyigb2I1rXT5SI
	QZZ4TEpKznsEhu8YW6J0yX31L0DndIaqOh5UeL1Xlv/qAO2XvfRvMnLy6TyKgSk/TE4MXP32rLt
	gsfX+hUFLyibwikzS5+Be3S4iSsT0lc1wUH4UBQD7LF62thCUzh449IeksmbTkaoUpFGe8e1uSI
	orif6VhJ26XCQBFQfva2y3w1Z3toFEhD/NNvwZu2spM2BKU3mPBeuGaBiwv84ULz282PFtKbglO
	F7jBa0e78XEX2zTotrD+3L2Maf90DtvdlN0PZCgUVadkb6+k8K1mHuSbuc1ukg/5gUv232HltSg
	b6ulKGi+WKo6DAqHw8g+OTjg32QBhfnmZszl1I4gWWjCHLqwj1aSyeQ/SjepjeiRckaw3gZ3zXw
	iUYiR57cDEXGe4xOYJ9X0J7UqeU6pmolBAKyPX5xhBhWPc1DNsMvLzR14aPAWhyu1KVEU2DjPnQ
	xu9gwVqNlVUuXmWdOGeZaKLy49ZM+Hat/1wFSb4gtNT1JIyq8TwNofvGAs/birXa0IoULjO2JQd
	C5VzDd/GaopdiFUqGiOXEG7lWUgeScf7v3Da5acvzpydgfIzWyCJ7X4kHS1GsXXWL6ix3Cvz4fU
	+XZ2bQqGL
X-Received: by 2002:a05:600c:a45:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb55a69123mr38136345e9.13.1794562109875;
        Fri, 13 Nov 2026 01:28:29 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm238668335e9.1.2026.11.13.01.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:28:29 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 13 Nov 2026 13:28:16 +0400
Subject: [PATCH v2 1/4] usb: gadget: udc: Clear a pending connection when
 starting the UDC
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-udc-connect-v2-1-f51b11f07eb8@flipper.net>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
In-Reply-To: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994; i=alchark@flipper.net;
 h=from:subject:message-id; bh=H1NZkbwOLqgox3njeMpCXWj9ST4HT9e/9uVkqeyhY3k=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9u2ExvzC8IC6y1H675PsVR3gZWD/3LjZ8Yfng54IsE
 ZaV8+q4OyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqKa8YGToDL/KUn7jzeK3VnBOrD/n9ajnlGfAoTyqx42np7Lc29+oYGW65LTX
 9fFN/F0OolOvx12cq8h3VBbLPH9nBmfs5XurOL0YA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if already
connected"), usb_gadget_connect_locked() returns early when
gadget->connected is set. A connection requested while the UDC is
stopped sets that flag too, without enabling the pullup. A later
gadget_bind_driver() or soft_connect "connect" then finds it set and
never enables the pullup, so the host doesn't see the gadget until it is
unbound and bound again.

This happens whenever a UDC driver reports VBUS through
usb_udc_vbus_handler() while no gadget driver is bound, e.g. when a
Type-C port controller switches the controller to the device role at
boot, seconds before userspace binds a configfs gadget.

The pullup is never enabled while the UDC is stopped, so clear
gadget->connected once it starts. The bind connects according to the
VBUS state that the core tracks anyway, and a function that deactivates
the gadget during bind still has the connection recorded for
usb_gadget_activate().

Fixes: 62911bc82b03 ("usb: gadget: udc: skip pullup() if already connected")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/gadget/udc/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index d5844384c368..577bc15f61a1 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1236,8 +1236,16 @@ static inline int usb_gadget_udc_start_locked(struct usb_udc *udc)
 	}
 
 	ret = udc->gadget->ops->udc_start(udc->gadget, udc->driver);
-	if (!ret)
+	if (!ret) {
 		udc->started = true;
+		/*
+		 * The pullup is never enabled while the UDC is stopped, so any
+		 * connection recorded meanwhile was only a request. Forget it,
+		 * so that the next usb_gadget_connect_locked() enables the
+		 * pullup rather than returning early.
+		 */
+		udc->gadget->connected = false;
+	}
 
 	return ret;
 }

-- 
2.56.0

