Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B835674F
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 07:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785741445; cv=none; b=BY4KnjZV2QbRr4Wd2GdTnp7PiEwnkJeQf/nTxBI7rD2OJzw7Zc+QqEvnebsSHKgPSstAJNYSR9DN/m3FDivgLy6dZ8Ihpkd+JAsA0/bBy1o7YFNE/0qYgbBPTQ4IQ3M45rgHwvVJaPMWWoXpTJN2V0BboZZUxAXx92jsmKCaJEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785741445; c=relaxed/simple;
	bh=U+5e91uQmJMhSeEJDMN1Jap5tDni7smE/OojSiTdnpw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zij1v76P0x8tQLqOQakt29HmZYHuCSJvAjtGyogdi5FBPVjdRI8+uE0IeaPC643mLtYWCw3FZpS/9rnihV+7dlvHCv1p8KzxN9LdsrRqXHfRTiIaoAuVtHk0phaIzBEABD76Gl6KohMcQGVH+atKfWrgbx50JqMmy239Q+cF2Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0h4DH0F; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0h4DH0F"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4957eefd361so11590805e9.1
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785741442; x=1786346242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q+2A2Z7IoojlaYkRkYfkrCKzpU+eyj3RUWUUDSzJuJ0=;
        b=l0h4DH0FUgsfCeBr8twNzc6fO7x35l20RvXusShGJwYuVasTvvsCu6G4wRtH9s2406
         HLLAR9Us/55HzrAm3JvK98MexymY0c1wC2VX6ER1DwADcUVpVKDmI5TuLQyZ55sK/Vsz
         outEWyF+mlYW6yejFN77y+N66iEX1ei0PWymLj68SpYbJrQP3L5MYOIG9cWvdCCY+1zp
         GDoN3qe4Bs9iiI0JS57s68wXBSALEAz5HcUCAAP1CC+TOmESYZVuLjKcnOZgU52XelVN
         nZMYhMTO6eVqNf/zpAYt2YYisoa5UBRGTRsu17DpGLUyP8WdrF721xtEud2uv56rZUMt
         mHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741442; x=1786346242;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+2A2Z7IoojlaYkRkYfkrCKzpU+eyj3RUWUUDSzJuJ0=;
        b=hCCwa+TaI5a4GkK6iX8W0emmiHMJkNsxo+T9A0QmalYPoqPE0IAQ0y+mOszyu5UKCY
         sARrMD7AbPBdBAM87mt0+0tyQJc0BVNTjET9mH+E5HFGP290vFEUODPm5gpAaLnCXjEf
         Mn/5MaNrKzNJvqouIFTvU7OmcNGCpTMP4XJKrdDq5XYPfnXVY18lZS/cZmKsNdKbpHmh
         gapqmckp3ib/4Cey22x4xdXL9rES5MnuP5NvyCXnU+l/igJQQoECm9Fg3y0FGNOsFTod
         XJgL8gvtlaSzN9ESR99LDPJY2ozrGG5JKafPMMTe1o1ox2DlO9/fNM3mbElCmv7B9aTm
         FT4Q==
X-Gm-Message-State: AOJu0Yz8475MG98VnOxg0nYjuD7KgqHQFl/tnMCKtK0UkPT85I8xnbr3
	opxiGiW3umOpYzio0IBSlTJ3xPcov/BZm71aXWfKcxny7vn5C/kraX4G
