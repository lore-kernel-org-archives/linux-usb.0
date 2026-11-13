Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562116;
	b=JRnl4w7pxENC2PfaYWm8K+eJsiIyRKQkSJaqWZDVTZfROfU4EKiv0w2JlZ5oNrrxsWEI
	 f7uCyc1hEaHOhvVsLGzeZgnfYfyQOp+Bo+4Ixb4fcP/nU8Bf0AvLl1nPlzcvVmX+oWs/0
	 N0L29pzCN+V2KY1gK4jp5YBUoC/Vzi21PVydPmFZbgdltGcBLl4yvS/y192ZzK09b5kIY
	 98aF7A4kz0dAyfqYf/w1j3XQla6PA1y+aDBY3wTNmpgfqZau9ZGK9zTNj4kuoR6x+YHjl
	 NWI0tQxPjAPdAn0Ey+zZ8gOkJHjEN6RC10klbppQVonOHGU1u5S0zBaGH6TkDKbEcaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=r8E99UCnRaQgNsk9wSWEWDa3p6fX8b6dowYUjerqmNE=;
	b=kEuFCuVvQg8mc8/Q58Z2v00acHW1fcXArtLsofLt03DcaSJT2AyLAv5fdGH3cZ2kVbEO
	 yWHJukHQDGBImqvu9biN5B75Nt+0RMiVgtKbdxftb0z50CBbc7y5iee+e7QUHzXUCM72y
	 BHTz6inBNcs78vS21hN2VxuCLB+uiKJXhoLLN9iaj2ng1g6wZKLGwdD1WWu/m1K2Rdihq
	 h8qHOM+L2dFyZFHpo2J5Xlu/SWbfbYzeF77Mwv7CLQ4P6E5M9hztsbeJIpUVM/XwQ3HT0
	 gVEaGie4Axoo88dAqWweQ43kAUUPi1xZ/tJvOf0rIXBjPTK1fNiXqIpmcn3C8yWJjPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=P2HeMCNd;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA7B606A8AF
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 09:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CA7B606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=P2HeMCNd
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so2552765e9.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 01:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794562114; x=1795166914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8E99UCnRaQgNsk9wSWEWDa3p6fX8b6dowYUjerqmNE=;
        b=P2HeMCNdvDtiFce9CYWTnJeK/AIFiFF4pnAIkWEx6kpOTTk197ga4kqUNkV35Sa8kV
         8AFFjYASh9ibxDEPz2XEBbxkcPKvWq6Rm9Hnc8awFH1YCOoR8v9P2zh4/EZsBKhsx6gO
         aWlmXEK9es9BvsHhO4Bg+/OTLD4s339AaE7xSCha5mXwMtoO6Uwfva6Ku/TVnReW9LKi
         bG/YKEMRn8KTAqa18lsAyjGOk2CUORnUKmYVuk7tvsqd7aPyY2doDvSfM5+rnB6v0nuU
         ucr9nD5xD/sJAnL9qEc+3owZk8BZbn7pAeOoKZVIoHKevOgMcUBGHZIvH8bTD+vn3Sg4
         5xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562114; x=1795166914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8E99UCnRaQgNsk9wSWEWDa3p6fX8b6dowYUjerqmNE=;
        b=onqsbastxHEWrwASVhF0AqcTbhyrtRfprYFRFz1PpCRc5pwMq8Lv3G8TnNcKruGcz9
         RCJAoFVxWeDQ0FRuKA89qmLVucJvtvB/jfjsXfgdklRYFYZR5jhQPWtmUSz+yjodXToy
         +mi6CSzDcIfqwva8pbktVzxzyOVScArmqea6LyPnaPl0XUKAAIVZkYGFvIBEqwgtullt
         R7J7x++k4sJL0BYRvDzpanZIfSHZtmkFSwKykv1R47k79HEyc/m1JGGqOem2sPWVuuj6
         9vitV0dOl0MUd6NVl4Rsg6DKFLoH/Ep7PdDyleJjkqEZkPeZwcPgf7/37WVpAufOxpOY
         2Zqw==
