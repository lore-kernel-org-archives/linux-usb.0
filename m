Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B98246774
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782664742; cv=pass; b=sEtq5Xlsj+OsFPMb9WK856sklM6DQrOizlymTauIwJukASXvEAu+Y9BALPgeRqFTrFIUiYXDdr3tow68NCuAiMkwjsKy/MH8qcVbhFgtib6yMfN9Hr3le6eYKWr2mVXkNOIEvrZmZLAZ1IpNkfm6OkztoKOV2BpxDZZnGKBziSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782664742; c=relaxed/simple;
	bh=oF8AWW5pjpmqFrKuyPZxBk5waRwfJr5BbduDrbPfG8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwKC2uqXmrhXV14J2ohCSXBjHMhUjd8BnQUngPfrwXAbSoWPWaasTGQoCAi0Mahi2m+OygMuemLEaXLWGe5MFNtDDHBFyjYa0rUOaT60rbJqFSttZ2MCbYs1cE+p7dmjy6x23uFSeX4C9WJOb4P6hpUwJtHFaMsRiMg9theXPbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKur+EGk; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKur+EGk"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c122e4590aeso275941166b.3
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 09:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782664740; cv=none;
        d=google.com; s=arc-20260327;
        b=MLd2A6bLs5DaElpeqfnDHadHQdot1O4vnfrrAPbswpMeBEvIfwx2FlKBbuW502vtxJ
         BQ1+yOELFkDVhXIiHVLpXMUSq97pXp6YIX5Oq4uzm7SjrlsSCt9cU9CcJ22qC2O5VAuC
         BwYaKc7njB34U8i4SxNbtltcoyz8/hyfzHmb7gT2H9tHuUsbpbJ+G5StAPUxNcxPJSBB
         m+/eT6xjW4ocCwsHdypwUqlaMB5Y0HuD4Iu4rBe3B/3+uBjdhS0NPVu3YqiNpl4nDaO/
         7sCjzSIa37LV26ATCjhniroDNJAvcKgyZ8d5UYBL3K4WnImV4B6S6mOOX0a9KB5n/YaN
         H5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oF8AWW5pjpmqFrKuyPZxBk5waRwfJr5BbduDrbPfG8o=;
        fh=5YowslqWyTi6yV+6lEG3hofdR3szzn712W5gf6s12a0=;
        b=VCBpZeFyICoZqIhTbuvodDIpK42ne/Djc4lRWcqftkMyvFtxUaaBCC/H2mmxq1PG6I
         nfliQzwBTBkO4OPAKjAthX45LxL7420Vd++68lpGC6aT3gezc/FiPrTateKatb7+nsna
         TZD42JpVCi1lyM76eHzNbHbr06q11PDhhBuS/X559RldgROYHg0kvMenB6z2llujghLm
         RI0b3fNb6X1WftbgpsrAO2y5UrtNbc61QCpT77pvMWQz7DfkRwbRexkDtRKHJWshWKNO
         3TliK2cVCSOY6+MjM4gTe0BNvha31peVu/JEScqYQKbgBHhLzwNeKhqg2yzFJnE4dBzb
         zpGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782664740; x=1783269540; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oF8AWW5pjpmqFrKuyPZxBk5waRwfJr5BbduDrbPfG8o=;
        b=bKur+EGkofcnljX3bv3FP201GzxrkWvwtLw184et3muuSdKWEJYOwb/GW7ZoOw2q7q
         tCLYYPzZzruIbaz5+492nXo+JiBLwlMGs9jMVsJ7pN0v9K+iiai18TrN9XOeCiMgrFE2
         vq/bWtGLPf6gnD8Hi0Zd8TzMaAV71DDxOS5Rdom88wyd9E5VHyi19+aBhoIADgZMpCQ8
         /WhnOyOo3cnlIifBpaY6igj+jl/kuv956ZQUGEVmHhI71r7HGihzzmlHbZYo5TrBBZE4
         AKvC6I7ju1l+r1f5p6Mm+qzbBP1x1Sd4LxYcAE0dHZEIBBe/u++QwYYQ5rfjPMMSSEnr
         N2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782664740; x=1783269540;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oF8AWW5pjpmqFrKuyPZxBk5waRwfJr5BbduDrbPfG8o=;
        b=CGSWIZpeusTzzDVy4mF6pf9Skhza++EH6X8R5emr/bR4vuvVkwio4b39/yWuEsqRlN
         J5giuA5GBZesR8kj0Wg/etKSiUqRFHzitfsSBTBxI1ewM+rlOnsInX82DcJFVs0oM/1O
         aGXRUXOahV3ULBnfgfRDL8HTHp2EFVreVnvA54ofPWCkcKjwIa797nMv+4Ij0609c43U
         Ek7Qpxsh47e+9dlG5nzodScXtsOlnQnt/eIcKiI4uS/T0SQRjgh5TfOY84n3Im1vy73r
         ALMhndAnNlnIIUz86Ssm2YnCyW8QLwJYSei5p3dsZGfZKQopQ9JZ8cm7hvQNdTsGSFpd
         JlrA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9Ckd5xcNVS2qkbO+zGzi2YwPdHNVfpx84MEV4nocZGnSaH496G9euOlo/R4wdOliSp43gQ9Z16zY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxehxEh2lpO3SrBjVsFpJ15ZiKJe14lwxLhw7qrkRnrJS5XjjZ8
	YwLrs3HoGEaYjflbNMh62aeEA8rD7QD4HOcaCo0SFIP0UyOvjdBkivAUFZhOLAO+cIXeWcBfmWv
	0ZkCg3Bz8/xMC2taeA1s6x/wP0GCtSuU=