X-Gm-Gg: AR+sD10OjMHWZaU6bvkwz+dg/9QvIU4AVIiSGsKl/f/e4mM2ZjSmaVX9pyQSmUREgy8
	sYEbkGeK5LU5PqJO1hJ03LA2Qi7+Pi/6PaS7LfRkH4cbEG8IeCeKXZeAQVNt9+mc4E36AWjV2SS
	hjEVdqNZw1t0xQ//RYYgmqIPsynyV35dv6JK5RsHux7HY4q2kWvcsSTRMqqN7O5U7j4Nc74gBxi
	YCYH6jI3Hm3hsXCRoHo9+Fa0Pd1BRwiUbTA2e3JcxyBktSKWib5YtshBGUt4dNszgx0SwDANoQV
	4wprv+DYd4Yrh/I1qtxj3q73KIB3XJ+WdskYYpcyodM+8en1CToBjJAZpv8VwAQbhH5sQslopv3
	7dY3gNMwcezqrFIRApFC2NtDWOLVihaEaFlKKjcqTJ8bT9d1PC9ce3vlKX746ZwIDxkNlTWnGDi
	QvWm/QGdrNV9Zi9PjTa5nTBUzJeDXdZ7DZe0+Ef0fAUEQSoNQ63FlvJ8bzILzYIbVW9k20nVgNG
	rYQ9yTGwAOLG4q5VNZr0FXy+bQYJr2QEcd1G3oNztmSzc9IWid5mBo+bh1dNt6fIz+YmWRMuALw
	5lm5BKbX1mVyvgBY/FdTb1m8DFeElrPuAKG4qFLsljA2QH6DD1lIqs6/4eDe2YR8vmeauDmuodD
	O3ijbdk+rEpfhj3cr+oD6/PP/VGYo2jPZNMr+zyA1Xmj8DN9s1QfYis7bIKQ0fvxhSZKBHYze6G
	EFX0rS1g==
X-Received: by 2002:a05:600c:46ce:b0:498:ee7:e403 with SMTP id 5b1f17b1804b1-4980ee7e7dfmr149263745e9.19.1785741442335;
        Mon, 03 Aug 2026 00:17:22 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808691014sm208280535e9.11.2026.08.03.00.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:17:22 -0700 (PDT)
Date: Mon, 3 Aug 2026 09:17:20 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 syzbot+eaa106d192c9daf37f95@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: midi2: remove default configfs groups on
 teardown
Message-ID: <20260803091720.00006bf8@gmail.com>
In-Reply-To: <2026080342-theorize-everybody-9f2c@gregkh>
References: <20260730135811.1498-1-joshua.crofts1@gmail.com>
	<CALoEA-yuzdD9=gBy0s0VFc2yD5Kwga57LjECUWTTXdF2SHed8g@mail.gmail.com>
	<2026080342-theorize-everybody-9f2c@gregkh>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Aug 2026 08:25:35 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Mon, Aug 03, 2026 at 07:59:17AM +0200, Joshua Crofts wrote:
> > On Thu, 30 Jul 2026 at 15:58, Joshua Crofts <joshua.crofts1@gmail.com> wrote:  
> > >
> > > f_midi2_alloc_inst() creates default configfs child groups for the
> > > default endpoint and default block using configfs_add_default_group(),
> > > setting their internal refcount to 1.
> > >
> > > However, during function teardown in f_midi2_free_inst() or EP cleanup
> > > in f_midi2_ep_opts_release(), configfs_remove_default_groups() is
> > > never called, therefore never dropping the refcount and leaking struct
> > > f_midi2_ep_opts and f_midi2_block_opts.
> > >
> > > Add the missing configfs_remove_default_groups() in the afformentioned
> > > functions to free the structs properly.
> > >
> > > Fixes: 8b645922b223 ("usb: gadget: Add support for USB MIDI 2.0 function driver")
> > > Cc: <stable@vger.kernel.org>
> > > Reported-by: syzbot+eaa106d192c9daf37f95@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=eaa106d192c9daf37f95
> > > Tested-by: syzbot+eaa106d192c9daf37f95@syzkaller.appspotmail.com
> > > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> > > ---
> > > Aside from testing the fix locally with QEMU and the reproducer,
> > > syzbot also reports no issues after running `syz test`.
> > > ---  
> > 
> > Hi Greg,
> > 
> > Gentle ping on this patch.  
> 
> It's been 2 "business days" since you sent this.  What's the rush?  If
> you wish to see patches reviewed faster, please help out in reviewing
> other patches on the list.
> 
> And as this is really only a syzbot issue, the "severity" is low, right?
> 
> thanks,
> 
> greg k-h

Apologies, I let my impatience get the better of me :( won't happen again.

-- 
Kind regards,
Joshua Crofts
