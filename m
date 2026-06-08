Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98C933893D
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 07:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903064; cv=none; b=OCKkx0MV85gPfbTF5iqyM/Ts/MplGDz40RN6tU4rq7k3Ev6h0h08iYSeFlNzoZAXpYf9/l8MuX1vOexZOzvOjO83u3KCkG+d1pIlhRX2BzGvN0utEuyfbSjIlXfIRJDhBfDN9BW5wI1tiVTUYEfzVdodEqhn1bB6BsWA5HcGkq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903064; c=relaxed/simple;
	bh=akQy0nA4RouW3IvttBqxZe3LA+/hBr+rMTWxOGCeXjs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhLvVQcns7ekbw2wShD9H8j/Njx9cA0z/HLDlBcqUCVGAD80q94fp1uqY11FqO4mtKWuKzvpOP106+KbqZnfmQoUZacRM9zIN2JUFlR+SjUiZy+KdkPr6Nt082T5I4My+3xZR+LrQLhlOGhhKiANiFYRzsPYcvaw6aAGV2b09ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKa8E+Qy; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKa8E+Qy"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3965eab14cfso29340881fa.0
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 00:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780903061; x=1781507861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jscFxCCxssvigz9RJrtfrO4itUUhARrFWb6W3c3zi5o=;
        b=WKa8E+QyotgNJKMXtgX9XNnmLy4OQHNRNvkfpCi3rf7zLz0XL5ndBN5US1jp49br9I
         InYLDinY3XKHuY8wMmsfmo5y8rwGRXqiAO1sm3fj/OdmzOK8tmi7vwVC7qXrN7w9OfIk
         q5DwcVZQqxdpBH0b5SD4Iw6OkBSkgxvvgiuTaqKJrl/5yn4bGd4Xh9wkbV6nPCKMXT4M
         OTto3H53O9m6jzyZAlHBLdRlc+BttSJ8WW7ab1hr7nFbVfSKPgVCAzXciZI0EnYoBD9i
         ZDP3h3jaJRFXNI5TJmLAyIs7MPsohL+A2QIy4wsWpwIKGSx84NeTruMstJGLmMf3i0qC
         IvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903061; x=1781507861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jscFxCCxssvigz9RJrtfrO4itUUhARrFWb6W3c3zi5o=;
        b=P2z4hAUxoJ9+IeWEffY0gohY7pDlsENiGYAOenHKa8RnWYHVnl+y5iMKchENiRM7Vx
         vxV7iI3TA+4xvTt9ziOtvAFGeV570b7yzBlKe/2mB7cdW2TzU3CGGUvC3SHoxZBbmnc4
         XcLCrsiCHY44MvHUZodoztz7FPOPgmlHnKqn7nHzF7kiZAGJQMIHHyaRR3/pVU6C+2P9
         U7bGOAio7pqp6hMV76+KM2VR/c/7rGToN/REsnKVs2FvsIQgMTnWNZotYFHKFMC+ZWlg
         89ZKHSovnbMpHsAShct7mQ3NhkEzDpbCay3aDnf+RMNZtXExf7+2iKqC7fOgnhWTjtn8
         cY/w==
X-Forwarded-Encrypted: i=1; AFNElJ9lIcDdPUhj5okM0OaSrdyMDriLMuaV8XVyXBoHKLIzgHQTgT7tRpXkmkVXwXriQvEnQLZuZ6BQO7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVQ65ehrJAAwRledUFiNbdWORI0kA/z93ie0LAN6K6yNzoX+ND
	utEzwG/VvZyCm2t37g6O0aX70WpECHZgZf6zCFuV4nX0LwDAY9N4o88b
X-Gm-Gg: Acq92OElE8AUiWiOXIs6frhA32eXKBGTnQ98aQYcuYXc4zP4+SzYMZYZznAZmDr9gYD
	YA0g5EsI95KphnHh/iZl//NUnKHmHbEEvY23lU7+wRyTnBnDCybfVzmJK8++ho4xXNBGzn8031R
	5tamRmjLrdgqTAZi+aFrkouNL0qmUw0XNJ8BauiCiU79jRoZ9HwaqChlGzzp2uWDKRIhV8s9/ey
	pONLDMf315Oh5pE+da2DLSDl00RhwMmFf3w9g6LBGdcReaAGl45aOYZKNpUcD7WQSy6rcmI6WKv
	wYe9ilT/7wQBeKzWrrI1A6ifzu42aRkDOHHaHyYXlavVUfn+r+TDtZWnX7AxrJZ9fC/sbRR5ku2
	ijbBhSzdp4d0nKS1g0v95TPc3wxg3I7LNaBXxG7tnA0Whs4t3QtJxkkx8g9utfIye91ooRZ4Opt
	hVWwjX1YOvU9Yf0QUoRFR0s+jF+nU++0uo8tyJb0rhsJU=
