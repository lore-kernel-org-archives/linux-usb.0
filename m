Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2D534D3B2
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 07:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816644; cv=none; b=SQnJfw6l5szEG0I2ZVuQKnvuLtQruGzQfvptQQtRB5So4Sisp4FaTrMp09v7JaQ8ub+F0QmEVbLvWJ7q6gQgT7ODTIkf0rgliyBrqJpiQdkS9XXUc0LDGI51nmUiO9L4+i6/X5zT0v3cwVwgYlZkNlZLPgv0YCTNx3zMmnZR2HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816644; c=relaxed/simple;
	bh=qLvwCXRy3RLAF1jAexP/5dC0+vxp3bNryOjD/RQVrGY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Hmc36Z45PmIoFUYOkxK4cTlAKLAwELf99NIUVA5kp1ss2nsblcxmLqqM81LMjT1Qgt/2b80c3u8TOgQquFz4DD/d/qMotU2Ec7I9EL+gYXHJ+/B8VeBCjiIXSa49KyUFP5LGxY7CzDQR82CO/XbiszXjc1GaOROalfmjAELACK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-43cd2d12617so3908892fac.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 00:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816642; x=1788421442;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U2oh1UrHxyt7XY5/MlGcd+3IUC5ZbqN/eEEyPs+3890=;
        b=DGatMG+FZykjSPuznCBXowkJ6DtZb95PbAFB7YbbRU3pGUYH5FnlCbEzW5G6c3jZPf
         brGLdh1i9KcsWQ216/WcU0ibqdRoGHPre/3LJx6AD3VlEp6GZAO48RcRDe25Y6B2XRfV
         RB/Aj/+GwR0Cnct2cMrULTLOi1cpgyelNPX2L/hw2NXc9HfS1+dgwf/7Ht2AQP7DdQtk
         VOoyB7Ee2sZgOHQnrivDKdsfxvrmxlY+DDMKhIgKRlsDJyDPgbCy0qEkaftqyCk/nYqQ
         Jq+65Q/JQw1JceOg29i620wiAz9VhJnOfK0uhTsworArhFmyGurhyH8Ym46hquWGgi3O
         CkLA==
X-Forwarded-Encrypted: i=1; AHgh+RpuVfR9SSAHxpF652n4AsHDhvVAjDPWVBExuZQNXX6SErl53iUUmJad190igwmf4XFTBHYVJGyonrE=@vger.kernel.org
X-Gm-Message-State: AFuF++m/45oJQvS3nME/Lbq/3ULEfXQpGnWV+zLTTconaPbGYVOFzOyq
	yueD3nZCIYQCa5VJ2keemu+HF6DcOVJmMdSCERHuM50MiV0/EgQM/908VrGffTKItfAc4yjUfAY
	WCIh5HjW3pl+i2sUTB368jFXC/dXYfZ8E4ErDBdtyWmWd3kdzuumfAk+VZ4M=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e2cc:0:b0:6b1:55d0:6e69 with SMTP id
 006d021491bc7-6b1a049cda9mr9733598eaf.18.1787816642360; Thu, 27 Aug 2026
 00:44:02 -0700 (PDT)
Date: Thu, 27 Aug 2026 00:44:02 -0700
In-Reply-To: <20260827080226.4ec229d3.michal.pecio@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8feac2.50659fcc.60cd.0010.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
From: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	michal.pecio@gmail.com, rafael@kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com
Tested-by: syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com

Tested on:

commit:         73e3f071 Merge tag 'nfs-for-7.3-1' of git://git.linux-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15bc4579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=22381429a4c2735a
dashboard link: https://syzkaller.appspot.com/bug?extid=fd7be5ad9795b7f29df3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=124f3979580000

Note: testing is done by a robot and is best-effort only.
