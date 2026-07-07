Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F1C43F4B9
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 18:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783449857; cv=none; b=cCA1YphCWgiGv7WuPJQvs6Yil90KooytFnkdTzJ+5TJraV67Zr1kjFiTqgikMmFfli70vrEIzw8amivMuytAhyooi5SBclhIFfylNnhaoB7D32YM61UpxR4pmdun/O6ehLwFp+PwRrsjPi40kNh4Gl18CHsgb95ADA40zVmcEeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783449857; c=relaxed/simple;
	bh=aukpzVSxfZxjF+NzaJHXI+kUskL10VfoO6vIaTA+YE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/6YOAL2m04qk+G6MigNWzW1cdYXtuPkrkueXlGP8BwkuY/oAPMRwRuYKOiqiXaVhgZ4IlvBMnRdU2z78WYRtnbPb6mHKdibPW7eVROaJu1hqYPy3pQXFzjc57S8fPMfxvlrD1vFePvosOZUpGMsPIR+YCQF24Tdihh4lnuX/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=TFNNSmxD; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="TFNNSmxD"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e6391b114so323824785a.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 11:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783449839; x=1784054639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KFYyFU18VsgcbPG2tl9WpeEPZjwe96RQMUviz7enkYo=;
        b=TFNNSmxDasCN8jgPlVCDQN2UG5pPG8miakC3JKtMUGoOiNdMOvyu7bFvVxIDa38kai
         KUijr/uw6OWc6Uu09iAZid/4YPRbIx5XqjabzJMS2vC9Kant1cVEi63E/m/vyf2IKFzC
         1jhoGEfia3JQGDcaUtc/zyoVkMln8eGL1wX9COU6eRJP9wMBqNv2W6kW3EjYIvSdwD/F
         nnnSHHAhOfxy4wegyjGmdTZUKvBqPZwHqz2mobop7oB/DKPOIOGXqews9We1bJFT4w7r
         92Kn7fKj1IpM8rMx7vV/WNppPlqZYgT5DqTUvRzD/y3JQj/HxfoTz9cLwTlmSNWA6W94
         ceFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783449839; x=1784054639;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFYyFU18VsgcbPG2tl9WpeEPZjwe96RQMUviz7enkYo=;
        b=hyZ2Dgud+41Yj8ceM2TJhSUxogVZGirawn+uXGxjxiLbMy5RPNiPagntFFmERRCjxR
         oTNplO/HlmyZNrTtWOsq+KyMeDk5MeOdaSRQmWGeOd7CPFzmtNCFUCSSUZLEUqv84PjS
         X1gbflz6lXZjbKRbfqLfDuoyeOkiEpofhZZJvLzF1Rfau0fJbU06VtDCDY3t8CMIumzP
         kWaWdQU2/4PjqOUMYdr9q13e34L76pIilZxe0NIyhF1j/FZzehBxCVRqN0TKsa8JDo5c
         Qew824gPAtdbD2us9Yf8PAPqUxdhkCfHsSCOE5KkOb+QBvPYPfVF6J9eerRPqJn6x4IS
         xKgA==
X-Forwarded-Encrypted: i=1; AHgh+RpvdMiifMPrqyIwAQRdlu4uKjl07kg2QxZGKYzAyceOEBuNrRcjngWzWOjrVe9pVtiTXrzJtIg3VKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzKDzkoK9ywrBJ/lVLCPQToMz3lKk6qAsbZc/C/9KDDcUAGXK5
	8QHW5o9b8X3QruSjnm92HDT4FoVx2hx6JJb6BO+8v3UIf5/KmNdduVonyCjUtWirYeSV3AseVml
	HDebhfg==
X-Gm-Gg: AfdE7clMU7CMnAAv32YPqEdAO81ctq/vudoVvgtI2N46jbr6BBJV8lhRIVmff9CJZtI
	oDp5O3UAARAmA64ywA6BIMKmRcDTpxo6z1qqactN4Zj38q383HbcAHRBD6K/jD7cOojY0Kg7mSY
	mk3HwbjYAr6NovdfAHdlkH4o5kkhQRDXErK1UHFM3y0s3bWmny+rIdtjG/eFWDw0UFFbXK/vFP4
	o2CzsTqaB/ZRfFaGy5CFUqJ/JMBCok3/D7zq0ZbkfirDx81/O/uI71/m/fKxwskMt/6uwFcGgFr
	7h9vN9Su1nNSIdTqXDJWG8R6dJ+JAmRVRFUZnWkO3thGQaIZSQ4l3u2RebaKNJj5wUmyruoJ5/b
	iNA6bhoYWujDsKTTJCbuw+TtQXVRRfbwu5wmTyletyz6WlAvAConqEFhqtc3R7ApcvsUwvHKx2H
	8seR9tqjEfwf+y3SASi4lmgxqjmiej5m85Q3hB+ASfj8Wscx7E/ZlUYoQA
