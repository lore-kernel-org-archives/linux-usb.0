Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0246D37998A
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 09:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769678906; cv=none; b=HrfPmCXMJbw0v1IQVMvl8ypsWIvV2YZ6MoMqh1bZItaUVBvnZRnVPVVLrCtQLpXsi1idCtaDaLdrZMGPZOEERIPWfEuVd5vox7tp+FvXkjDKej3pNYqGgWOD8wKU9wRZqYZ2yCxUIFoQdXK4bSOlJcXz7olHLBEz6uZkEYivFDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769678906; c=relaxed/simple;
	bh=9IC1mYIL2K/qsFi0WWJzhAFG9W9yVZCl1E7bZ2lIdW0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W89FGGCHGHkQJwQpy065bcQCx3zyxnZsoCM2fH9aL9gkdjjCxebL3E4XrW6LF9MY+5aUtfyQ1dRrec74pmhDpwWl36bGEOzI/NoQJ4tAPgPfZFO67HHZ3/YUrAePN0EMq2p4sBbUkBgfgMsZD3l+p3BqxMe7dVUh5/xWFclDeUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ax+gAJrm; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ax+gAJrm"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fd8aaa6eso6122841fa.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 01:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769678903; x=1770283703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTOjjGHr9MOnepGVIrtUBGY601QmKBRtnyWIB6Hs06M=;
        b=ax+gAJrmndTvq0aFo6z38TWdSEJviOrp6QHdi+8WjoPceDZ3OSzjUU68gYBwoOMztq
         PsBbeEDrHLY9adHq3OMVW0DefyByGZ4SWxFBlwfLTzfCr133fnUMsZ9SIP5E/YWrmkRx
         Rxpuwyz4d/jfJh1I0EbeYmRN1hxbELnzAlFvesLN0zxIq/2m1XD0uRo9BV4PsBueu2+g
         nBDRrtvMgK0RRdCrkUwzCKKK1JYyUgDpq7GB949kRc8E4pkEplA2EE8Z+ZLZDrTBUWtz
         MUKaPxJlSf4OZsB5M2ba8IeRLoZptWJItPF+Oh2lqoChrFkCb5Z8fcP/kvRZtzRhkH4H
         8HvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769678903; x=1770283703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mTOjjGHr9MOnepGVIrtUBGY601QmKBRtnyWIB6Hs06M=;
        b=Gm3DV+c9yMwvaAQn2mR1/rjZO3TPI11PbtlmVS6dJVo2sgLO6QCUJ11LmD5lNHCxgd
         F9KZYziMY3hYOO+hYT3NaYXDTbCfgQE6LPG0OImuGP2bB/CRoX3YXLctB5J8OHiJ26UG
         gMiesdi1OlJmFcGa0lhD1H2Fizpod6ZaT6A2sM87QSOqJoTlKZmIMNeiLCgMMUuRed2J
         9aKOhm8iSs3ML583YEUNRcNlpRrXoJFNZFchfhE7kPI6iVWVOZ857sQEEU1vIUCXS/ZY
         3QHvHspK6swvXZtfkHWUYqXszzoRGHt6e6jgHiC2fDsdaKnW773OX3IQRG3w1FHvI/qh
         DrHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRKAbSUrsSNzj0lp0gsUtF5DLGJulT/FqiLDCjmWyHgE6u8zMCRI97MtvIpmQkEaUzNkP1mw2u1xw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1FNwY0DVpSDyBMuF5+SOqqjv/0wNdVcMQtyUoTINbrYBUETtK
	4hUWINdnOrWetkM8Rhx38j83Oo5iQm93dsOYrmlF13DXJmHHiZdUOFjRzT4lGw==
