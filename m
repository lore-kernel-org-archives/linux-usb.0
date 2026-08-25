Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4FD3E49DB
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648709; cv=pass; b=EoDocMT94lqIsG1Q/ZXn0sHGyaOKY1NdqepsHFDwIafLu/rXjW6K8+PdeDd/yt2wneI6Xq23KIYrnQ9GCjPmvVPO6Ze0QNjJ8kT+VdDwhbW+oTmUGQ077FWCDzUIrQJK1UWwu2fJXzy03VCnPSA64zbyeyEhyqjvykHiJ0yEJJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648709; c=relaxed/simple;
	bh=ePuHPz3IUOn/zqxGX9xHVY/XTOEU15Ejbga5U1h1HjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0BYCLD+bR9EkTXJmQd0OO3N5dcQAOG+A4tdGO9zLt5ZjP9THNVDCFGZ9ONZ9MLblvcC15nVThj2NyIZSpM2uISy+MF5yBf98gcFWwa7+W5SwR+8CDzOQVy3ay503RGfx102udWgVA6RGD/d/odpR5s3fyDSF6t5/zeJ6f4zfSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V2Yl2j78; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V2Yl2j78"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-455ca262ccbso3742116fac.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 02:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787648706; cv=none;
        d=google.com; s=arc-20260327;
        b=dTC2cEJ8uImsZXjLUdidZTF9xijD9EkdgyzygfmtCad18aSGx5Koi4mMwkPjv87/e2
         L+EDzuJ4z7jzpp8kPKwCdWBKWaQgnxlqsGQWJbmCFZqTlkHkbSloDCO6j1Cn+4/xgYAm
         mTnXKVLHIeLizNqz7xUr4YXzpH/dmvhYmmzrqFUqMMbq71Aed9ZycBubt0rGotoMPHww
         nsey9va4GZ2tlZHcYKR0a6BCwyn68/ZeOVSZyFvW7GJ9FCWyhZxkL3XjvCzmSvUGNdDE
         dzU66H8KEbdOtKnUDZIk2EhsiG5Mn70GkazZId0cRyAfoXdZG4LfBbDURwTTRuyE/OZe
         cZqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yXP5ICtDHoTENRbX0dZZlEib6eWsD00QduAdB9iB3C0=;
        fh=fL0rdvlCyOVSzCTzaaCxI8w4yJq8iu2kHsUOu2uuJl4=;
        b=r30J9BletTCoGj3uxpEeNtSrtmXwATtwAoZoe5A+XVw+ze5C/pCmnjVsi4cQyWMPO1
         0O7GqmYgGSK6+CaUb00+yAM2VzgtaRqLfDs3El96nGdTl3xBpGJfGGQGkqbNU7k7TX7J
         2Wd6ykbvtLz7x5efSnCT1PLVxIpwqTl+gZH6GkPzJul6Ea8vPJrpUKazk3im2sjhY4e1
         h3c/VOff0I8+zi9yMB0PCyhmJ7Gd1sEaDfdhsUi+hhWfUqP3JkX80F0/3Qx8soA7sYve
         wCCM/q/UWfHKF49xokNGgIOC0AE8i9UisFVkWyVKNKLR9wSDabm34DQJfcLPxIa2XvbQ
         ettw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787648706; x=1788253506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXP5ICtDHoTENRbX0dZZlEib6eWsD00QduAdB9iB3C0=;
        b=V2Yl2j78/XJtHzwQpkk7cNU0r81/66tuBkte0wmmCxgFy00d8k3gaoJi0HWbI4mYYd
         EjkD6oluVxOkA3wTMP1Vq+n3U+i4V0b/SnO1rwoxX8+lfpSGRqmeapJqI3z2WwBp5bE8
         pm3BzM0K31t/y5/o5Q7DXGAKoXMdi9ualN2IE9A2/ndO6tv/Dp846KP7/ikoBFkh1dHu
         SA3wsEMkmypc4nlOs3+XcuvQ7sYZWc6glftnoPL4h6xLev1kbgZE7q1TYSPHqQ8qq4Lv
         kqGcinqrG8Ye9SiJ2k8WiYS3xkYQIpvpMXunqArjv5O3SZvVKMT2Cp4sK4QaI4CE0PrQ
         0F9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787648706; x=1788253506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXP5ICtDHoTENRbX0dZZlEib6eWsD00QduAdB9iB3C0=;
        b=SDeKDZNJ/XG/wDTa3d0c8xHTCZQhlpTh1PSDsUksT6H97JidyKmu/qHzKf5QXRqB6D
         PhWQfXUF8G7zaeXE7xaDn8hrjTbBoAagJSttYwK6L771oKBflVh/F25Py0kH1V97wWbt
         90lDQakKyGiwqFTz2JJnNUZIt1OcE3Zw33s4UimnjrsVNKKhEqbOtKxJu0/f6b9D0JC/
         3xEYdN38sW3g8e7cPZgvxDDG108HfNICzg9r5S3WQGG2A9t+j79zQUZh11MWceKM7sgJ
         0cVTTdhqshlJMINmmDPZxSCF/kruTedhhYuUI8IRjJq0qgi11MWeGPYi2WVB0fSv2EN1
         kW6w==
