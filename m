Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743CC1B142D
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 01:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788572925; cv=pass; b=Or67DmRf39XO9hs7E+OtIEz45lpfxQond9ElT5sCBMve4ZiJNydA6P6FguvV+4teSZTlQw3MdWwUy1OEcqpfX4CXLcrOXjqr0c++aO8UIwvjuHaxsEQHutoP+jQnqq1PXT3GcN1FkTSi7RqogWsQ2SXVB65HJVSOCFCclDv0INo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788572925; c=relaxed/simple;
	bh=Pv5mzELtc6viyvRZ87Y9PHyCZ6JISF/nLwR33q98VVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k47gNCkKjcL/KJzk1dfrLiBYMpeelVPUezBcXu4cn7hOujSetR0qH+2oyzgu61vY3+mj7awe6I+VqF+9h2UgGdlvxI+xkPxykgYamKXOSxxohHhtjsdJRrQJ4FDRsOB+TEC87GWj2tDJuAqiU2QZacP2+rSidqHih7yyS2yNgNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3smPhHT; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3smPhHT"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9382fbb1208so155351185a.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 18:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788572923; cv=none;
        d=google.com; s=arc-20260327;
        b=W6NC7VGSGnUgdf3VRjpv/bR2uBmMmw8dJEgVZq5rV89215jh+3oIOfaghK3bExOxWj
         WqttirloRLS8hKGJMB594I0L3yY3jrZ36OS8wuVEo0Dw9+Ka7qohwt1p9xdRa1yrpc0K
         8cAZtkCGVU3ZM8vhdZkFwE12Kk1I2yzBwvIIDB7RDcmnVCXq0poOqbQD1+lsmznHDtUG
         jYEDJA/jIR3pEyRolQgPFMbB4vuWtil5XEjiknaA0ieo4TfT6h71bqu5feuG8/74LbKW
         VXmMPnIHiNx6OG63mK+tdVNxOLAEmEKYiZwywEd2KGlVa209pJMT45hCBm9K6atfZdiz
         f5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pv5mzELtc6viyvRZ87Y9PHyCZ6JISF/nLwR33q98VVY=;
        fh=jHi5SetSEUFti5of3H1IXqVcw1lBIUdq0FfashG5/Sk=;
        b=FmSuOMkzpAZIkCDudFnJToctxbPgOY/UUn6tmtBQ7bB1bW6D9doMQ+icnfycI4CLIC
         TajS4D9gEeQNizmwVLCFri8eFJveGVgql/I94+GyQ9BQ1kQGcfPsdtzFA3QIBXKHP1Tt
         MF3p7FFv/Abw1+z585YVVQzEwBNkn1eTpNW04UYGueulI/2aFEQaSwsRbvuvyxRlKe4p
         /K9CPSNzr3UNvI4lUrjFxAA1Y5SJj4BZctow/Vu+6hOdLZ6arfcXPzgWlry8dmnSW5ID
         ssNnLbSyfGTx270CbmAsG25RaAnYn5mwwLROGCms720D9jhgzqEZGK04aH0rzhLWqyhe
         G7yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788572923; x=1789177723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pv5mzELtc6viyvRZ87Y9PHyCZ6JISF/nLwR33q98VVY=;
        b=D3smPhHTgyz+0wVjaaEYyF5Wd12cxv820JeOOeVEKOAW5+N7OClL5mLzdbwo2tsLI4
         JKZmq9mlwA5kaB7wj+1mbxuH82+1nfNb6i/t2mRUDe/c7H5kFG+6DeGKszFRecIWqJpp
         t3hkLVvHl1kIaw0kh9MhRA95e10LGrmYa+HpNAErhvHOyi+6mI7peHkxdDQJtS95/+EZ
         Z77q/5YfXMtkiDTxHiV+/fvMStAhSbGn5Y9427igMB9ejeGP4PDckz59Jwo2M6RmAxcB
         pfVv1szC191hzAHImXf0ZwWGcyVTn3AY+uU455VsFpsmmKzhLzwMJEP8ZhLRDPLkQRZv
         I2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788572923; x=1789177723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pv5mzELtc6viyvRZ87Y9PHyCZ6JISF/nLwR33q98VVY=;
        b=dv3ahqDBX+JiVp6nLOfQ4QGO0ivOI3G/BtdntbKWthUiiEr2hF3Lv4bVjzbVv3yfy0
         +BVYVdfQfcsfKCkB/AjA/M3y2tE4gf59HECGbxGtGh4uJcbpspurjNnxJzx4orQ7LH0x
         aD4YAOlyd0eYE1mRKBlUfBZ6M2odqFpLJvILW3IaTzyN7NI6mYtmkVhHw3aThOa53ptq
         ieI8tMmrY0aelisk1NcF5xlxYBKpMKcLoD3P7OvbYNq4L959i6KY4g0ZksmZSFlD6enh
         ju/O/1c/DJ0Y3QQkVhVf/PFn4tKwVzMnjwGurCc0benlyBtkv6jFoo/xuxHx8OZa+D+r
         gDVA==
