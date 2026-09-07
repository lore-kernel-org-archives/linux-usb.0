Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A6F3FCB2F
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767993; cv=pass; b=Tev6iZjtJTPGT0/hl12zaMWql7bT51+pGpCYuoyroRyZi0FpvdQYCFqLHEY4jH6XYGeRcKteY0n8ap8SJCc7o0v8gZzIQbxi4ObXBmTBXzHGQuq8Ct5P4dp0Cy+8cv5OjS2CvH6mI9GjXA2mmzjBB5UwWmqsqgrXmF5jwMCEEj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767993; c=relaxed/simple;
	bh=XGt31Wr9yjCa78+DVzWTnKmcJywlyt/ZVR2TBznQWZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLgz4073vgAlAPTY8gH2xWGvN6dBK99iUSI/4fe9rT8xb6lCsAEzsCPq5xvi7ck3DNXutH2w/UpARz0IcSmC8nULFIjFKzjM6u2T8eKZ3kZylJLkcG87qAA6Vex1C3SMtMSodir3U65WcU1LS4QH5Dc40/9oNO4AHFbAFByzyFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dzeGL8/7; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dzeGL8/7"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b1b1cb72d0so1387381eaf.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 00:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788767989; cv=none;
        d=google.com; s=arc-20260327;
        b=E9SPzaKNi2pg5yXQoTaN76GHvFTJp9FrYueX++9Ib9boLgo+gK1gYTBs3U4FH/vRam
         kCFlIPHEqqLDASshfsdYyvavcK/MuGQRcbz4MlKhKSHuGWs9T6GMN9JV7At8zvNDi9pX
         LYXiL6jhbGGv1pDC0lkKBz6Apz3Jx09aXOT3PpMIRTrRlp1RjnQ69s6TPoM+zJENT4D9
         RVjMwFxK7cXYhKO/GuvvmGrBy06c1wIpx9BtlAUkJRwDYthfk2poQMnbnyoH+0hhuloX
         UO2sKk9atCidTD0cAnz75eRtfa8mcigC8qEb2O/5AeUvJfj6luaJGnwnsxAsl0vSSvKh
         q7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MNuI2GTRgryGPJlrFCbXB+B9YExaFf4SjHUxQPbJ59g=;
        fh=1+r3phyozDW3yYC0486thPavMISTMlVCA3luEKNjCNY=;
        b=gN1YK+ErnNFE6nGkSAQlmfYXs1K/bMlIXo60gSrDuC6xVLnOzxub1XFcWY3ss/KbKG
         +mYOAp7GAbqwQY8U/LqLudAyqbfPh2SgxBgw6vRT4BQHys+TVU6Gj3+VJyw0Yx1kZIJ2
         P0htGMFYludbLntEQ/p2P+wprIFu5AsfQ95F6Gp52vXK/xuRY2qVCPjLOWqT5FASBvBt
         bS7aouhpeRI/2wo4Sw291pqblQHS2J0v70FB2hUZMaE5tUTmhOYDcMv+bQz8xg453ArY
         cK/txWdwMSuH7DYgbSJK5gXDQt6i3a/wjEZDesT8HLzehnhOhGgcTdjqP+ZyidqDMaYy
         MQsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788767989; x=1789372789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MNuI2GTRgryGPJlrFCbXB+B9YExaFf4SjHUxQPbJ59g=;
        b=dzeGL8/7uPV2smb5XcebF4vgpYfrNbGHToMdBjS3bwS0TG6kFF/stnVtXZ0oGTZR8y
         zcrJC1drNYLm6rt+Pu66pMmyPVqZxKIVNcEU+X3HunK7U1Xs9H97FIIXdrKjI67ek+s5
         AiCEElMPIF+09GdNdhdeJqda3YZMVo/jr9QtVhEaj4RM99an3lAmYS5eldLSUD9OPExT
         2bmVD70kQFmT1/6V29aI8hL4UflLrWU8dMc4LTirVJqWhg6HCZ0tkpK2t5iEpTqArfRp
         85RCgYO6VQ3l1/Rx7AXfqnulvGOkix2pPDQVx2mcitJutccgalDBku1mxFJFYqMhCzZ1
         mWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767989; x=1789372789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MNuI2GTRgryGPJlrFCbXB+B9YExaFf4SjHUxQPbJ59g=;
        b=II+DEXbpkTC0i77NkizO7d2mkJK47WNgO8ETwN5GMjlJB303KrnbuLD2WgMMbF2ae4
         BReddAbw+Oja6JpLOK05YtMeywonzfdMopHZdpExq6LAamjoni4jy23KeHtLp2wkUZuu
         JPPTQpVTgYreqWypZYTTs2JfN8VGe+hnTJVUpxbcWmv4XTenlH1mJCq072S+qI62QCBn
         nOBLsqqHKDu6wtkikQipD9wFDdn3uXFLTpSe2hdG3DlXNLixevREsIsKvd6an5WBJ+32
         xJI3n0RPuKXvhGEfbTXvf7BW+Q80lKDf9Q7lYk6SNeUHW14UrncSY80Idn+bKcH7abWp
         BgLA==
