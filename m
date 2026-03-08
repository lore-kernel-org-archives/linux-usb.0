Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C1225B1C7
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772984174; cv=none; b=et3TB7hG4EP9xWjjSJj3LBXp9Ho0HiEVwnt2aFrbih0xipeSfnNfyx9nQ6JnXTVjcc/qAoLqMdLUPL9uXEVKlF+OWx8253OAXlWRNnAnyNKFRdOlPbflxlPjSIXvME2XJdpVRQA89KFCn4kf/Kt3lcI1iqtj7+jGzcjaBC7XGVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772984174; c=relaxed/simple;
	bh=VDm7DFc51pvKxfztX1bOex+TkSYZIT0yk3PLd6t4zv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HP1YEwzDcJoUVWJMQyNbxpos7hIyTQtOatKs5q4qLvilccP08UVYsrBB6HmF9lR4UEIifibCBAarHQeSaCe025drl4O8o8xm3Bf2WzdQLy1ePP8RXf4hdvKM+cwaMtNEE9Bu9UtuPi9tMpD8a4n6k9cCr+ESbEWeJqbJOxKvn8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=YllSr4Ct; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="YllSr4Ct"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-506a3400f30so88787341cf.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Mar 2026 08:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772984172; x=1773588972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eJFGFfbLvoUW+vvufsKv0Olt6HStJmqumZStJpEoOlQ=;
        b=YllSr4Ct8LRATvEKJJf+uryN0vJp9IX8Lq54kqp7cPNFRW/0Fs1S1z3TYwwZfjfIAY
         0Uz+O5rc19D2wi9XOpRse+Q2s5hPV/TiyFNMLJ+CrnUoJFLbg423pqTQwXOJLYFZxUW/
         WtZ8JRGHNMwOvQx3+tlx3Ktr1h3X6HCdL7b4iFPCRseVpC38NIs/WnA9j4ByiD9eH0Y/
         u7LvA2Stb6uf7i/pKj/oB2EVn0JpgGNofEZFei/K6BsMJg7CunLHhH3fy92QhpI3IsVU
         q0245cfgXfF+gtHeF3lW8Xzqf71uBb04jyky3VtMZv43EWXFTxqpHwOStActsHjWxBco
         Xj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772984172; x=1773588972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJFGFfbLvoUW+vvufsKv0Olt6HStJmqumZStJpEoOlQ=;
        b=CDframZbY9JnUqyfVtDgziPs7hKBaNNUY6DcniMe4mV8Bt4XRyNPR+89OthJ11eaK0
         kF4coKZe3Zq62OCZua7FvS5nbbCip9IEX8eiOJTccnRfJyAQJmlEWd+TD4D8MFzEQ8I2
         aMbQ257QdKuHv01iCUBqHZwIlSUK7oQWLC2LES2XliIvMyIJ6jonZLffwV99zqpQwoUj
         o0Ro868snPoNjBXcimzZBDlEVxsxcR8HPsory5PPibl3VA+R9Mb3ETtyMZBvXJ5m7Mz2
         5johYCmjUh3OMK4/WTbsnpkPALL6nZgI9zmfK4LpRxI6LxqKUGdZJFUbi0IRoAfRwcNT
         +QaA==
X-Forwarded-Encrypted: i=1; AJvYcCVdolY50lX7D0jpFstgZhsUQyDTq+iX12UFKSCFe1GM6AbXVnPwZ+f+WS2B7Hb/yH4Ue74PdviqvLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjKrZeD0L03GV9DhA7o6BfipK63x5/vRJTV7PKCi4d/BbeowVJ
	09sqbf6JWWylkEatS5kpeViHdflmxBC+C3R+BEjxngg76zK1WYqQKshqg2cvAQH+pQ==
X-Gm-Gg: ATEYQzx7F54av/LF1JZp4M0v4dxnZuccNx8SDKK2Xz1uMcNhjQUAq8Hp7VITs2OetA4
	kapRp/azetWP2FZBN8PjJuK/0OOqYtjRoOn0o4+E6XwEA7BPmLsDMnV74V+vRzh04zcSzQW+Mzu
	TJSog0vgs9GMz40L/RZKmWckRwc0sHWfsO7y9krrSX+DwrQBm9v7SKPE3fNDHJKtr7XCEyMK3wN
	4OwkuyxYuPacTdB/EgQtpyaFtTGm//6YMfqGuP5WCuGFBBOeI0VywVNdtcimZ+DBjnxwUZt5G9c
	3U7GsmHcofAPgB+NHvmej9iGbSxjFWdfHYi7T3YsTSHp+hoV3cQWovbAra02gpGBy7LWQNeIz9b
	a45iwpU55rPLjs+7tzhza7P0EyDTiRVLn6k2zn7eQn2GtJel8AjewVUsHAvtg0i6luATdvGhT3r
	hIADdX5bp7e/gO0ATdIBUXrKDE
X-Received: by 2002:a05:622a:1303:b0:509:1554:77cf with SMTP id d75a77b69052e-5091554794bmr19452501cf.20.1772984172305;
        Sun, 08 Mar 2026 08:36:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-508f6695614sm52085031cf.22.2026.03.08.08.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:36:11 -0700 (PDT)
Date: Sun, 8 Mar 2026 11:36:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset
 (4)
Message-ID: <6f521b75-5e13-43b6-9e1d-d2a052c68597@rowland.harvard.edu>
References: <68fc7c9c.050a0220.346f24.023c.GAE@google.com>
 <69ac0368.050a0220.13f275.004d.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69ac0368.050a0220.13f275.004d.GAE@google.com>

On Sat, Mar 07, 2026 at 02:52:24AM -0800, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    651690480a96 Merge tag 'spi-fix-v7.0-rc2' of git://git.ker..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11ec0806580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
> dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
> compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b2db5a580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14fed8d6580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/0e393fccfaa3/disk-65169048.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/2930e8c98c89/vmlinux-65169048.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/34e9e7d322b1/bzImage-65169048.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
> 
> usb 1-1: reset high-speed USB device number 2 using dummy_hcd
> usb 1-1: device descriptor read/8, error -32
> Oops: general protection fault, probably [  120.351719][ T6052] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI
> KASAN: null-ptr-deref in range [0x0000000000000040-0x0000000000000047]
> CPU: 0 UID: 0 PID: 6052 Comm: kworker/0:7 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:usb_gadget_udc_reset+0x27/0x60 drivers/usb/gadget/udc/core.c:1200

> Call Trace:
>  <TASK>
>  set_link_state+0x80b/0x1220 drivers/usb/gadget/udc/dummy_hcd.c:469

It's a little hard to tell exactly what is wrong here, but it looks like 
the driver argument to usb_gadget_udc_reset() may be NULL.  Let's see if 
that's really the problem.

Alan Stern

#syz test: upstream 651690480a96

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -465,7 +465,9 @@ static void set_link_state(struct dummy_
 			stop_activity(dum);
 			++dum->callback_usage;
 			spin_unlock(&dum->lock);
-			if (reset)
+			if (!dum->driver)
+				dev_err(dummy_dev(dum_hcd), "**** NO DRIVER!\n");
+			else if (reset)
 				usb_gadget_udc_reset(&dum->gadget, dum->driver);
 			else
 				dum->driver->disconnect(&dum->gadget);


