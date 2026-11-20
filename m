Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170863;
	b=OBhFUOllF9nIqWMiZOaaRRCpoET76hA1fLYivnSq56oGLZIZZ81a38+CDlSA8TlaUXTe
	 q4JQIMEocoB7JnybImXKNzUjuKLhhDsc8dQYl+uxyU7A0CORyTnn7REpyRvuG/IXb3IZ4
	 AMREFhVsGLEYlflqW7r6//7MkAYhnzQaevRGcIVkltRUsmBrFT8B1SKr+TtxX3vDW1Ujn
	 EOautMoaOuwAm93Z5Y/1acpO3UrSuWI9OU08OpY0QIOcvK61ZPQSNgREUbo9rKJ8J6lEK
	 AImeoyQiED6TWOzR2KmpJqI08s6KpyOMg/rekoXPjIbe/mYj667yV7fdcrWUG4jmwgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170863;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=S4WClgGTQce96cuQ8b2vdbaIwZ7thmN+5lziIGpcwlA=;
	b=F3nKrEteC7i4c/9sH5PuAulQ+vk7pnVQGJu1B6cNrfayO9/6urqCDmk1owbOuTgznCjK
	 qcZ1J2dvFfqYFFYz4NwXdPKuUHF1DhDQpLExcu4V42YgGi9eGtdHUqvYhNMl1irCka+vf
	 jAnGksPJhS1zgCssVUFa5E3rgDdpnwz5Anfm0rgIzmlMNt+Xv/E9EzGZs4z5iXm2eOT1l
	 I1Xr72kRGqQuCh74iK/9nIrd4UA14cau+A8H8Agv5DKFDibQpgrnWNkXv0P/4GJ1tbmTf
	 Iw+IEWLajt2ZZrd+gscNOF/wMu/gexG/GM7d0aUDx52luZZnymWsXS2a9BZ71+TDP5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GQgWd51A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E98606A320;
	Fri, 20 Nov 2026 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GQgWd51A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A571F000C6;
	Fri, 20 Nov 2026 10:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795170862;
	bh=S4WClgGTQce96cuQ8b2vdbaIwZ7thmN+5lziIGpcwlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GQgWd51A3gk3Hm6voEPBQvWZfe6RhvJ42+lpKy9+C8Af0eu/i1/nQAqKjh2/oC8Yh
	 3CPAHmTNcTRVMNuRcZ1ozR/MyYHIJ1szAzur7/PaZqYMoqFwRDY2pf9GXPW72P5bGC
	 c7IG7oS7AW7/7Tu8AeXEJqav6U1Sf4TvQE8vhv2U=
Date: Fri, 20 Nov 2026 11:34:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
Message-ID: <2026112002-unshipped-refract-b827@gregkh>
References: <20260821114854.12218-1-kartikey406@gmail.com>
 <2026092925-licorice-strode-7905@gregkh>
 <CADhLXY6t7UL9Ys65qDSBBAUzj+sQkS26xFZX3YjkFZ8ufS16wQ@mail.gmail.com>
 <CADhLXY55XwzujRCg+xgm4v4UJmfdgUQ0oihS39f3iMwFDzXTRw@mail.gmail.com>
 <2026101828-oxidation-squishy-51e3@gregkh>
 <CADhLXY4N5ia9-J7ahmnOE2i6r5w-SMZC0KiezFu0P1n7=O_xrQ@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADhLXY4N5ia9-J7ahmnOE2i6r5w-SMZC0KiezFu0P1n7=O_xrQ@mail.gmail.com>

On Sun, Nov 15, 2026 at 07:16:56PM +0530, Deepanshu Kartikey wrote:
> On Sun, Oct 18, 2026 at 5:24 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Oct 18, 2026 at 04:28:49PM +0530, Deepanshu Kartikey wrote:
> > > On Wed, Sep 30, 2026 at 1:48 PM Deepanshu Kartikey
> > > <kartikey406@gmail.com> wrote:
> > > >
> > > > On Tue, Sep 29, 2026 at 6:53 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Fri, Aug 21, 2026 at 05:18:54PM +0530, Deepanshu Kartikey wrote:
> > > > > > u_audio_get_playback_srate() unconditionally locks and reads
> > > > > > uac->p_prm.lock/srate, but g_audio_setup() only initializes
> > > > > > p_prm.lock when p_chmask is set. On a UAC2 instance configured
> > > > > > without a playback direction, this results in acquiring a
> > > > > > never spin_lock_init()'d lock when a GET_CUR sample rate
> > > > > > request targets playback, triggering a lockdep "trying to
> > > > > > register non-static key" warning.
> > > > > >
> > > > > > Reject the request with -EOPNOTSUPP when p_chmask is not set,
> > > > > > before touching prm->lock.
> > > > > >
> > > > > > Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srate getter")
> > > > > > Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
> > > > > > Closes: http://syzkaller.appspot.com/bug?extid=e1d0e66badecc32d45eb
> > > > > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > > > > > ---
> > > > >
> > > > > How was this tested?
> > > >
> > > > I have not been able to test this since there is no
> > > > repro present in syzbot.
> > > >
> > > > I verified the fix by static analysis of the call path in the report
> > > > (afunc_setup -> in_rq_cur -> u_audio_get_playback_srate) and confirmed
> > > > in g_audio_setup() that uac->p_prm.lock is only passed through
> > > > spin_lock_init() inside the "if (p_chmask)" block, so it is left
> > > > uninitialized whenever p_chmask is 0. Leading to lock splat issue.
> > > >
> > > > This patch is compile test only
> > > >
> > > > > Did you forget a Assisted-by: tag?
> > > >
> > > > Sure I will add assisted by tag
> > > >
> > > > thanks
> > > >
> > > > Deepanshu
> > >
> > > Hi Greg,
> > >
> > > Please let me know the status of this patch.
> >
> > Burried with 2000+ other pending USB patches, please be patient, there
> > is no rush here as this is not affecting any real device you have,
> > right?
> >
> > thanks,
> >
> > greg k-h
> 
> Gentle Reminder. Please let me know the status of this patch.

You said you would add an assisted-by tag.