X-Forwarded-Encrypted: i=1; AKwUvBxhvDHGoAtZ5m+lczKKzLIx1hGB+nx9h9LTY+z5WzQkqtsQfni5s9PnQQ4wNfmNWSFMQwAImy0iDvQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mUVsvuq/IPWEoSq3AROQKFV/3U+Mseaapm5giDGzYlS+zVtOnp
	R02BVGQP+AhssSLUPMe9OIpXJCs8Rgi1uC3vRP9JB0erE4HSUYOVuYOngjwSbTDGpYwahJmF6iV
	a68pi8n8ouw7EtxRvMEMshggjE5wN6iOENazU
X-Gm-Gg: AYBFou2nG5TRQHhMINYvYLN+Cmcry64zqUyfO13ZwvOjUoEp3CAWlN8kD+/nRzlDcRs
	Ia88youtYCj4kCLMgtJadxqPzroCt+BFIq4ySAl41u+D3hc5t2ADVs8e9siZ/BSArLI9EM2QaKN
	ZA/O3k2MmvRPPHVJBkYUygyYXMQBeZmZ8hQyYjrrTNXqS4SISatJJ4Q61Wtipq9Fw1kthyHTrvu
	frG5fNZlUbIVNwoENa5TVSZjl3C2a2e0fsqIiuy7yYxvFA4KPCzYm4jAUBPFOJ6sPlhvPx/uqK0
	NYAxwbEwgQi/ReNcjffGGtxWT8C5eS1spTvl5hGSTlrxDIVB4u4dFmch+VSPMmWhQ6ihrze1D4s
	=
X-Received: by 2002:a05:620a:3943:b0:937:1097:feb8 with SMTP id
 af79cd13be357-93980426539mr980114985a.24.1788572923149; Fri, 04 Sep 2026
 18:48:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
 <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
 <20260404152438.582f0451.michal.pecio@gmail.com> <CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
 <20260509180603.6f67c9d8.michal.pecio@gmail.com> <CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
 <20260512120334.4eef3d0b.michal.pecio@gmail.com> <fc2d9862-6c46-4161-8fd5-68b9e6c2e8bb@linux.intel.com>
 <CA+_z3hRdXfZm2ziCmsXEDEY-i8XJjxnw2oe6mkTf+O+B0fx91A@mail.gmail.com>
 <20260529001057.1e0403c4.michal.pecio@gmail.com> <CA+_z3hQF-EGKr11Yaa5vwMLt9TUB1mL9ESUAQU5Rnd=UZDXrBQ@mail.gmail.com>
 <20260529122210.6d2c5543.michal.pecio@gmail.com> <CA+_z3hSMRvW6qhZ4wB54hQyY89z+Mm0C48MGA40aqG7_+spX2g@mail.gmail.com>
 <20260530005742.25893efa.michal.pecio@gmail.com> <CA+_z3hS4sdnZAhAvO+dDTR9hZVwGudDrsw93Do6dZkva8vK=5A@mail.gmail.com>
 <20260613112648.2ea61301.michal.pecio@gmail.com> <19b188be-5f81-4f87-b29a-e4ac1e55221e@leemhuis.info>
 <CA+_z3hQ2pZT3Yp+psTRF52Hm9rw7oHW+SdxThxD8KmoU24tkjw@mail.gmail.com>
In-Reply-To: <CA+_z3hQ2pZT3Yp+psTRF52Hm9rw7oHW+SdxThxD8KmoU24tkjw@mail.gmail.com>
From: Martin Alderson <martinalderson@gmail.com>
Date: Sat, 5 Sep 2026 02:48:32 +0100
X-Gm-Features: AcwNN1X2YvxxakeI2M9gY1_WVstkRlX6waqU8JBaM0mLh57-pyD-5MIBvF2lQ5Q
Message-ID: <CA+_z3hQn0L7ks9x4PF9O4Y0jvkPOLGk0r9Hx=W7oS2edh0_qNw@mail.gmail.com>
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] dies
 on resume from suspend
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Michal Pecio <michal.pecio@gmail.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, 
	linux-usb@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all, just checking for any updates? Happy to test patches.


