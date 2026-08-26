Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBE02D94BA
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 14:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787754764; cv=pass; b=jAn1m8k5slh8PJZKhmi2tdVgrQyez9K1rUMi9IInYx+z1my4fwvsyQRRVfWbEYEjW8TluNFd/4eraYYROF8BOAbFv1/t+KkkTrUGQ2i5vg/A2dW2A8iBkDA86EEVNdnmPZ/lRXs72x6kRdmk9pB5urmfJXkbARbJtCknpANyM0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787754764; c=relaxed/simple;
	bh=uGuMG/KM6SBJAW6r5VuXsRS227UH4wUcYvkOdg0cQyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMWV0bW1fWyDEHEGwqg/bV2V2TWepV6SWYT5mbJMQ36umxZ+9RPJZCvIokTX2QtF3/3fJBbpLOEA7XqbmxfPpYkVlXO0F6ilH0WGWgHlrJxYhLRRm6twWQkk/DEIPN+nIlKsmSdLIwerzGyknGD5GaovQWOi6MrtOGzqKtm8OL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ClTpXhXM; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ClTpXhXM"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7ee125ec926so842809a34.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 07:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787754761; cv=none;
        d=google.com; s=arc-20260327;
        b=SnYDhVrdIeRb4bL7rV0VbRuJJqQdRmSZbFdswJQCFb1fwOp4RIGHdQfKu7vwKoq5Y0
         l/AKdDQNCkFtgrHmsInAVjzzpERbLiXpWpMvwYiZ75vdivbwQN6sgQAdWv/G/vZeLGbQ
         AMBJMt5blc0BQo6HqELpht0xaYhfpomMOq9oSxKz0ELcaQICvoeMUtervIrttbVBGlC1
         RmAJkXELKLt9iJhskb8VfT9qLotMkG0S/Euz46+C4oPVhHJtY630GNyvM1+QPDxE3iEL
         /zy9WZSOxjBFueIB+9yiSOzp5F4BN82hxh21wop0h9r+alwrT62omZ5cIlQfNetrCXE9
         A4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x1g4ctzEFpC9hS1eVfp5ZBV87NdsbdBID9p8ekLhrAY=;
        fh=1nbeasQpRoQKolh+T9PTe/6iXyXREl3zMMpiB7BKdWA=;
        b=IPvjIDtp+dO2rJF/4lGGSM+cQXkZD3Tk9a99u/XbPE09L1/vYox8gps32euGRZUMLz
         XTIPwTa9BZMdeMuvHwlrK7EOfbT644EYJiaub4wTMyo7FfuW+7I+M35PnyCOnyUSyX1l
         ZLNkJVh2SEVvMGmMGVxchmLtb0CT5Wnj9BWZzSg03zd6nb/tndFK2ALNR8MPXEdlitjF
         GvIXesowYezoDMFYF17j/DnffCIsrzRv1kx/bhOL+P7puTSMfvDBzFortXRCSUMpI+rX
         CSxDPhEJ0jf7hAth70M6DRZhG9uge7SPmHt9comZhI8uJSFl0CkGRnn63ZmAB6ApfBga
         kdmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787754761; x=1788359561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1g4ctzEFpC9hS1eVfp5ZBV87NdsbdBID9p8ekLhrAY=;
        b=ClTpXhXM+uOrobfj90WP2yjdefO3X9gIPragRCzKJ+oH6FqsevrVBFi+MOMrJnT5xR
         ZGfvCqxA4/CSyQ578oeOsuVHUuj2uj+GZdCN2PnY0Ttm84UR16EbiWH4/rPyYZTvDKWh
         YStRL3BQ2poPflKdnZ9NDEaslV78sLIqZ5k+hp68RuIFRxvFOrGDPyo07YICfSkrXSwZ
         fIetlBBshd5qSn+e2owXUooXTpT6MBlyESB5PYbWr19NaYst/ItjsEUNrggbL9AqnjPw
         ZIL6biAo7riFR/h9yHd40N64JpcfDDtTWa47joW6SkHC/kyWCOHFPFRauovvQnuoQBxy
         shyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787754761; x=1788359561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1g4ctzEFpC9hS1eVfp5ZBV87NdsbdBID9p8ekLhrAY=;
        b=CRZdiUp6gCfBy9LlEW3H9Pt1cUlPMHeXo9UU2iYPmE5Om0Xkr+6Iagej00q6pg0NGK
         cGnz5XoA9w/FowoNx9+r0kwvc8jrtGq3Rv83NFCOHvhXlq+AGJBeKUi6td+uoQWqDO12
         9p99l6qx3Vg/4eqNqi+ncjbS3bfH7L3zgUAnDMIHBa07L4IKOS/AvSHWK9tT8PCAI7z/
         zSe69JxxOjjiYvEWONR2ze1npaic55OJfoom/VVijersFsQJ9e64NHmo6FTlOEapg77Q
         0BdCva4Xu8xKntYfPyvt8vAMorR63fzOhQ8z4aWu3iEe8x2Gk9stLI1vnnXNAyrbByp5
         Q18Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp44MUpl+WjN5//j8JYOkhlNNxNKUnB61siLd7AApQDzue5giNs68TfAyc/YJ2cqw9apXiLpWFgFGY=@vger.kernel.org
X-Gm-Message-State: AFuF++lpsbwyqkoyjeTQnXs70ZhY3lAB8eOHrPON712hulT0ExStCpeN
	S9XBel1B4YFsOqn+my1jUxR5soIYi7Sg5Jy+a19TiycGPcZZA7fSKGwZsr6zwhQvc+zWhsttHGm
	fyqMb/9Codij/3u/RktNujVtHmhY34Mz/dY2vJeUV
