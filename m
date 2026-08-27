Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA223E0230
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821748; cv=pass; b=D8E0hucwDpz9uW0z4EdMLx+WKglOx3EW1DHeqeBmfcnHY1ksSCHgsR3LOOZxhgaH5obsbD8k/dg/YMpnQ0FnhVQpGgjpEFwOOorxriGBw7Zja7OABb8af9TRQYpT/ijrI9MIxf7TD7YvUttu4TlWmX/Yx5eeORQB0/oSSK3huhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821748; c=relaxed/simple;
	bh=8ScfO32hrCuPJaHEfel7EXpblrq+8LxT0vfmYHwZKY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwcAFkK/aToQygDF/Y/iXjny0EBxjKWRK9uuEoUeC42uN4ct9mCK8NYvgNBTBrsyLoATMeofC7LE6AJlmiE7EzyHWPr4yhjvnjIXNTR3rvybjYO/jNqAUQL922H3MhKdzBzq1ScQ0ts/qejRCqBAxBojXFJb8lh+P74ElTimaOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PoBDJbve; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PoBDJbve"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-44cedfaab6bso1206580fac.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 02:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787821745; cv=none;
        d=google.com; s=arc-20260327;
        b=kKlISMzg+VUBsat3mQTOT8Rd8ElkPb7ZwXf6URzCSZDTOrfo79mSHxWlj7DykZFbxX
         OyMDJVU0COGoEYm28kbalUuDs7dT2C7jn/ITcWDrM/Bo4jkBW3Xk5P7xHHUWrT7Ka92x
         RHfbmO/CCK4ZXWwiEP17Vq9XDpB/UhHkbRC8D6EC7n3YM3OHu6YO/eQHQXknPFBiiAxO
         cVHgal/KqaF8xAfQcIh0kMGyX0L3w7XwdK8mGxq6QuLkmAb3iWVR6F9vLRsFyck2oLRb
         kPyOm+fShVqhi8qb+T7Vfm1fGJOWu6yItOvnaYhEqe+P3aanruGJcpFguOaGOViC++UH
         w7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RJk8AOF1uYTdFAZc5WqubZUc5UyWwi9WNtT23V9H294=;
        fh=qHl/8nAycSssIOUBVNDJchf/oAsoLui5vbccg4MprDE=;
        b=YHJ0SP1piIFe4nmajfMGuqRPbureP46CXz3aeQmk9zUx7n+r0WFnqADHvr3hXIdGEE
         Oooqu42OZ5pfoC9JMBGXTQ5yYuQ3bhzxtj8gT/46/0lKqiEPxJ75zlfYDiLbgTKHiFyz
         fyHBs4Oko+BRofyYNv+/ycBKZG4TcDMArb1HbZ11GGx8d8GMMG/EcfKQ7iiEK26z6Ovu
         B2YwLDVc6gW0FpjYO/w3ZE8OYrQh2TgLPzuNQjoYUp201VdjWDFnPixFWj0YiOvY+V4f
         TPDqdbukfaqyUGEymzeJXZSz/mWzK1dLEbOwlmON9dhj7/kHML1qRPDX65lAGAHX1bxB
         hOAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787821745; x=1788426545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJk8AOF1uYTdFAZc5WqubZUc5UyWwi9WNtT23V9H294=;
        b=PoBDJbveNkAh+F3fp2rCiHIPZzcpBzC9ECmA58vdy16Gny3Rzo4c3LVsym8MA13jQV
         hRQ5SdhdAOw/q7u/Q1XNTZkwvye3OxsPrlA3xMt6oSKXJyxCVRDjXZKBRi0gn6gD67gS
         lbDHruGQQe1TuA5w2UFSRkQPTCqXWhGwD5Vco38hlI9VS8Rlaj0xTqF+9ekOQbdiN/qs
         BnqKZxsOa4dp9tOJ+NS9ncghxxLKMk6z5ebEiGLVPrH55VBsaV5/dwvrOT+D8LF72cus
         IR4Sp4KBreiFPd8bEHldz0lhCuE2xdioMRV6LuQoFskgtfuPOiLX41QVhS7eBqZbEwmQ
         c5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821745; x=1788426545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJk8AOF1uYTdFAZc5WqubZUc5UyWwi9WNtT23V9H294=;
        b=KL4vxYEEwdVqgm0MrXfxjVtOa1+jr7V/5lv+7xasDZzuqVt5fH1/Kuz5XmyJFfcrWA
         WQKCaMMHhwTjMsXvK2WWHt/KjeF1ee9DulKKVMcxQQ7797URa8taFb8MHDN2BtrpdiY6
         tl8FrE5sKIMsaToeeFtKQkJmkZNzZZMaBVRTWsa3KB88Ipfxt4NpfECmviIjnmkzIZCK
         IkJiRu3nUX3U7kxsUVm00g2p+FVKn3UoL4F9w6Livk7IgRlG5WMX0rPhctejRxHJxNLR
         DBlAUlXi3RNtPMd1vozcSCPZznQZVruChz+yZE9+ELYdzeEIvqSMVmOjx4+yI+e9FdTK
         EGWg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9vSOgUDBp/QljxDlI7H/6yGVtOl4pKYigCtyysGJWpuIjOGzB8Q90mFQs7XAVPGpc38a6nhmt2P8=@vger.kernel.org
X-Gm-Message-State: AFuF++latWbNgQHYCGG4OSa/QXDNi2f5IyQXlXa0gIflae/ZOyXiNlD7
	m6vhKrgVU9Fjtu3n7oOiVwXB9nDpg3l4cZqcxHKmCKEPcf45NbZhxrqc8xnOO7rmCDLqGAQEtrb
	SaQ/0LCehpzye9EIF+Mh7G8E7SMVGVMAqrUDC0O9O
