Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB3D395ADE
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 21:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782249262; cv=pass; b=D/GfP3/fgcw1JfqP6NoMVmymFB8hKDV7c/8Skl/HjfZciCP2MrVVxSaPHGZwF4ItnTDenTLT+Ehy4tUYGVZuPtKYejJ/pQYPV3W35aElQU/hsSIi4PWFJkc3QKBpMA1cFQSE2nARZA3lJP3Kri/cCNuCysftpMgkpCBv5vkIthc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782249262; c=relaxed/simple;
	bh=BEu6oE1hirZSlFOt35YJmaquG08gwWbriv8/eCijrXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOeFilMjW26mQBiDYxwiNUTOXCPWiMAalhMcFAe9g5mKV46QEjLngGGvSr1/EIevPxqDNSm10KWh5HPr8C5LSE3yf7uKnFepsXnUycQt8R14w0JFGt4gx2SgvJ91QdL5OR9TeB35ZWf0GCTGbalklWNgMmB4wEly8OHJtRMc274=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sl0yFM9f; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sl0yFM9f"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bec49f7e35eso50516766b.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 14:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782249259; cv=none;
        d=google.com; s=arc-20240605;
        b=Mhfz3KpkKaXVqMzb9tZZo16Ii6fngd2tDZo4WGBZUiOdsA+qJ8Z4OA3Jw3yjzid1Je
         JAfEhIGCpsLWLfjcKJJtvg/OMUVJu9WH11ll0jRsXIoilMzSGIyCQHzenAajUjGjCa5d
         UUZvnI2HPUGUmNVTcuw8SaDr3tpvDR4BPxq6fyBpiZOFyNbBxmGZLaP07jKfu3xn9Orz
         BMZ4HSH0clC6wpsrfeRomOsVRXlDOjNPcITCk7WL8QPATY84Z4zAc5fdJ7OhZNlvaxRS
         MKnZ6mtKO243TV4Yy9m3X18fOlfW+bK/Ck4b5RX41zheDTUYWQW0bxwqVaVtbvhHUtg5
         8GHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=71fysXJovgrDCc8Ak5Zz96I/xjwYwfjNFkfuKiiFSRU=;
        fh=cQQC4ZcnSDaZ03G3vNlFyuY8RcJWNy18nF+ZnOE1ImQ=;
        b=Ylo1dXhn8MsMsUMuGiVdI7i2So50d3ZGFGeB4an6t6srHKFUZTDPJqD54/rIZQ6Pt8
         fC40+mG52l+GhPvUHKaj5np2km1NsbbFJkQjaWZVRPd4Ggs4I/L4aMWV/CBauqirioXm
         cvJPr1EETSG7jvvT1TY+R4pK9My5cbb8xOxwmyCEHuWRsXs7DTqSYSrzgtPdSS2ccnkB
         fDoYVU5FJN1EFTlG2nRscbPrp3pGUZOlIBA7zR6/OAP0PWk++BcHe2GgszVBGai8KQx4
         sUtslJitRxiFenlhKEd7/jU/ANM26mKRMVjV0u85vhglUzYUuAfIVDX8l/lfGm3SHtNk
         pKZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782249259; x=1782854059; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=71fysXJovgrDCc8Ak5Zz96I/xjwYwfjNFkfuKiiFSRU=;
        b=Sl0yFM9fmlE/0dP2EFtzcITAAp0HejHQhaNmqIAXpLIdhlQ/C6UbKpz5gK1e2ZDH0y
         3a5otLbdkPZzFWLT7UE+918hOBWtzduIWZtQzcH1bDIbTxiUvxwSHTTSJBkNEmlQUlSE
         C2Zvu/lo2k5BZCOyvBSolXycPTWfcqywGn1ChKrj6jTdoUVv654TWlXiKcGR2mgs254n
         Hi42tL2sVvzmubRhXeqUhY90EF4mY375DCSQHEQFuxV2/0gPx0G9MdmfrjXJwJSsimMo
         1bKoKhTl5paVWMjv1pflCYUidBHWl9OKaHA1hJS0O7QWY6kpjU9goNlYSg0uKWTGyLeA
         AaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782249259; x=1782854059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71fysXJovgrDCc8Ak5Zz96I/xjwYwfjNFkfuKiiFSRU=;
        b=ojdT8RNKk0foGv8zKfkYWpn4ZAiRBNOv6/+hNrULF0u3vrgJdZp3kXkXPGDfOScvz/
         qzHg1ao6YnlDCCKZ3zdP9DUG7oNMxPZimPBFWIPXE7DitRf6Hty3drjNgByPul0FaejS
         Yc16ORD++Dhxd5GPtb8rn2BNFW/5wKMt2MvihKGpN+36zYyl2SllgWcyoPN8ImpN0T1f
         3P9BhNmEOGHb4i4NeA3Z3J39HE+Cef/JPtogK4sahBbSWIe5yUTVmzuxndJezpP5AJDU
         h92mmk+BfJikPAWJ+YepAAHgHWKAVpf1EOtaXuHuTNnLjLcdAEy3ZrPM7gCsyztagJrq
         mWxQ==
