Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89E53128B8
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 18:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040898; cv=none; b=fwcCAj8pObBbpR3ijiqa2cbaZLn3Vs7ZutShb40/IxY2Kz49OLWppe+w4dpFUJ8FM3/EnYybDNQSA/SXfUPSxbEqCxUZFxuI0XAc43W5BX/QThgpidcB5dPFwk1THrhzQjWcrfUU7jYM9S3zgauqTPX6mEA2yUCpJA8IrRJxqeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040898; c=relaxed/simple;
	bh=SYkUulLCTTEyk768tLWwxLhb6K7u5DLlhv2FWFXiWr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7T3cgKe5PY5d/QjbVD0OD0/ue8zAA8zr145bfrenMHqYt8v3rQxfOE0cYu3jts2psbI5G+9jMdv3XhtnWMDmjW0bRcFfAmCBY42YuP571nzFbUzTKBDhXY+plUniRiABCgUG3LmKboYWi5piZUHwWvgVszcWFGdb+Gz6/xqYyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net; spf=pass smtp.mailfrom=tremby.net; dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b=DhhYhvRH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tremby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b="DhhYhvRH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-848643382fcso2885701b3a.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 11:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tremby-net.20251104.gappssmtp.com; s=20251104; t=1786040896; x=1786645696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nIA+kt2Uz/sT3eBSIzH2S7ldzovjZod5CRF0nLRKKB4=;
        b=DhhYhvRH9tNb9JrQXmJg2g5f0XMK8Px1L6jqUmUWwZntvZMtJbgsBCZFKs0TP24+oK
         nUVLt/1A1YduPf1STSsfRsLkJk5MZD9EKxeDlG4EGHB4n6QrJKyHoivnOpR+6h4WTXOT
         w4ITb7haKgpNkB5r+mhoj0soEKNzvLp9s+EVEefafWkt3DYtd3LJfRkIiFsoIloWY3Pk
         eXQtIolVjs9X/Qm6Bry4VAj1vqAkn0s80x/V9s1odUyNppkP/Bfngrtk2ZSYqfEQAX1x
         PdMoCxynHBhYxuh91sOuPrBVc1jHUDJreonOpByyCNZa0Nd9CQbFHKyRl1ymDrT62QoZ
         khGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040896; x=1786645696;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nIA+kt2Uz/sT3eBSIzH2S7ldzovjZod5CRF0nLRKKB4=;
        b=oPd+Lv5cVeeU7Z2jWCvvsv0Sh+YRXlrssCKioipXio+hSM0+Uw+xSQhg4bUBkKTZu6
         stfSZ2c6Ku/0CKOfFBZWp9M8GMud//yE+nOlvOaV4mMoBsFs1yPvUUYE747HUdOTMin7
         JZjOK/YH6HfhrUat5lQFeTgsgcwQgf8nrZEiByuRnnrgFvRIL4cw/gMiG5Wq0/hb//1j
         FIdlPJN4sqVLN0TEf4O9vJOzW015W26wx02JqcXkWfzBwczo91KHrXuPt+nPYBV21vHH
         q8WzDCYTnywSWtyaBN9aYQ5TScEG0xI9bqVZnlFYkYTd2wZLPgWhqccMgaCg/Wy1Bvk5
         FQMA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0kwI536g20DsKHkDhdtc3lSdlmANR3VUAARksxuOfDBjCt1kUxVSbS68Kv7uBw5MueWiwBotPCMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2WqFAGqKk+gMO1ln50oOoPRSwctGcgTbLWt8Z0aVrfRx7Wfwq
	c1gXQXe0CcUehWouTjT6reaXf+OyifkBDv20XXs2Tn9s43uEp/UgWDzKVzJaD6TWEXw=