X-Gm-Gg: AR+sD104o1FeUDLmK1rm1VrpkjEVM0rKTbjei86CgKLoWNlF2//q2B5R2/6xGPGitDU
	q8cghB1CmBd/urBMDHQKPShR3ppyf4la0EVszcRyjrMIZc5MGJMQQRE/yoHIYaiq/3LflgARL1D
	Lxi/w2Dme77P+/V1SV4YUDK9pB1mKe1uIoQnp5afsdIoEvLJL01Cd/OUdQAdN6mNN1QIQ7V2TAX
	YiAJ25wV2gHBAwJYRY8hb0aKKzQ1dJWWCCcVeOMK1VNLEiOcAmp9PVTjyV9LEbz1rGn+BXYwhJX
	u6HwoTRvfsv9+p6MEmBiDLYpLJRhuIzl70MUSKI5LPu7a9ztXO8V25XJKwrkZM2Mv4lW0wsK/1L
	RZd2tcN1wGUG0SOWH6R7sNrJ/+yIEFLH8wP0zSqD5owO+zpj+buvJFxYVOCXYgK43iM1kd+xhIF
	Y3yVOaSBqcfLZmHA==
X-Received: by 2002:a05:6808:3305:b0:495:feaa:9e3b with SMTP id
 5614622812f47-4b36691bebdmr14734837b6e.7.1787821744779; Thu, 27 Aug 2026
 02:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a88012e.dbb3a75c.13dd47.0007.GAE@google.com> <6a8d0f6c.dbb3a75c.7844.001d.GAE@google.com>
 <2026082540-tarantula-gigantic-b786@gregkh> <CANp29Y5YH=O35brw55HFo_hVmFDz5Y4Yw7buBc-rOjETU2DNjg@mail.gmail.com>
 <2026082507-ecosystem-giant-0b79@gregkh> <CANp29Y5hnOWaqGw8BbPu1TCr00TbvNRciYvs_VCd6Jtk=8kSPg@mail.gmail.com>
 <2026082602-compile-bogged-877d@gregkh> <CANp29Y486UwGwRJpqzQ4aU2eN4Xu3A+zw_zDUJuFR5hKQ+Knrw@mail.gmail.com>
 <2026082637-grimace-rebirth-6239@gregkh>
In-Reply-To: <2026082637-grimace-rebirth-6239@gregkh>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 27 Aug 2026 11:08:50 +0200
X-Gm-Features: AcwNN1UnK2acP0iRolYNvxKjKdPD1tCSgUflGMpAAN5EmHBwPZjO5KMQCfjsHXE
Message-ID: <CANp29Y6Q-SmBXEUtHQqg8qdsG4fUSiN8_LfOO15Af6OgQ-sx+g@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in wcove_typec_probe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com>, 
	heikki.krogerus@linux.intel.com, jeffinphilip14@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mika.westerberg@linux.intel.com, stable@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 5:23=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Aug 26, 2026 at 04:32:28PM +0200, Aleksandr Nogikh wrote:
> > On Wed, Aug 26, 2026 at 4:11=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Wed, Aug 26, 2026 at 03:26:23PM +0200, Aleksandr Nogikh wrote:
< ... >
> > > >
> > > > Thanks for clarifying!
> > > >
> > > > Some context from the syzkaller side:
> > > > Restricting the fuzzer is always tricky, especially when the
> > > > problematic operation is just opening a file and writing to it.
> > > >
> > > > We normally constrain openat to:
> > > > 1) An allowlist of safe absolute paths (so it won't open /dev/mem,
> > > > etc.), blocking any other path starting with '/'.
> > > > 2) Relative paths under CWD (so we can still fuzz normal file opera=
tions).
> > > >
> > > > Here the problem is that one can mount sysfs under CWD, which leave=
s
> > > > syzkaller full access to everything inside it.
> > > >
> > > > Tightening the access to /bind, /unbind, /driver_override sounds
> > > > reasonable, but trying to catch all workarounds purely in userspace
> > > > (e.g., creating symlinks to these paths before opening them) will
> > > > easily turn into a whack-a-mole.
> > > >
> > > > Would you be open to adding some kernel config option or a boot
> > > > parameter to disable manual sysfs driver bind/unbind and
> > > > driver_override? We had a similar problem with writing to a block
> > > > device while a filesystem was being mounted, which was perfectly
> > > > solved by CONFIG_BLK_DEV_WRITE_MOUNTED.
> > >
> > > I've submitted a patch to taint the kernel if these files are written
> > > to, so that should "catch" syzbot and let you know to ignore these
> > > reports if it runs into them:
> > >         https://lore.kernel.org/r/20260826-bind_taint-v1-0-52b05f4a96=
5c@linuxfoundation.org
> > >
> > > Is that sufficient?
> >
> > Hmm, if we set `panic_on_taint=3D` with TAINT_FORCED_BIND and ignore
> > such crashes, I think it could work, yes.
>
> Great, thanks for confirming.  I'll add that to the changelog just to
> highlight how this can be used.

Thanks!

FYI, I've just merged a mitigation into syzkaller:
https://github.com/google/syzkaller/commit/c53a1b9ca227. It should
prevent syzkaller from touching /bind, /unbind, etc., at least until
it finds a workaround.

Some more such bug reports are already in the reporting pipeline and
may still reach LKML, but new ones should stop appearing.

--=20
Aleksandr

>
> greg k-h
