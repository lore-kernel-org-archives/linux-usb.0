Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92E729B204
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772985664; cv=none; b=XO11qSuy8q1pkFr8g41J24ZoAB21m6mXXstV1uM2cCZfTkfQo3xDK4ZIz7x7rkrV2FIeZAA3qJshP/YnOPh+k0+K5alZkadsQv4Vw3XB9vmABwDas1xEkRocxH2ERJGucslyAJoQkuk4SdTHxHGWjIPtTbC+uPW8Il6bfJ68Lro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772985664; c=relaxed/simple;
	bh=HsEuan7z7Q9ibP+RuZkRxItSfhc6Ghcs8s8uIjPmDek=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SxcYvJzHvT7+kqcX8HDuogjimXu2YXaQOjucA3VjInDWXvRrZW+rpU51SOqCf23h8LIwlP0Wk4N1q6bZRqL6PRfH0TFkdOodjC5INOVaS0LtEdYzxhsBLsusrjPbUJ76y1xbjpiYnNAJPZJFa2pgL7Ai78Hr7VbRF7AhbXLYKfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-67ba8d8546cso16072457eaf.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Mar 2026 09:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772985662; x=1773590462;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK7KmR6ohJDpueftcW91mHxIvoeljfGJ/ECTb9DnA4c=;
        b=ef+6kMHMyT18aGvRfJveJsM5hnL6ifOMqO5E9+0YLyEXJbpTO3qEfUjh1grxIduvYr
         pBVCsSbkriRA6kE4yrV0Kv6t+ij8i9QTRZmQWgWlg3nYyy0drg6edeY0fkARpHHynWkW
         pK/SmU0zU8ieuXLKmJFLswrqG8VBsFIdZ2+9pmwkOputuO9O8XnrsBeZOFhL9nJtQH9r
         Ckc84Wy//RsC0fsG6M8ERdD1F7DK2d4ZdU4oRnbHiRBfU4OQFrjFiIL5y2t8zSXId0g5
         HZvC6sGlEqmmgU/96oGk80LWMAreFXjK6r/e30ri96IDFNw4h3Z5a25BTl80SKc+b73Y
         i8Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWunNIuHX6mFXmSm16jjSWbhBmUD77gS0RC66TvzWmKrP+K7jJyspcr0MfXOvNj53GeDQ/vBku3IpE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zf0yo90LKVGBWfn43mRUEYjJDRO5Q+mZmG2X2Yi+WOT1A9L8
	0s6k30SZtuSuQ3wWNtvcMzrhwCusw+k30zZhwskaM2zAR7e9wVgrqdXzeQb0C2F2MIIP2ObGDWh
	iRLQvy/3vIW2IpUnjHfE5/gcQlke8V5ZnUz5yE7yS96u/tp5MWd7iekb3L/o=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1b05:b0:679:ddd1:a4d4 with SMTP id
 006d021491bc7-67b9bd0d35cmr5251548eaf.44.1772985662009; Sun, 08 Mar 2026
 09:01:02 -0700 (PDT)
Date: Sun, 08 Mar 2026 09:01:01 -0700
In-Reply-To: <6f521b75-5e13-43b6-9e1d-d2a052c68597@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ad9d3d.050a0220.310d8.000e.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset (4)
From: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
Tested-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com

Tested on:

commit:         65169048 Merge tag 'spi-fix-v7.0-rc2' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=133f3fe6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=178dc8ba580000

Note: testing is done by a robot and is best-effort only.
