Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6874B471D03
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080065; cv=none; b=S2t4+UvFHphElQ/xrbROlryCuqr4kuEQQblf155CVTCLh3kwgO5wzrmt5r/xm9yZ6E4fhDYoKGXA1kXNB4AQepn4b76HjT84ZStkmdSl28b4J6TJl3N7hbRjCcbnxc5dCdXmP02qaVQi6Dwi1CdCZzQ/xNHSTUzXnsuHrR6Z/CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080065; c=relaxed/simple;
	bh=DK4c55g/tzPTcIBg6XeoxcaeiamPH5AZ1Td+iwKZkD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQD/xBHFAJQGez5oQhF0OFejEYlOXr2j/s3g/tVWN/8vhBkzfqqSzr9qhh85dtKzYxxQtDC3md9NUPY5mp63ig1F/4AvsEVF26Yu6KXcouOZGmtjPfkgUMDvUylXhAR061rA4wMMLNFioEBHm5gTws8n/PJuwacY9w8n67xqoes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=myVya/G1; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="myVya/G1"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917a6dccc60so1659426d6.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 09:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792080052; x=1792684852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SbpT8BLJUAOEuxeA8KOnTCYBccRzkGTlx+5Bc7jHz9U=;
        b=myVya/G1/Nv5RG+UeumL2TYXPLnMvH9sZ4xBXpyadoSXM6SbQtySM2UX69OSvaXxc7
         W5u1rUQXYXJ0J+VJp1CoqXpi/QkR3h9jw06Eajeiuj4nkdmRf8Mkm7Cml0XshJPCJ5v7
         nD0xiVXVffrfezcCgaWjmqh1vhU9AcFA18g9M8BxHfNwEzVNBkRwiPgXdNufasE+l7H9
         A09rm2lI7mljgcZHBSrI/VtFf9qEIvmwN15Ju/ygX+Zts3gGAt5GgIZmgZ7utFk0mFIL
         tKd5H2PpR0D240hHrvtPOAlhl2PJ5vViCEG37XjIQfE/QGTvcmfGA5AFJ0fGrBAjdLre
         SN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080052; x=1792684852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbpT8BLJUAOEuxeA8KOnTCYBccRzkGTlx+5Bc7jHz9U=;
        b=NpkKuDPXKmRpUFe/xcuG894BAqK8YDqlPYumA0UKH/mXSo3MXMp5H3X4zSDBxXjQmB
         XXKiBzxlShBlBYU85Nm7YbTFYwa6QRngfqLouogjbZLU2UmVb7J4tCwD9KgYLh16jqOb
         p313cmyGiMSBdr37cF8kdOK47xvyVd/5okj3JK624SaqYF+Sq1iFscWpVf+OXID0OUhA
         FdEi8b5b4asFL5i3hFtoMOC9wgAW9cm+dWAYr172+ATkO16gabDX1YxH585WsfvfQ4IN
         DxzCettMU9q0NUwCEETwzMQYVt7fybcqBiofTMM+iZqSvpoM4eCWpLj8Vz3G6q/aTWSY
         IR9A==
X-Forwarded-Encrypted: i=1; AKwUvBwF9z3Wurc+tBNp5yVfIu+ny1vWfb/jXxo9E/T6G+3DCHzO4XBkr9NT/6fHdWMYnm8dldLzGsBck0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHcqWoEKScVilCUGUrjFgqKoUsgiK0idPmh291By1rK6N6eM1Q
	XghrVHMGsSo769bTFadVV/t8zbbZ2yV9ifbFEPIckK7squkshzsCClC49fgtu4AD4g==