X-Forwarded-Encrypted: i=1; AHgh+RrBhbpTPRTskz5CWbBz9yt3x5hg1obPv/SQVGId9jFvJzmeUClku3oGHmn3jMOw9fOf9g1Tm9jv38w=@vger.kernel.org
X-Gm-Message-State: AFuF++nzQBDXJr9QuIeqna4N4QO65X2OTZTluXE3HQ8nfgjFi5XpbNzw
	f37+hvXQO3wS5/kQWR8eU3rJWAa6pS6LHbKqdbQl27VbelJO0c4W1F8huwt0vwsM66zEdJKc7YH
	XQflC6ZsBOLDb/79l5PzT8SYwdaSQPCo/QXDxPRqN
X-Gm-Gg: AR+sD124EbwYIuCVUmGBVHPBoRBe5lLzRk6VG1m9N79OK7Vehq5VMWJDC5ldIM8Lg3I
	YHtUYI9kJb16OgwUIpy9PhWbv8F6NDboITy5PSsqO98Rit4pB/6TPAtQOnFlIXIkXnGlPzNZJzv
	4dO/UNohE8L6yXJG8ozTy0IBR3UkBbyPqqBpz9DPwjofh9sRhPk8uZ+GmplvJLiqPRl+Ce8vewa
	JqOPs9c6uXGOPhp+Fd9JCbwNiyLesHF4nJG1PwIcOysilHfKCXqLeu9W1UNYGaFtWJTIkpLtlsw
	y1eOzPIcFEneqPgmYkQZ+CW5bD73bgNxF1+6oGgZnhRtgFLyB6ZnzxayvbQ1iV0HkvQUejHgjQr
	6fPiBnX25OQoiOhMWvjWqDXJ7vGRdZmfnL8IOUuVsfhlOjxbI1RxoNUTthuYMs2w1DB4/rBps3+
	ux2cwzl0bYyllarZ8CAbgjaKA=
X-Received: by 2002:a05:6820:1c98:b0:6b1:409f:3824 with SMTP id
 006d021491bc7-6b1990acf23mr556931eaf.14.1787648705846; Tue, 25 Aug 2026
 02:05:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a88012e.dbb3a75c.13dd47.0007.GAE@google.com> <6a8d0f6c.dbb3a75c.7844.001d.GAE@google.com>
 <2026082540-tarantula-gigantic-b786@gregkh>
In-Reply-To: <2026082540-tarantula-gigantic-b786@gregkh>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 25 Aug 2026 11:04:54 +0200
X-Gm-Features: AcwNN1WmaoJsOSdeJp-RaXzMW2D833rZFMXrhzKAoqWgErgpY0dkISiynVPJotI
Message-ID: <CANp29Y5YH=O35brw55HFo_hVmFDz5Y4Yw7buBc-rOjETU2DNjg@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in wcove_typec_probe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com>, 
	heikki.krogerus@linux.intel.com, jeffinphilip14@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mika.westerberg@linux.intel.com, stable@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, Aug 25, 2026 at 7:12=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Aug 24, 2026 at 08:43:40PM -0700, syzbot wrote:
> > syzbot has found a reproducer for the following issue on:
> >
> > HEAD commit:    66498c75b4f8 Merge tag 'dmaengine-7.3-rc1' of git://git=
.ke..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D1253719e580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D3e64b1bf01d=
830ed
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D1a01783ea2333=
50598b5
> > compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for=
 Debian) 2.44
> > userspace arch: i386
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D174919795=
80000
> >
> > Downloadable assets:
> > disk image (non-bootable): https://storage.googleapis.com/syzbot-assets=
/d900f083ada3/non_bootable_disk-66498c75.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/5ce4685e13ba/vmli=
nux-66498c75.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/6a32d8e997a7=
/bzImage-66498c75.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com
> >
> > Oops: general protection fault, probably for non-canonical address 0xdf=
fffc0000000001: 0000 [#1] SMP KASAN NOPTI
> > KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
> > CPU: 0 UID: 0 PID: 5912 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT=
(full)
> > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-=
1.16.3-2 04/01/2014
> > RIP: 0010:wcove_typec_probe+0xdb/0x780 drivers/usb/typec/tcpm/wcove.c:6=
21
> > Code: 48 c1 ea 03 80 3c 02 00 0f 85 af 05 00 00 48 8d 7d 08 4d 89 af 88=
 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 =
0f 85 7f 05 00 00 49 8d bf 90 00 00 00 48 8b 6d 08 48
> > RSP: 0018:ffffc90002f6faf8 EFLAGS: 00010202
> > RAX: dffffc0000000000 RBX: ffff8880226c1000 RCX: 0000000000000000
> > RDX: 0000000000000001 RSI: 0000000000000001 RDI: 0000000000000008
> > RBP: 0000000000000000 R08: 0000000000000004 R09: 0000000000000000
> > R10: ffff888014243883 R11: 000000000000001f R12: ffffffff904a7ea8
> > R13: ffff8880226c1010 R14: ffff8880142438c0 R15: ffff888014243838
> > FS:  0000000000000000(0000) GS:ffff888096982000(0063) knlGS:00000000f67=
e5b40
> > CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> > CR2: 0000000032e24008 CR3: 000000004e2f1000 CR4: 0000000000352ef0
> > Call Trace:
> >  <TASK>
> >  platform_probe+0x106/0x1d0 drivers/base/platform.c:1507
> >  call_driver_probe drivers/base/dd.c:628 [inline]
> >  really_probe+0x241/0xa60 drivers/base/dd.c:706
> >  __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
> >  device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
> >  bind_store+0xf4/0x190 drivers/base/bus.c:267
>
> Please do not think that this is a valid path for syzbot to be
> fuzzing...
>

Can you please elaborate on this?
Do you mean driver binding sysfs interface in general or something
more specific?

--=20
Aleksandr