X-Gm-Message-State: APuU4Z9YzEeckh6Pz1tbuc71OQqc8eO0MTdr1LHHCFnqVGkCq/tx+Lzu
	OS0lCeQHyZClGMV+EOK7P1sqRu28a97IjXoGhTKupvjYBQf6iJEsldtDBOgIem811Hw=
X-Gm-Gg: AYBFou3lM0NqPc1lzfKPh5jRS2ftKPlIfHWLAErSXUnCl4yPplo3mbc8r2vD+JMNY7n
	ucKNqRj7ZtUFI3EZi9szyfwWdZyLYCGyFMRVgTvnS0wGy05PXC5r/GsQ/1Mvzvd2zsD7xE4u64m
	EWN5hfIPjL/jB8WfxYFYIC00bQpPn32fF/DwRvOtZ+Al+c4NjhYWES9tmiLVFX6Z8oxgwHdWIqW
	Bo6R+Gb6x8MWsaAZL40WFLMZddyqLZe27sP6fB3v6vIjC5eEPZkIw/VT8LKNaviMWCHRQeKFFf2
	pGdCue/Din1m2mC7M+ZfTJaWs5ROorTC/OGvLK4NKretP82CKWrsGpIcbpqWBvJ/QS6SqI3yj4w
	NOVpdKmVW4F7HZLv9bhGhBIZo6ZaXWcKuP5v9f6y1BwbuLpqv3t/87H7PZ2bqCmaQjBgQN+82MF
	svrRv7zp5PZTJcWrbjHggr5VMmiu71kH/vb2r1+GK24zv/Ki18fvSvjBMk5abUXe+qXHjAkxb7t
	48dXrJ4E/Yo53FJqp60wkh8GU14Qxgax9ll80kzpnub/RpO1L3chLeMY14O2OzCn4fKMgE8fIOO
	OeVbleVsVFpNBlHIvWZE1qqorO+qXHz8293Y7ywvOIm2hkiBE7dEQ2fwtBEJv31E9h/jnNWHe3G
	Qgbp/Wkz0
X-Received: by 2002:a05:600c:3acf:b0:4ba:4395:560f with SMTP id 5b1f17b1804b1-4bb55a70e39mr41567045e9.8.1794562114447;
        Fri, 13 Nov 2026 01:28:34 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm238668335e9.1.2026.11.13.01.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:28:33 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 13 Nov 2026 13:28:18 +0400
Subject: [PATCH v2 3/4] usb: gadget: configfs: Leave resetting the
 deactivation to the UDC core
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
Message-Id: <20261113-udc-connect-v2-3-f51b11f07eb8@flipper.net>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
In-Reply-To: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1017; i=alchark@flipper.net;
 h=from:subject:message-id; bh=rXH60RggZj0TEsglu29QbUJgdLk7jMtayvCxqYDmcpU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9u2FRWfMidlvh9b+R79qm/fe25UvhK4k9sXXr25NWO
 1yFWvdodkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV5+czMnxdssH9e0RZ2kQJk9Vr+JxecDKUC26frfNgsd4Tj+0bcmIZGT4oBLT
 mCoS8lY79XveM/fXz8rWqaUK3WiczpL0J4oppYQEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Commit bf95c4d4630c ("usb: gadget: configfs: clear deactivation flag in
configfs_composite_unbind()") made configfs reset gadget->deactivated on
unbind, so that a rebound gadget could connect again. The UDC core now
does that for every gadget driver, under connect_lock, which guards the
flag everywhere else.

Drop the unlocked write from configfs_composite_unbind().

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/gadget/configfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 51df6d1d1487..c0f9e6625b64 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1849,7 +1849,6 @@ static void configfs_composite_unbind(struct usb_gadget *gadget)
 	spin_lock_irqsave(&gi->spinlock, flags);
 	cdev->gadget = NULL;
 	cdev->deactivations = 0;
-	gadget->deactivated = false;
 	set_gadget_data(gadget, NULL);
 	spin_unlock_irqrestore(&gi->spinlock, flags);
 }

-- 
2.56.0