X-Gm-Gg: AR+sD13ND3EFtOTGj/ATPgXWH94wwEzpETzKrgQN3nDysCxTr1SBxROrkpLenozR5nU
	yUFp5MRgP83GKklIdg/gKHCHamhJg3cjEVqHSca9aiu5aM51qrc78ewL9ei0ci7J678WF/QYFhL
	0kq1kl/wj0sSl6XBzASAQ4eZFIZIeHPMj2wrWh7Ub99BNfPHGSNtxt7p/gkwmW7vXONPt29HIWa
	gACKTr2ptPaJxpLPOotA16Jgghdvp1A+4jLT176GM8BDZabJMQvl9QR8Cqz7Kxtagud1wnnzXEU
	earq58cnOVfs3Y0OOf8gmdWhj9TXW1huaWWz+p/RCuQnzWahxoIVX4QrUA97FRIkhNm3OsBuZkc
	p6h+AxVQ+i3kxbwnE/JP7z22dvkvM4eAY/O3oKic7DmLYw1IjXtPVqdu+iVdVddMEc6yPhx453l
	y3QW0kHPY9/4Vs
X-Received: by 2002:a05:6830:3708:b0:7e6:fa37:9797 with SMTP id
 46e09a7af769-7f4c4dfee34mr7818437a34.6.1787754760603; Wed, 26 Aug 2026
 07:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a88012e.dbb3a75c.13dd47.0007.GAE@google.com> <6a8d0f6c.dbb3a75c.7844.001d.GAE@google.com>
 <2026082540-tarantula-gigantic-b786@gregkh> <CANp29Y5YH=O35brw55HFo_hVmFDz5Y4Yw7buBc-rOjETU2DNjg@mail.gmail.com>
 <2026082507-ecosystem-giant-0b79@gregkh> <CANp29Y5hnOWaqGw8BbPu1TCr00TbvNRciYvs_VCd6Jtk=8kSPg@mail.gmail.com>
 <2026082602-compile-bogged-877d@gregkh>
In-Reply-To: <2026082602-compile-bogged-877d@gregkh>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 26 Aug 2026 16:32:28 +0200
X-Gm-Features: AcwNN1U8xGoi4BJvKqmFyT1BTT2HHIMJbt0Q1AHIDird_ONv_FDVdlZesHwWpx0
Message-ID: <CANp29Y486UwGwRJpqzQ4aU2eN4Xu3A+zw_zDUJuFR5hKQ+Knrw@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in wcove_typec_probe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com>, 
	heikki.krogerus@linux.intel.com, jeffinphilip14@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mika.westerberg@linux.intel.com, stable@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 4:11=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Aug 26, 2026 at 03:26:23PM +0200, Aleksandr Nogikh wrote:
> > On Tue, Aug 25, 2026 at 11:07=E2=80=AFAM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
> > >
> > > On Tue, Aug 25, 2026 at 11:04:54AM +0200, Aleksandr Nogikh wrote:
> > > > Hi Greg,
> > > >
> > > > On Tue, Aug 25, 2026 at 7:12=E2=80=AFAM Greg KH <gregkh@linuxfounda=
tion.org> wrote:
> > > > >
> > < .. >
> > > > >
> > > > > Please do not think that this is a valid path for syzbot to be
> > > > > fuzzing...
> > > > >
> > > >
> > > > Can you please elaborate on this?
> > > > Do you mean driver binding sysfs interface in general or something
> > > > more specific?
> > >
> > > That is the specific thing, don't have syzbot do random bind/unbind
> > > calls, having it attempt to bind any random driver to any random
> > > hardware device.  That's not how bind/unbind is supposed to work at a=
ll,
> > > it's for developers who "know what they are doing" and you get to kee=
p
> > > the broken system if you mess it up.
> > >
> > > Same for unbind.
> > >
> > > This is a root-only api for that reason.
> >
> > Thanks for clarifying!
> >
> > Some context from the syzkaller side:
> > Restricting the fuzzer is always tricky, especially when the
> > problematic operation is just opening a file and writing to it.
> >
> > We normally constrain openat to:
> > 1) An allowlist of safe absolute paths (so it won't open /dev/mem,
> > etc.), blocking any other path starting with '/'.
> > 2) Relative paths under CWD (so we can still fuzz normal file operation=
s).
> >
> > Here the problem is that one can mount sysfs under CWD, which leaves
> > syzkaller full access to everything inside it.
> >
> > Tightening the access to /bind, /unbind, /driver_override sounds
> > reasonable, but trying to catch all workarounds purely in userspace
> > (e.g., creating symlinks to these paths before opening them) will
> > easily turn into a whack-a-mole.
> >
> > Would you be open to adding some kernel config option or a boot
> > parameter to disable manual sysfs driver bind/unbind and
> > driver_override? We had a similar problem with writing to a block
> > device while a filesystem was being mounted, which was perfectly
> > solved by CONFIG_BLK_DEV_WRITE_MOUNTED.
>
> I've submitted a patch to taint the kernel if these files are written
> to, so that should "catch" syzbot and let you know to ignore these
> reports if it runs into them:
>         https://lore.kernel.org/r/20260826-bind_taint-v1-0-52b05f4a965c@l=
inuxfoundation.org
>
> Is that sufficient?

Hmm, if we set `panic_on_taint=3D` with TAINT_FORCED_BIND and ignore
such crashes, I think it could work, yes.

>
> If not, no, I really don't want to make a kernel config option just for
> this type of thing.
>
> thanks,
>
> greg k-h