X-Gm-Gg: AfdE7cmMbuD32t3vxDLYbdYtHG806hgez8eev8IfyB/lDkGZBxiPSRNRybTtaQJKayG
	LijzLRN7Qm21ln1n1W8Lr9OzRC6ZFiR7hOTfjsYlDFmB06MmWaPKw8BkiQUJolklwxL6htuy7YF
	Dlk15T/yJ2VVgHT4VtDUpeByzvTRvj/obleYx2f9iDuwSp7DHtAdAJ9ojqAp8eTCT+2uxAmJCB5
	JVRfi5q6anSCTzEJVPK9Xsrp5E02jus9doTlSR9h3pH7zoVNTObSVN8m0D0+B3vNZyHtWv4VbZT
	EZH7Lzc=
X-Received: by 2002:a17:906:c156:b0:c12:3c96:838 with SMTP id
 a640c23a62f3a-c123c961142mr249845666b.4.1782664739321; Sun, 28 Jun 2026
 09:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
 <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
 <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
 <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
 <CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
 <02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu> <20260628165040.76fd608d.michal.pecio@gmail.com>
In-Reply-To: <20260628165040.76fd608d.michal.pecio@gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sun, 28 Jun 2026 22:08:48 +0530
X-Gm-Features: AVVi8CdB5AnO0mtdmg2yxL9ayYJoS_AHThaWgN_hBet0KNFvHXEcgc-7Urzbs-k
Message-ID: <CAFgddhJehWf5P_=J5pJM9h7MYXxb_qkfNusHW1aJ98wKXh3ZWg@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jun 2026 at 20:20, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> On Sun, 28 Jun 2026 09:55:07 -0400, Alan Stern wrote:
> > On Sun, Jun 28, 2026 at 11:53:09AM +0530, Nikhil Solanke wrote:
> > > I need some help with the USB_QUIRK_DELAY_INIT part. I can't figure
> > > out how to make it properly work with my patch because of the
> > > following reasons:
> > >
> > > 1. I don't want to move it to the top because, from my pov, there
> > > must have been some reason for placing that quirk where it is now.
> > > so i don't want to mess with it.
>
> git blame is your friend:

I'll keep in mind to use git blame in future. I haven't worked
extensively in a large, collaborative codebase, so using git blame
didn't occur to me in this case. Sorry about that!

Thanks,
Nikhil Solanke