X-Forwarded-Encrypted: i=1; AKwUvBzaioMFXyY4/UI5S1poszohCgR2z4nY9E2KVs5RY40psOkJJJuH+mvrfa7/0dGicV3+VusbDV5a8YE=@vger.kernel.org
X-Gm-Message-State: AFuF++n2mNNXN0MyByk/FeNOky2gyamcxYsmgI4NJ3WEeqSGSO2hkIKl
	gdHfbS2JvW4JxYCybnk9ezj9HyJSIzdYpN9/EhRYt/fjVE2ldj4L9uThHk2XQiILz4Tcuv/8SeW
	2fgj9gLkHmorBpsv9gUpJtv+NDC06B5fMgiyKnSzs
X-Gm-Gg: AYBFou3MswLZCVr6GDn37kGZoeZv2fOMvzPi4OqHeyOrjk8g9uiY1po/efjNn4+RWdE
	HDEHSeVfuRIB5Mx/zgBk4dj7sHL+FXTsOIJF8xeTW4KxqowyroLWYhZkfg2posigEIvz8I67owG
	NlMHS9UA46B7fSLIhacmPXG0ODlBCzDnRCHRTpSTDnjBQGXMh1QYarPifg2LGXD4JmNrpJtzGn2
	w0NtrdgKQlMpy7+Cxe7R6AgfPkmk7KveovS/bpQKqxXKwBK7NOo/jkySx+BULosQZ8V9enN7vIo
	/FjDzfzu37UyznLeQEvkMerodnYgAUZgJgblS+z/EtCGr8BIcLsykdmKXZNvbEF9G1cv9FgwBCd
	5xr97NWrMugDWLDT8lRFS7CqKwzqZeN8bXKxVRT6K6LFsfdnAVTx+KAjUQ+K779OrYuC9qIUYDQ
	j3C8FUmJx7sXsAbg==
X-Received: by 2002:a05:6820:2912:b0:6b7:46e9:9702 with SMTP id
 006d021491bc7-6b746e9a327mr11595563eaf.50.1788767987452; Mon, 07 Sep 2026
 00:59:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a88066b.ae6ddae5.3da009.002d.GAE@google.com> <6a9bceeb.a5e650b3.26d8a.0008.GAE@google.com>
 <20260905104331.6d4288df.michal.pecio@gmail.com> <2026090536-numbness-enlisted-917e@gregkh>
 <20260906123835.56902ed7.michal.pecio@gmail.com>
In-Reply-To: <20260906123835.56902ed7.michal.pecio@gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 7 Sep 2026 09:59:36 +0200
X-Gm-Features: AcwNN1URJq33DPZJB_nkWiVtSKSUZBfD7yAMo8bMmQpNnyIBte8yVFjfPDnbhds
Message-ID: <CANp29Y4VaiT=oj5mkbf00hq6ogDs7zHZb1_9SC6qTQL7_UPfZw@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in vhci_hcd_probe
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com>, i@zenithal.me, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, shuah@kernel.org, 
	syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:38=E2=80=AFPM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Sat, 5 Sep 2026 13:30:01 +0200, Greg KH wrote:
> > On Sat, Sep 05, 2026 at 10:43:31AM +0200, Michal Pecio wrote:
> > > On Sat, 05 Sep 2026 01:12:27 -0700, syzbot wrote:
> > > > syzbot has found a reproducer for the following issue on:
> > > >
> > > > HEAD commit:    9d80aa4617b3 Add linux-next specific files for 2026=
0903
> > > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/=
linux-next.git
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D10adf4f=
9580000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dbb4a32c=
282cc2ec7
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=3D7300affe3=
88249d66dfe
> > > > compiler:       Debian clang version 22.1.8 (++20260613092233+e80be=
da6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D121c721=
5580000
> > >
> > > Who or what is coming up with these ideas and even commenting it?
> > >
> > >     // Iterate platform devices
> > >     dir =3D opendir("/sys/bus/platform/devices/");
> > >
> > >     while ((ent =3D readdir(dir)) !=3D NULL) {
> > >
> > >         // Set driver override
> > >         snprintf(path, sizeof(path), "/sys/bus/platform/devices/%s/dr=
iver_override", ent->d_name);
> > >         fd =3D open(path, O_WRONLY);
> > >
> > >         // Bind to vhci_hcd
> > >         fd =3D open("/sys/bus/platform/drivers/vhci_hcd/bind", O_WRON=
LY);
> >
> > That will taint the kernel in newer releases, and syzbot has already
> > been told not to do this, it's not "valid" at all.
>
> What cought my attention is that Google apparently has some capability
> (human, machine or otherwise) to understand how this repro works, and
> yet they keep reporting this broken pattern.

As Greg pointed out, we've adjusted the fuzzer to stop using this
kernel interface, so there should be no new bugs of this type.
However, we haven't yet invalidated all such reported bugs, so some
notifications like this one may still leak. I'll look into
mass-invalidation of them all, but in the meanwhile let's close this
particular one:

#syz invalid

--=20
Aleksandr

>
> It's just waste of time, including syzbot's own time.
>
> Hence syzkaller@googlegroups.com in Cc, wonder if there is any truth in
>
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> Regards,
> Michal
>