X-Gm-Gg: AYBFou1gv9kOz7StntyUdaxzh+tILfqPS3bC6Wzo+IwDkmTHuR7tD+dzOePlIFq8kpF
	Em0ePlvyZ6a05oitKOF73rXu0Bz2ih55/x5G757seM+WAKxk9huJm0Z51+KeROGSlcZ7GW1Uomw
	C5pMAhKsklab13bqA1/OB0RhdeXaHJ8SVbWE1wShRKzwkW4HN/g8UxPbwY7h/VcgwEkMZ2pu/VI
	ObSED6DCve3Jxz6c0xCFzKBvpiExDKwA9ICNW/vNvo+3F3uM1RC9sgU7EUEqK8crFMuW+kBka1R
	5o7or5xf01Z2mT84oVClhvR2THOGxsFGafCx1F3+lEj7KzVFQmRuVWUAu8qv0f8/nKCQnIxNQl5
	FZ2tSqikjEUySqp6RU4VY0AzB72Q1bGhtsQ1CtYL5ekShi2rg6XBe7ZEbVkyPmc//tWy4SKNFel
	sOCz1sLagAFQYW8mH2usdi3nJkdf/hcU2oOd8bYnmmazG5eTmg3Kez06maVNqeXEIks0GbjFA6Q
	V+h6a7OCM44JUrdGu/JIMNrr9sYmZrpyhBb6c3t6YwHqtgJw3qK
X-Received: by 2002:a05:6214:45a1:b0:914:3120:b7c3 with SMTP id 6a1803df08f44-91bc91c136fmr9205076d6.7.1792080051810;
        Thu, 15 Oct 2026 09:00:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c4a7d9sm84867566d6.47.2026.10.15.09.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:00:51 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:00:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	=?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>,
	oneukum@suse.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Subject: [PATCH] USB: Documentation: Update description of completion
 callback context
Message-ID: <de582feb-a0aa-4fc8-9818-890014de32a9@rowland.harvard.edu>
References: <20261008094338.301a75fa@kernel.org>
 <06a81ea1-b17d-40bd-82d9-922de946b86f@rowland.harvard.edu>
 <2026100910-petition-embattled-94cb@gregkh>
 <20261012194902.aEq58Q6b@linutronix.de>
 <8545800a-a37f-482a-9b06-cbdd70312b7a@rowland.harvard.edu>
 <20261012212527.5sFqlGYu@linutronix.de>
 <41af30de-4725-4913-9ad8-54d1dea2d4b8@rowland.harvard.edu>
 <20261014191141.GxlJhR1e@linutronix.de>
 <89da3b1f-60e5-4f18-9592-3d6d7175c437@rowland.harvard.edu>
 <20261014220403.R38Gf0pW@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014220403.R38Gf0pW@linutronix.de>

The existing kerneldoc documentation for URB completion callbacks is
incorrect about the context in which the callbacks occur; it is not
always in_interrupt.  State explicitly that a callback may occur in
any context with no guarantees, and likewise for the status of
CPU-local interrupts.

Documentation update only; no code changes.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 drivers/usb/core/urb.c |    8 ++++++++
 include/linux/usb.h    |    7 ++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/usb/core/urb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/urb.c
+++ usb-devel/drivers/usb/core/urb.c
@@ -254,6 +254,14 @@ EXPORT_SYMBOL_GPL(usb_urb_ep_type_check)
  * request.  The completion handler may then immediately free or reuse that
  * URB.
  *
+ * The USB core makes no guarantees at all about the context in which
+ * the complete() callback is invoked.  It may be in process context,
+ * interrupt context, BH context, or anything else.  Also, local interrupts
+ * may be enabled or disabled.  To deal with this, the callback routine
+ * must always use the _irqsave and _irqrestore variants of things like
+ * spin_lock(), and it must always use GFP_ATOMIC for its memory
+ * allocation flags.
+ *
  * With few exceptions, USB device drivers should never access URB fields
  * provided by usbcore or the HCD until its complete() is called.
  * The exceptions relate to periodic transfer scheduling.  For both
Index: usb-devel/include/linux/usb.h
===================================================================
--- usb-devel.orig/include/linux/usb.h
+++ usb-devel/include/linux/usb.h
@@ -1605,7 +1605,12 @@ typedef void (*usb_complete_t)(struct ur
  *
  * Completion Callbacks:
  *
- * The completion callback is made in_interrupt(), and one of the first
+ * The completion callback can occur in any context: process, interrupt,
+ * BH, or anything else.  Also, interrupts may or may not be disabled on
+ * the local CPU when the callback runs.  A completion handler routine
+ * must not depend on any particular properties of its environment.
+ *
+ * One of the first
  * things that a completion handler should do is check the status field.
  * The status field is provided for all URBs.  It is used to report
  * unlinked URBs, and status for all non-ISO transfers.  It should not