X-Gm-Gg: AZuq6aINCoiDgN7jT8VRS8McxwJdWdxg6eVcC9FemWpOXL13KMHDHFBwmtoqcVtW/Uy
	JhQ6LiFMiTxQrjL0o9oAe3GY3p/uS9HgwRl/V+kNCxLqFYG3BxM08ZfT8ycFh4b15SUCOUj0Kh3
	cYWSIW7sTJUzbBujLGQ+YFq5Nho/zuh+UsYYoGpiiRTU+Ewm2MNtB7lGUDG1oj7lHlcCb74t1EX
	m6B2k8R7tcY3gXzBAsNh7DTMxCxBRg7ght5iIBIV+CcZD1SAcBVYTYTkNwlKSL/OaOwAFvYXs0F
	monLx+VNq54YkqpHf2k9O7qHuq6UGzOh3pZ4TvbrauJFYwCEdhKs1n3243v1XeOajqfqa9VHV6t
	DIt4lj6m/u+SDiRI06DFLBOzJhw3uE4mNj+bRzO/1IIAiRAx64CvpbUASUDAlTjte9yubUUzOe/
	muPRII5Ve1WzDW80/0NOaNKvg=
X-Received: by 2002:a2e:a7c1:0:b0:383:1962:b8ec with SMTP id 38308e7fff4ca-3861c8c25c8mr42560291fa.33.1769678902851;
        Thu, 29 Jan 2026 01:28:22 -0800 (PST)
Received: from foxbook (bgw148.neoplus.adsl.tpnet.pl. [83.28.86.148])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625f6c670sm7658351fa.32.2026.01.29.01.28.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 29 Jan 2026 01:28:22 -0800 (PST)
Date: Thu, 29 Jan 2026 10:28:19 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Ben Greear <greearb@candelatech.com>
Cc: Oliver Neukum <oneukum@suse.com>, Alan Stern
 <stern@rowland.harvard.edu>, Hillf Danton <hdanton@sina.com>, LKML
 <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
Subject: Re: Deadlock in usb subsystem on shutdown, 6.18.3+
Message-ID: <20260129102819.77378628.michal.pecio@gmail.com>
In-Reply-To: <737b2608-3b62-0e8b-9c78-44cca4d078be@candelatech.com>
References: <20260114024506.2210-1-hdanton@sina.com>
	<dae8dc09-0e06-446a-b6dd-4c86ec423997@candelatech.com>
	<c52546af-e39e-4096-ad11-9b38bb2d5f7e@rowland.harvard.edu>
	<a721a966-0a4b-cbc4-71ac-a482156ffa48@candelatech.com>
	<2b4c47a5-1a5a-4e94-87d6-152da16a3b9c@rowland.harvard.edu>
	<2ea634c6-26a4-48a7-8fcc-ad0ce06af890@suse.com>
	<737b2608-3b62-0e8b-9c78-44cca4d078be@candelatech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Jan 2026 09:29:56 -0800, Ben Greear wrote:

> >>> On 1/14/26 07:13, Alan Stern wrote: =20
> >>>> Unfortunately, we have no to tell from the log you collected
> >>>> which host controller driver encountered this problem.=C2=A0 Nor,
> >>>> unless you can replicate the problem, any way to track down
> >>>> exactly where in that driver the bug is -- or even any way to
> >>>> tell whether a proposed fix actually solves the problem.

Considering this looks like x86-64 I think we can make an educated
guess that the usual suspect was involved.

The guess could be confirmed by running 'lsusb -v' to see if there
is anything *other* than xhci-hcd on this machine at all.

I have seen shutdown hangs many times when I broke this driver in
various ways that caused URBs not to be given back. The unlink
mechanism is complex, with many steps to possibly go wrong.

> We are not able to reproduce the problem.  If we are able to
> reproduce, we'll take more precise notes and provide what details
> we can find.

Chances are you may not see it again, but if you want to hunt for this
bug I would suggest setting the system to enable dynamic debug before
every shutdown. Particularly xhci_hcd module debug if you can confirm
that this is the HCD in use.

It is possible to have those symptoms at shutdown due to a problem that
already began before shutdown, but maybe went unnoticed.

Regards,
Michal
