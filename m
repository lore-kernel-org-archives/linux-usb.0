Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3383D5663
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 20:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961286; cv=none; b=eO55tRW9fz/9PtaM2xMc8v07XB1niplkHjvEzNUl5p5uMJWfkl09jZ9cmFXUnRzh9XRJxcKhrkp1WEzDWyZiqT327SHJ3S077jcgXG4+MxDChd/COtDyz5C+TtxyesGGyLsaspkNPBjvjrnaC+GRFRkz7lGc4AghBtXwcHrjffI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961286; c=relaxed/simple;
	bh=025KxuD6PwTRUWyQPCJjQls9734sb08TvsSxAb8Kd2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tKj1Gy1S4SPCqqOpWuBy+fE7F5E+lDPVXvCjGOd/Bh+0gbo5RT9i8zoTymWRyd4hTZwkEbErkSLkEr16KD5DbEovkRZUmJWBt8S0qhKc2loZGp+Tpm6EGvLs/7XU1ECRwnqRiWdOk6zCvpz2Ghv9txCW856nvwKdht0pdZzT6Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TS5W3Fp3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TS5W3Fp3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4957eefd361so10840705e9.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 13:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785961283; x=1786566083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1LutD9KJslfWq8n/uPjMY37VpNsYJ5glDq8kQAaMDa0=;
        b=TS5W3Fp3pXIBQmUCNtMFJIbyIHqvlbIMFIxs0T44x6y3G3mjMYwur2+vcdxmMLBOtG
         wJltDO+1837e/LA3ULMMi9GBvCENW1gjFqEzUlG2dj9MfDgeNnFOrkXBuKcaaludSvZQ
         vBMABPUH0dpHcnO5HUoWjGppHwF66AHtqxWdSIS9urRPnAN/RAgFV4HQOh87AWLun+KU
         MSbjUmD7nEHMsMQOeOVFBQHa4IRM42BUsuW6JPi4sgD3WAWLp380wv4Jl8N/fi+NA8ML
         vFiNmR2+Vcf7EbyHf0epwqUJFuK0B8M25k9mtgTIcwOZKaPVzFGWSCW3BeXWWiArUGDM
         y/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785961283; x=1786566083;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LutD9KJslfWq8n/uPjMY37VpNsYJ5glDq8kQAaMDa0=;
        b=aBZVziHTxjTstQMoAIlzLnW+m+LKiSm32aRNNPX9zeiXmrG9ZYMBM12dTK6V+MXso7
         bH8eaEwqwFWM5WDSUGAlceQ16NX4NukE1+5BYTg8DFRWYQjczINmiHWIQiQWM0p7Q8a2
         PhBOMjG4FESQ5+hWxBrzQzYTIauKjvxQ4WK2IcX3QwBAAx0NzO0Eg8XnrHUobWO4ZeIw
         8VIj9s6INIBSQdkwGu83pXWutwR/jy36kuRVdN/U5IoJN/0aCrf6aq658US89JtY7+2r
         kMa20T5NpUQAe4MVKnhycpKhRmbSZ1Zelp/YVNDN3LQ4qziiD+jAWWYgw0Kbzag7mVFT
         NL7g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/X8325JO9nLL4EKerqmHrderPomHuxyDgKGGA8gMr+SpTdIsxPnIy6gBAOsJcBzOphnevAly5kPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpwjCrE6yvR0nOvHPLfavjlqsV66kt4fhDFb/42Bc5+tFMT0Ln
	SGnl+dT6bA9fF1Qvmu07K4AaQ4u1aPAWVrs0eMsdCoifVkiE+CFivL4PMCOccA==
X-Gm-Gg: AR+sD10OJz3s9OnA0ec+d8pfrfUUWCgO6Mzo3/5Pb0zuXDxE1Ux19bdKp4k/PxbVbHB
	RVR7OOs9cSCpUCVx3qfBjO0/jFamjt3kKc6C+ohLCa8xwElx4buxGde+cMGa+lvuUZcCM+9tSNl
	E8SztzZi+I7kWU/kANzJlsNmzJFiHtSYkdSK4P+4zRhb7ku94DLfXc8K19zUHPvHtGjjD2ebRrn
	C+wS/af/2u7dgw8KHTh6CFhQraQpUyOY9fQ/P2PxA2o9SzFqiMsiwLmOVNjNaD+wW0B5FlRaeix
	xdZArh6XYX8Ex0Pwm0QZhaMzjkUo3xN8Az1BcQIPTutqix6DVy0YEWyG4/XfDZIDFWz0ZbAxSZ8
	nmjGcbZMneo8G4bJawv30rt21TDsifF0NzmloZahFQIBa9d7VQju79ALIF39wZ70C8BKSP+dCKI
	80fp1hy4NRV0mpn4yFPgbF9CmXKXpOFpS2RmNCEVd6Tfen3vrhilvFOPN+99RgwIWlNzDTacS4
X-Received: by 2002:a05:600c:529b:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-4994e71d3e5mr138156865e9.8.1785961283471;
        Wed, 05 Aug 2026 13:21:23 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b31975sm6619f8f.33.2026.08.05.13.21.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 05 Aug 2026 13:21:23 -0700 (PDT)
Date: Wed, 5 Aug 2026 22:21:20 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Bart Nagel <bart@tremby.net>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] xhci: Sort out the TD skipping business
Message-ID: <20260805222120.755c1f27.michal.pecio@gmail.com>
In-Reply-To: <anOIxkp6qT3Qu3A2@spiral>
References: <20260804120110.01bda0e2.michal.pecio@gmail.com>
	<anOIxkp6qT3Qu3A2@spiral>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Aug 2026 12:06:48 -0700, Bart Nagel wrote:
> At 2026-08-04 12:01:10 +0200, Michal Pecio wrote:
> ...
> > Additional testing of patch 1 in isolation would be appreciated from
> > the reporter of the regression (Cc). That patch would go to v6.18.  
> 
> That's me! I'm new here so please forgive me if I'm asking stupid
> questions:
> 
> I found the patch applies cleanly to the linux-6.18.y branch in the
> stable repo; am I in the right place?

That's fine, there were hardly any changes in this area this year
so 6.18 should be about equivalent to any 7.x. And it's the only one
of them which will stay supported (here) for a few years.

> And then am I looking for anything in particular in the logs while
> running it, or do you simply want an observation on whether I can
> reproduce the bug or not?

At this point just see if it works. These patches don't affect HW
behavior, they only ignore bogus events to avoid creating problems.
And this patch should ignore every case ignored by the old one.

Regard,
Michal