X-Received: by 2002:a05:620a:4406:b0:92e:462d:b147 with SMTP id af79cd13be357-92ebb5db413mr710042785a.34.1783449838630;
        Tue, 07 Jul 2026 11:43:58 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90cbe3e2sm1229278185a.35.2026.07.07.11.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:43:57 -0700 (PDT)
Date: Tue, 7 Jul 2026 14:43:56 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+e69c25cf38a53d0cf64c@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, hdanton@sina.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] BUG: corrupted list in usb_hcd_link_urb_to_ep (5)
Message-ID: <bc26a2a1-64ec-4ae1-a7ba-2caf94785e74@rowland.harvard.edu>
References: <69038243.a70a0220.5b2ed.0048.GAE@google.com>
 <6a4a30a1.7b9523b0.16a4a.000b.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a4a30a1.7b9523b0.16a4a.000b.GAE@google.com>

On Sun, Jul 05, 2026 at 03:23:29AM -0700, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    2b763db0c276 Add linux-next specific files for 20260703
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=11f96ffe580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=bc069df559a09463
> dashboard link: https://syzkaller.appspot.com/bug?extid=e69c25cf38a53d0cf64c
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a9dffe580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=103d8b1c580000

This driver has a lot of bugs.  This is a partial fix for some of them.

#syz test: linux-next 2b763db0c276

Index: usb-devel/drivers/input/misc/cm109.c
===================================================================
--- usb-devel.orig/drivers/input/misc/cm109.c
+++ usb-devel/drivers/input/misc/cm109.c
@@ -349,10 +349,14 @@ static void cm109_submit_buzz_toggle(str
 		dev->ctl_data->byte[HID_OR0] &= ~BUZZER_ON;
 
 	error = usb_submit_urb(dev->urb_ctl, GFP_ATOMIC);
-	if (error)
+	if (error) {
 		dev_err(&dev->intf->dev,
 			"%s: usb_submit_urb (urb_ctl) failed %d\n",
 			__func__, error);
+	} else {
+		dev->ctl_urb_pending = 1;
+		dev->buzzer_pending = 0;
+	}
 }
 
 static void cm109_submit_ctl(struct cm109_dev *dev)
@@ -361,9 +365,7 @@ static void cm109_submit_ctl(struct cm10
 
 	guard(spinlock_irqsave)(&dev->ctl_submit_lock);
 
-	dev->irq_urb_pending = 0;
-
-	if (unlikely(dev->shutdown))
+	if (unlikely(dev->shutdown) || dev->ctl_urb_pending)
 		return;
 
 	if (dev->buzzer_state)
@@ -374,14 +376,15 @@ static void cm109_submit_ctl(struct cm10
 	dev->ctl_data->byte[HID_OR1] = dev->keybit;
 	dev->ctl_data->byte[HID_OR2] = dev->keybit;
 
-	dev->buzzer_pending = 0;
-	dev->ctl_urb_pending = 1;
-
 	error = usb_submit_urb(dev->urb_ctl, GFP_ATOMIC);
-	if (error)
+	if (error) {
 		dev_err(&dev->intf->dev,
 			"%s: usb_submit_urb (urb_ctl) failed %d\n",
 			__func__, error);
+	} else {
+		dev->ctl_urb_pending = 1;
+		dev->buzzer_pending = 0;
+	}
 }
 
 /*
@@ -428,6 +431,7 @@ static void cm109_urb_irq_callback(struc
 	}
 
  out:
+	dev->irq_urb_pending = 0;
 	cm109_submit_ctl(dev);
 }
 
@@ -458,17 +462,16 @@ static void cm109_urb_ctl_callback(struc
 		return;
 
 	if (dev->buzzer_pending || status) {
-		dev->buzzer_pending = 0;
-		dev->ctl_urb_pending = 1;
 		cm109_submit_buzz_toggle(dev);
 	} else if (likely(!dev->irq_urb_pending)) {
 		/* ask for key data */
-		dev->irq_urb_pending = 1;
 		error = usb_submit_urb(dev->urb_irq, GFP_ATOMIC);
 		if (error)
 			dev_err(&dev->intf->dev,
 				"%s: usb_submit_urb (urb_irq) failed %d\n",
 				__func__, error);
+		else
+			dev->irq_urb_pending = 1;
 	}
 }
 
@@ -480,7 +483,6 @@ static void cm109_toggle_buzzer_async(st
 		/* URB completion will resubmit */
 		dev->buzzer_pending = 1;
 	} else {
-		dev->ctl_urb_pending = 1;
 		cm109_submit_buzz_toggle(dev);
 	}
 }

