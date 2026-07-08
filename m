Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266494CA285
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520548; cv=none; b=CjxO+y8wiHXTT3+R6w+fkzOdmgmJKRydJq5YBZ2wsyndkSyypwe+QpRJ+2ybhVnxNFpDAnRsEqnhIXS624Gp4C7KiKwwZOtWf9NaBd1rTU5AZNPfsTP6ueYHQeB0S+T2UkuOpCB7s4d7/s0jyBA/wFtVYkccYiZTklba3VYIYS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520548; c=relaxed/simple;
	bh=h0QO5XdJUfQMex0aeEVpwEZ4dEANRoqUqIHrPbxQTVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCRF8UhVABaLtGCb17ZwISTU/QjfFEsH66/59+sKSZFZSsKBJjxr09yGMJjs3/r5jNwEtL407AzajlORCTU7JjFR7bucR1H8q8soS7Ix1W6/BGm1x5IMiA1T+ebaD++l18zltLjR7X0GIgnj4WfWnWL2w6bFBIeusk0A9VUdcqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gwRVwaRB; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gwRVwaRB"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e65e18969so53225185a.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783520543; x=1784125343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JnfWEXBlBehbKveVFUNwsB1lliCmv111qtv5cAgi0xc=;
        b=gwRVwaRBbdyrM3YkCtJ0IqQnCkAVwI42iqxjJysvfk0vckqkKIe3QU/osam7ex0RP3
         h+A+6NqwQmOqyt66mPZedwpybV+QLRNt6m+MnQ+qVUWBt45hGz8pdyHo6mTKuVz0z2T0
         JHy4/y7VfB2oLSj7FOtK7cdOJ8U/o6Y/FP02wNYtcdGXBS4BrAebZyzmMV03QofqZx4q
         y0UPjYdBgrR5uwpiLb2ugSe+CiqbB2Gp7X8sDcA8Ao8Z+fXWCDBnum2WTvnNavBGYs4/
         urMYrwiDPxUrMDz5BSeuiFJYuxYSuSosOWmt4kF9n71uAfvRJVbxRKTg3UgEr7iGBzuC
         qhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520543; x=1784125343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JnfWEXBlBehbKveVFUNwsB1lliCmv111qtv5cAgi0xc=;
        b=XsV1iZQXdjGYoYmXh3uFcyUnwE4BjIT9odnTn5EiPlfMFdkGFRNaR2a/pPKfRbRuol
         Gh/WFMajy1jpDPAqtM6uOMnZy1P3hAa1Mrp0wK3KSmiKORGB8zMqXPXJdXqy9gF7JunG
         NfuVn4jojM3lp2VlQjFf+5bbLhkyxBRIyz8am2mJbjvXlKgvkDfZHp77fK2jG8HRGdV4
         u07oB9u2TD4XDNMdxtTIEqZ9whNliJwpilnLHFKlZSZWUooSuo8InYz7TS7XCtPh4M9d
         YsOm/GeI0qQqytYsS7xhD2IHJgJAnCZwXQBfEVVlfZr0ZsJoqs1X66x2zphZqQOA0QB1
         gGlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3NwkpXzfWfKrEjPyc4TpUHyPgz22sKP4ARWwWZOkl8EzpBlPQ1l+PCoxWg4h4iUkmy6gcTTJuSho=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFIoW8ZO85JPAxEfufJHHD2RRgSCanjkSfoACGbgKmwss3EDEx
	1jxQmfWljAd9q3E+STs0snf9UxISGw0E5SqZig6pPxG+HjgGa3RDW4PjVOq4Q+E/u+pxF34szpM
	tOyU2qg==
X-Gm-Gg: AfdE7cn04KHO1zCRw8cHxkjIElC9oyHd94+zvE17AVWb2DtwgDzSPzac0mz2U//k87k
	vb93ZZvBYpaLHwqd4ZB7YshABO3XG4Zxsh33XwfujdwH3Ng1Cm2xmQr0m1aIQztHO7Sfm+uQ2eh
	a7YFjfUPlT2ftGW1jr+MGgL0FXVH3kMjvQXi3VSfwISRC4pBLyrM6/TTQ+jpBMnGPl79s9nxNDZ
	nIkQr3/bI1nvdCZ6koY6mV/kSnnin5gYMgFPms1jI/RC9ybWxLkb+Ue1xFv9/GbhkKHOgm58hLV
	ufn7LsWsCbfL7pCX6rMVKHtqch2GkjDzu0/CPL/Xr52Z+zSXFW0inWUdmPcItxaGS70Y8l9Sr/a
	DUSzaasBN1F/I8KNaJwmYadEmEHcIJcRyNprCLq0Rfk1zE4/fTZSR0t1Et+fnJl3hGSYjn35/CQ
	7f0P5cOZ/00nYs1A==
X-Received: by 2002:a05:620a:1b97:b0:92e:5c59:f364 with SMTP id af79cd13be357-92ecea3a713mr286605285a.34.1783520542744;
        Wed, 08 Jul 2026 07:22:22 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e9095e780sm1428986785a.0.2026.07.08.07.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:22 -0700 (PDT)
Date: Wed, 8 Jul 2026 10:22:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+e69c25cf38a53d0cf64c@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, hdanton@sina.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] BUG: corrupted list in usb_hcd_link_urb_to_ep (5)
Message-ID: <61ad2e9f-d4c6-4879-9b36-afbfada101be@rowland.harvard.edu>
References: <69038243.a70a0220.5b2ed.0048.GAE@google.com>
 <6a4a30a1.7b9523b0.16a4a.000b.GAE@google.com>
 <bc26a2a1-64ec-4ae1-a7ba-2caf94785e74@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc26a2a1-64ec-4ae1-a7ba-2caf94785e74@rowland.harvard.edu>

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

Second try for this patch.  Maybe the current -rc will work better
than linux-next.

Alan Stern

#syz test: upstream v7.2-rc2

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