X-Gm-Gg: AR+sD132US2uru7JhxIobRo2rEn8hZoY3eaLSCbrEGBtvkcYaDaQakpN9VxmYO79DQ/
	BTeWwibR793uv+qU0CFYF23S9mWcfWTbUrz//mmWnWa3l+FZ7CSuxzgRjPWmClzFefApllK7HFN
	RhuHuAUbElJlwEBA+SxgMza24GV40738XxqIOiGvCAOveuYipYB1j7FNUY4Mcv9U7/1gg4SoF0z
	MmgouiWAU1tk3ek2NrpBMgSMHa4r2vXbBxJB1Xi+5XA9aBwud/SZoeLtqGSpDPLwMDy9dwUIgT5
	tBNQ84PMQj1pv3G7Kiq6AGQuuZfI8C1iNFggz7vomz+Akogi6MfmF6YXsmINkUCnUgkHask87ka
	+iC/5ao8dT66M6ObAThw9HXLH/D6PqEBv1nzJdt4/aD+lDGocwCGGIcyW5THAF6IbSqmXbvnOR2
	HcncV28Z4XmUyJTK6H8zQv+goXA1wCn8aQDDpcZ50SrUxus4BcSaa3V6q5+bFV1w9w+BKpoG7Qh
	OkSUqfkL0J3RYTAUiLf38HLbpfFfI07dkEpOilc2JrdApJni35TCy5jkrvLkcbA5A==
X-Received: by 2002:a05:6a00:3d12:b0:842:708f:39be with SMTP id d2e1a72fcca58-84f2dff7a22mr19148273b3a.5.1786040896025;
        Thu, 06 Aug 2026 11:28:16 -0700 (PDT)
Received: from localhost ([2605:1700:2080:8400:5d4e:4e8:103e:40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc5696sm1857672b3a.53.2026.08.06.11.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:28:15 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:28:13 -0700
From: Bart Nagel <bart@tremby.net>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] xhci: Sort out the TD skipping business
Message-ID: <anTRDVPz_yGFuknl@spiral>
Mail-Followup-To: Michal Pecio <michal.pecio@gmail.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804120110.01bda0e2.michal.pecio@gmail.com>
 <anOIxkp6qT3Qu3A2@spiral>
 <20260805222120.755c1f27.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805222120.755c1f27.michal.pecio@gmail.com>

At 2026-08-05 22:21:20 +0200, Michal Pecio wrote:
> On Wed, 5 Aug 2026 12:06:48 -0700, Bart Nagel wrote:
> > At 2026-08-04 12:01:10 +0200, Michal Pecio wrote:
> > ...
> > > Additional testing of patch 1 in isolation would be appreciated from
> > > the reporter of the regression (Cc). That patch would go to v6.18.  
> > 
> > That's me! I'm new here so please forgive me if I'm asking stupid
> > questions:
> > 
> > I found the patch applies cleanly to the linux-6.18.y branch in the
> > stable repo; am I in the right place?
> 
> That's fine, there were hardly any changes in this area this year
> so 6.18 should be about equivalent to any 7.x. And it's the only one
> of them which will stay supported (here) for a few years.
> 
> > And then am I looking for anything in particular in the logs while
> > running it, or do you simply want an observation on whether I can
> > reproduce the bug or not?
> 
> At this point just see if it works. These patches don't affect HW
> behavior, they only ignore bogus events to avoid creating problems.
> And this patch should ignore every case ignored by the old one.

OK, I ran it with high system load (which as discussed earlier made
the bug pop up more readily) for a little over 12 hours, and no
freeze.

In case logs are interesting, they are temporarily (~48h) here:

dmesg log with handle_tx_event, but with "spurious event" messages
filtered out otherwise the file is 400 times the size:
https://tmpfiles.org/wvw5Fxo00DQt/dmesg-6.18.42-patch-2026-08-04-no-spurious.txt

Filtered debugfs trace as directed by Michal earlier in the process:
https://tmpfiles.org/w2wTFcoQ02zV/trace-6.18.42-patch-2026-08-04.txt

Thanks for all your work.