X-Gm-Message-State: AOJu0Yy5mrmCPmjZi78xDk0VfbCRCHouVsJYNZ5lXPrdDlUWyajtGT64
	NxfcUcia4oemnWzFZk+6tG4Eqd7OAUWdSvWhR1Q6r8Fa301YgbVqTAJ/anZiOhg1fShClYNbmN7
	3r4HCb2TyvL2efLPw89NlpghJ4FytyeY=
X-Gm-Gg: AfdE7cntuUt25J1nCUmVlisE9vV+NL5nh7Yhqd+dcfmPMQLknQMJzuJw3jmXTXrBcCb
	lEy1rwbk1uh2AaYSgzo0DUoNj0L/yhZdEdbPzOKP7FC98W/iq5hy71K3LNCP8XV6j9sy1rCvHtB
	zm4rLh8v5gVvIAtumA8ARE7SncU68MwBW4PqfiqSCJwZP24XPnM9HGu2MusWpDSpnJ8WUI8sD3E
	9JldYQqx/K1NRU4MRv/WWKatB9Tqs/4EXah1CJU1rJqnVX7wIO177Ntr2uQE0fD+fogzumP1g==
X-Received: by 2002:a17:907:3f1f:b0:c11:1753:25cc with SMTP id
 a640c23a62f3a-c119f025261mr13470466b.42.1782249258699; Tue, 23 Jun 2026
 14:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com> <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
In-Reply-To: <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Wed, 24 Jun 2026 02:44:07 +0530
X-Gm-Features: AVVi8CdIaeu_joffRLcSvxxiZQ1_ZI76_fR_kxTsWH5gxda-81WTi5hBvd3VxLE
Message-ID: <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com, stable@vger.kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Moving this delay up here changes the behavior when the quirk flag isn't
> set.  While it agrees with the intention of the USB_QUIRK_DELAY_INIT
> flag, such a change should be mentioned in the patch description.

How should I mention it then? Nothing comes to mind besides the
obvious: "Also move the USB_QUIRK_DELAY_INIT sleep to before the
initial descriptor read, so the delay applies consistently regardless
of whether USB_QUIRK_CONFIG_SIZE is set.". Or should i revert it back
to original position?

> > +
> > +             /*
> > +              * Grab just the first descriptor so we know how long the whole
> > +              * configuration is. In case of quirky firmware, try to grab the
> > +              * whole thing in one go by asking for a 255-bytes sized buffer
> > +              * mirroring Windows behavior.
> > +              */
>
> This needs to be rewritten, as it is self-contradictory.  When the quirk
> flag is set we issue a 255-byte request to mimic the Windows behavior,
> and only when the flag isn't set do we grab just the first descriptor.

I am sorry I didn't understand how it is self contradictory. The
comment does say, "in case of quirky firmware..."? Am i missing
something?

> >               result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
> > -                 desc, USB_DT_CONFIG_SIZE);
> > +                                             desc, usb_config_req_size);
>
> Don't make extraneous changes to the existing indentation (or whitespace
> in general), here and below.

Well the linux coding style guidelines mention that those descendants
should preferably be aligned with the function open parenthesis. Since
i did "touch" that line/part of code I though might as well indent it
a bit accordingly. Should i revert the indent then (in this and the
other place)?

> >                       if (result != -EPIPE)
> >                               goto err;
> >                       dev_notice(ddev, "chopping to %d config(s)\n", cfgno);
> > @@ -957,13 +976,25 @@ int usb_get_configuration(struct usb_device *dev)
> >                       break;
> >               } else if (result < 4) {
> >                       dev_err(ddev, "config index %d descriptor too short "
> > -                         "(expected %i, got %i)\n", cfgno,
> > -                         USB_DT_CONFIG_SIZE, result);
> > +                             "(asked for %zu, got %i, expected at least %i)\n",
> > +                             cfgno, usb_config_req_size, result, 4);
> >                       result = -EINVAL;
> >                       goto err;
> >               }
> > +
> >               length = max_t(int, le16_to_cpu(desc->wTotalLength),
> > -                 USB_DT_CONFIG_SIZE);
> > +                             USB_DT_CONFIG_SIZE);
>
> This is another example of a change that has nothing to do with the
> purpose of the patch.

Isn't that what you told me to change? So the logs are accurate? I
made that change because you suggested it. :')

> > +
> > +             /*
> > +              * If the device returns the full length configuration
> > +              * descriptor, skip the second read. Otherwise, send a second
>
> Strictly speaking, the configuration descriptor is only 9 bytes long.
> What you mean here is the entire configuration descriptor set.

Alright i'll reword it.

> > +              * request asking for the full length.
> > +              */
> > +             if (result >= le16_to_cpu(desc->wTotalLength)) {
>
> Shouldn't this be: result >= length?  No point in repeating the
> le16_to_cpu calculation.

Yess. initially the length assignment was happening afterwards in my
patch. then i decided to move it before the "if" statement since the
outcome of length was going to be similar in any case (within if and
after if). but then i forgot to modify the if too. Will fix it.

> Like above, this string should all be on one line.

Will fix all the strings as well

Nikhil Solanke
