Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB2C192D97
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 16:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773506538; cv=none; b=nnX0rnJ9gntD5/8vEv+IA4L7Y3Do8svomIQTY9UZ7tSO7rWZepmFoOTt4y0DOwJF18aNCxW4FNsIxZKWp0nX3DvFLiPKxQctgobIYnpwZ+naYP41yklbUipkgNoDlxvbqrh7YfDTKfB3CrAdfkYJVxh6U3blwPVJHZDoFR0zQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773506538; c=relaxed/simple;
	bh=aNW/SvQsvqoGJXuSokC/EAS8h/o0sai/yUenLTWBtuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYIWMUfDw8UPOPjzg40ovs49t+jS6w5ouFgFk1GXHOX/HHdH+Db69PJUa5q+4ppo2PAn1Fg83Fa5QgVHVBHfSzN0X66W9w7n68uued6XP9Kf2rHgrsp9bnGqVR9+80c9LuKmdYXbv9MsFZQJFWNSWgrjGUI5CaxL5dkW8EqlrrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=e3davlIR; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="e3davlIR"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50919fc3a14so37637961cf.2
        for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 09:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773506536; x=1774111336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fy06hteiKF+m/zJToPVb5WypJzO6ZJ0i6MwB/Wn9jNc=;
        b=e3davlIRw0vtox+jEw4C8706Ik5YbO47J3vuOHlPL7W1WTDDVt0DMVWcaBlJmJ+XX/
         bQQd8pj4HJxzEeg7vSCT9eB4Pkq9z/j0ExiS4Q+vETE6yDUfAhnkRfLDN+3ILB3zGwV7
         c0tWI4xOnJDYNr7Oc6zVu2d+Xs+RKqSUhIOGQuwobJtC2lzylZVT8KJU+TAAuTf6oMB5
         TG7LSlr2meFEcqSfyyF1HKXS7W8h9JXbiZZjB5COmIRSpastB8EgwNX4FbDPgqNh+FuU
         uh+BPIgLVnjgo2EFljrIkWv6c+Q9xoGjOqYDunUL0MuqwZtcn7/saY827ProkHMQ2Jts
         VdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773506536; x=1774111336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy06hteiKF+m/zJToPVb5WypJzO6ZJ0i6MwB/Wn9jNc=;
        b=RVXVbA+VS0up9lykynE92fy8rI4f7ijjLRqsmuXh23BdzTLsOx/8oJiu5kw9a6ML8n
         cz0Ksg2DwKFC926A+FZ1TVnBW7nszx1QAV2YxGSaIKty3Cxcm0QuFH5YYydKjAxJcz75
         D253EwIPFR4XFS5ciE3umzBTEvxjBCfNP6xzQNMEktfuKAAGEc4dhft33Tvd/FW+zBGH
         fAnu7doXRfjMZdpaYPFf7ykRDW4dYFIofowxAK1Vinha5HAjDmboP0XzMP9fzcJtrvYn
         I3CAVg9WA2JDANVISXq+kotrtj4Xii8s7J+s/WdKj1kg0ipQeh9Rz6ora+oQ0uMzaihr
         KV3g==
X-Forwarded-Encrypted: i=1; AJvYcCWUrE/sz8tg7hKf+y9xFeJnRHBWk80JuOEnGsAWxQl8y626shSaYY3GbpXHDSqIozscdLucgSG4NJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPmfexf5FMgiJbAia/Wf4kYnoczv+3W3K/pz3IMRwd+AhoN15T
	bKIq71Nz5z7YIvvivT9ysRROhUSLEkpUK1mhZHsCYyrBVrBSG1ayikzEC2gEHq9BDQ==
X-Gm-Gg: ATEYQzwKspVSbbVhlBqkf2jY81p+tcyiOrK5gwJ87twwBGArI6XnZ1hfx5JPbyBQ5pX
	7eMsEgNfUN1g/Dd3o/HFBK5JUDx9pSYuqRoYqLOT6w1D13xA08a8NX/FM9fLJWVfNOzgQ4MJIso
	OWmRUZEqiB/Kqed8l6w6Eq+o8B94lJrTJSyRdqLDRcl4iPtpTqwRVB4jitINKP4xeNoHYOxIA8+
	EHBJaMwG1nYEpHSoLYRZfZuGYLtBBJpA/qufCJ0c6n3ocbBcz0TrJuZFr6yL8Ep/GH1X+UhO7kT
	KPVnJNKaBAb5H42Fu1ELyNUT60p5qqIy5kOsmxa9hAKQFZOgT0sakQuvnc39mI1wv0C0XLGl2RL
	ltKepYBVohlKoaQrzKQnDSef7PvQIaB6f1GXBrdABSfcAD3mfF2HH30HixkAmVDq3Wdq3HQXwqd
	5tQNlgvsCY3eDn4bFICWpZKQAg
X-Received: by 2002:a05:622a:93:b0:509:4b11:6cf4 with SMTP id d75a77b69052e-50957d51ef9mr100259131cf.5.1773506535458;
        Sat, 14 Mar 2026 09:42:15 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a14791dsm81733201cf.31.2026.03.14.09.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 09:42:14 -0700 (PDT)
Date: Sat, 14 Mar 2026 12:42:11 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset
 (4)
Message-ID: <041e5d18-6120-48dd-b137-e10020f0c191@rowland.harvard.edu>
References: <ed831d20-3d7c-41a1-8710-f1aa5b39877f@rowland.harvard.edu>
 <69b48162.050a0220.36eb34.000f.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b48162.050a0220.36eb34.000f.GAE@google.com>

On Fri, Mar 13, 2026 at 02:28:02PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> Reported-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
> Tested-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
> 
> Tested on:
> 
> commit:         65169048 Merge tag 'spi-fix-v7.0-rc2' of git://git.ker..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=14ab954a580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
> dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
> compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=113b1602580000
> 
> Note: testing is done by a robot and is best-effort only.

Just out of curiosity, let's see if this test crashes with only the 
second change (moving stop_activity()) and not the first (moving the 
synchronize_irq() emulation).

Alan Stern

#syz test: upstream 651690480a96

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -462,8 +462,13 @@ static void set_link_state(struct dummy_
 
 		/* Report reset and disconnect events to the driver */
 		if (dum->ints_enabled && (disconnect || reset)) {
-			stop_activity(dum);
 			++dum->callback_usage;
+			/*
+			 * stop_activity() can drop dum->lock, so it must
+			 * must not come between the dum->ints_enabled test
+			 * and the ++dum->callback_usage.
+			 */
+			stop_activity(dum);
 			spin_unlock(&dum->lock);
 			if (reset)
 				usb_gadget_udc_reset(&dum->gadget, dum->driver);
 