X-Received: by 2002:a05:6512:1056:b0:5aa:71fd:de75 with SMTP id 2adb3069b0e04-5aa87bc9306mr4030020e87.39.1780903060827;
        Mon, 08 Jun 2026 00:17:40 -0700 (PDT)
Received: from foxbook (bgt94.neoplus.adsl.tpnet.pl. [83.28.83.94])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97a71fsm3646811e87.46.2026.06.08.00.17.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jun 2026 00:17:40 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:17:35 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
 sakari.ailus@linux.intel.com, katieeliu@tencent.com,
 johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn,
 limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com,
 vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, oneukum@suse.com,
 bence98@sch.bme.hu, eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration
 descriptor enumeration failure
Message-ID: <20260608091735.3a325cc7.michal.pecio@gmail.com>
In-Reply-To: <80bad7e6-239e-4b7c-a175-0ba170b7c883@rowland.harvard.edu>
References: <CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
	<20260531123843.736bd69a.michal.pecio@gmail.com>
	<3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
	<20260601084846.433bfc51.michal.pecio@gmail.com>
	<CAFgddh+dLnR=AuAU65sxqsxAgqLYX9i0OiX3Ys_sPH+YeZuHVw@mail.gmail.com>
	<20260602193047.5fe03b8d.michal.pecio@gmail.com>
	<49acc9dd-9d2e-4a37-9b41-de5e16445461@rowland.harvard.edu>
	<20260604125323.1bcb40d7.michal.pecio@gmail.com>
	<1996a7ac-2670-4124-b855-6fdf0c9999ad@rowland.harvard.edu>
	<20260607232535.74b935a2.michal.pecio@gmail.com>
	<80bad7e6-239e-4b7c-a175-0ba170b7c883@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 7 Jun 2026 21:34:37 -0400, Alan Stern wrote:
> On Sun, Jun 07, 2026 at 11:25:35PM +0200, Michal Pecio wrote:
> > Ipad is interesting because the single Device request must be a
> > high-speed optimization, or they hacked their xHC to ignore short
> > packets and keep reissuing IN tokens until the URB is filled.  
> 
> I would guess it's the former.  The only real reason for having a
> short request first is because for full-speed connections, the host
> doesn't know what the ep0 maxpacket length is until it sees the
> descriptor.

I wouldn't 100% rule out Apple being nuts enough to do the latter too
to squeeze out the last few ms of enumeration latency. But of course
it's impossible on any standard HC and only of academic interest.

I found that OSX 14 for Intel Macs in QEMU does an initial 8 byte
request at FS but omits it at HS and SS. And it uses the 9/wTotalLength
config sequence seen in iPad.

So they migrated away from 8/wTotalLength and it's interesting that
they chose to ape Linux rather than Windows. Is Android the new
Microsoft? The Windows scheme seems more efficient, its only drawback
being risk of buggy devices.

> > Linux has been doing the initial 8 or 64 byte read at LS and HS
> > since forever and I found no explanation besides nobody daring to
> > touch it.  
> 
> That's the explanation.  Originally Linux always did the 8-byte read.
> But some devices didn't like it, and we saw that Windows used a
> 64-byte read.  So we copied the Windows behavior, with a fallback to
> the original behavior (which is what the spec recommends) when
> needed.  Even for LS and HS, because that's what Windows does.
> 
> > Though I wonder if it wouldn't make sense to skip this at SS,
> > because Windows does (in my QEMU tests) and very likely Apple too.  
> 
> I'd be fine with that.  OTOH, if it's not broken, you don't need to
> fix it.

Actually it's partly broken - xhci-hcd completely ignores udev->ep0.desc
of SuperSpeed devices and uses 512 as per spec. So the request only
exists for its side effects, if any, and it's somewhat unique to Linux.

And of coures there are totally broken cases: devices which disconnect
when queried for BOS by Linux but don't disconnect on Windows (which
likely queries them too). And I have one device which returns broken
descriptors depending on how fast I insert the plug (seriously) and of
course it doesn't have this problem in Windows.

The former does look like something that descriptor request size and
ordering might fix, but I don't have that HW.

For the latter, I tried without high expectations nor any success yet:

e079d3125493 usb: core: Issue Set Isochronous Delay later
49475308741e usb: core: Fetch the Configuration Descriptor with 255 length
7606f13ab0d1 usb: core: Don't fetch SuperSpeed Device Descriptor twice

Currently I get a usb_choose_configuration() crash after moving the
usb_enumerate_device() call from usb_new_device() to hub_port_init()
to reorder it against BOS. Will need to investigate later.

Regards,
Michal