On Mon, Jul 6, 2026 at 12:59=E2=80=AFPM Martin Alderson
<martinalderson@gmail.com> wrote:
>
> Hi, no update that I've seen.
>
> I suspect this wasn't a regression tbh. FWIW the patched logitech driver =
has fixed it entirely, but it would be best to fix this for other ones too =
- I did some analysis with an LLM and it thinks there are a good 10+ HID dr=
ivers alone that are potentially affected by this bug.
>
> I'm more than happy to test patches if required.
>
> Thanks!
> Martin
>
> On Mon, Jul 6, 2026 at 12:48=E2=80=AFPM Thorsten Leemhuis <regressions@le=
emhuis.info> wrote:
>>
>> On 6/13/26 11:26, Michal Pecio wrote:
>> > On Sat, 6 Jun 2026 14:12:22 +0100, Martin Alderson wrote:
>> >> So the ordering that kills the controller is:
>> >>
>> >> 1. dj work issues a control SET_REPORT on ep0; the URB lands on the r=
ing
>> >> 2. usb_suspend_both() =E2=86=92 usb_suspend_device() drives the port =
to U3
>> >> 3. only afterwards does usb_suspend_both() set udev->can_submit =3D 0
>> >> and call usb_hcd_flush_endpoint() (drivers/usb/core/driver.c) =E2=80=
=94 and
>> >> that flush unlinks the still-pending ep0 URB
>> >> 4. xhci issues Stop Endpoint to an endpoint on a U3 port =E2=86=92 5s=
 timeout =E2=86=92 HC died
>> >>
>> >> That matches the trace exactly: the "Cancel URB ... ep 0x0" appears
>> >> after "Set port 7-1 link state ... U3", and the debugfs command ring
>> >> shows the single stuck Stop Endpoint TRB (slot 1, ep 1).
>> >
>> > Makes sense. And good point about usb_hcd_flush_endpoint() - if this
>> > gets stuck then usb_suspend_both() can't complete, which explains why
>> > the HC still isn't suspended either.
>>
>> Was this regression ever resolved? Looks a bit like this fell through
>> the cracks, but I might have missed something.
>>
>> Or is that no regression at all? From the initial mail in the thread is
>> sounded like one, but it was never bisected afaics.
>>
>> Ciao, Thorsten
>>
>> >> I had Claude patch the driver and this seems to fix it:
>> >>
>> >> --- /tmp/hid-logitech-dj.orig.c 2026-06-06 14:08:26.580516662 +0100
>> >> +++ hid-logitech-dj.c 2026-06-06 13:42:15.702948099 +0100
>> >
>> > Improving HID drivers is one thing (which should be discussed with HID
>> > maintainers - see Documentation/process/submitting-patches.rst), but
>> > other drivers may behave similarly and it would be nice if this didn't
>> > crash xHCI controllers.
>> >
>> > While URBs on a suspended device are weird, it turns out that xHCI
>> > spec (4.15.1) doesn't prohibit that, it only says that endpoints shoul=
d
>> > be stopped. Which they are - problem happens when we try to stop again=
.
>> > I'd expect such a command to simply complete with Context State Error,
>> > which it does in my tests on different HW, but yours gets stuck.
>> >
>> > I'm not sure what specifically triggers this failure - is it stopping
>> > a stopped endpoint always in general, or only after using the SP flag,
>> > or on a device behind a suspended root port, or something else.
>> >
>> > Would you mind testing some patches? I'm thikning about reordering
>> > things in usb_suspend_both() so that URBs are flushed before suspendin=
g
>> > the port, or investigating what exactly breaks your chip and adding
>> > some workarounds. We don't need to stop a stopped endpoint, we could
>> > proceed immediately to Set TR Dequeue, but it's uncertain if your HW
>> > would accept that.
>> >
>> > BTW, you initially stated that this happens on the first suspend after
>> > new boot, but are you sure that it can't happen later? This would make
>> > it possible to test patches by suspending repeatedly until failure.
>> >
>> > Regards,
>> > Michal
>> >
>>
