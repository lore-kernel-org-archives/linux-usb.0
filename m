Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04EC3546E6
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 17:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114342; cv=none; b=FNFsQ1gQaHgcgv2z2d1lRBb3yhSX7xK5KtsNVe0Wk1ELA7/3H1P5VFLhW+Yk7esTEanooYINR+DJ5b8mK/LucCNpruQVFoDxN4ZUvpIQ83psiBTGKhj92CvBYuChZPnhgJw3OACmPcy0DtKJGfFIKA54G/JLELhRSCu+71r0CVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114342; c=relaxed/simple;
	bh=rjDwk63GlpD6IcSyJ6iGWBTG0j4qGvoDZhdWCYjXdCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuOqQcaqK8HjcWpT6A+SyDGzt1A83IBWlRiVTcONAYgd+U4PqTfC8uljuIz5L5EJW/vwx57FdX2VBvi37ExTcKGHrFgFQ7ra7zyC9l24Z8NtKM897ZJm9eFwP5Bvx1B3CT0DCXaRVdY7PBbnf9p9JVsjtRorB6mntRjME/pWfVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eQdS6bnK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eQdS6bnK"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf2911f93cso9455ad.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 10:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781114340; x=1781719140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDcoxqooq3aEAqC8ohG0LuHtDb4TZolRXl4+Rn70IsU=;
        b=eQdS6bnKf8OFjYdZWTGgi6/DB/Hk2p7zbEYwc/MsYJpMNpd5U/+hJIeUFJMhgboGdC
         qIEibdadVSNL99aVgECMz5I666Z/PbQYqOi2NnWTsve9F2964/SBEquLWuJiSEjTgZQK
         fC4FvZCzWIZPtiImHSf3QQvzaM72vUWxewuGI2j4GP1aQjoTtSRNPtEbLbdZ3qjLWaEW
         0doAE+5G0hN30YpVfya2FQ/6/pNCRtxqQjgJ0hRRG/Cyn+SQzmAEiS/R8TwXkCT7WEtV
         DnMXQ7eQxGfwQi+Sh+TiylbqIuI9t9Z2EUdnzzX0tGJfPv3dYpbyaoI0qG1556njWiIE
         +Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114340; x=1781719140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDcoxqooq3aEAqC8ohG0LuHtDb4TZolRXl4+Rn70IsU=;
        b=qRApQUACs9+gSTOnCEAkbTjDJaih8nn4NU3eYvaE7aKp9F/s1OaTzKRdwB4++YJvxw
         pYgSuhBTDSqSGCeijvf1Go1iv9ujpgZkQ0Uba9NFGjstDKKzi8YyXOrRCnDoVfgNiluu
         OgtuNfanrDkfCJ7B9ZyBmyG+KNvhn5hU7y6/JukyWT1uuxBt/l5iYftl1U5Vp1K+H6E/
         kwUUyNowivxS9ajSJMePciyGbLqpa897rApgK2rLvJ9udAMw5to40SDh/XpkJvoDpo4b
         wsGfAa4zQF0T4U8AlcssnXJtIyfjP4sXWLUB/ScbWBJOOgeMwS7snlntXi3e6wwXnHOC
         X/+g==
X-Forwarded-Encrypted: i=1; AFNElJ8KzqoU/B7LLWgNMA3JKt8xR6/et3vL47z3dEMoPosRuFZUffsQqCOe+wwZ+dQgeP+2tZBgJ5V411Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAhfiyAz5rdyHeEMHae8VdjMTS8Kbj5v8SgjPNMq85DMF9nwvg
	RBc+L/DNvNUMF2/U4lhhpZiZWOdOihq46963n17iEquBYkGWGO1SAbYgpMvookHmBw==
X-Gm-Gg: Acq92OERkAE5velvivU4WGNToJWyk/91Fg5J6sMa6TIRRzrJQ08/6B9KdH9PRlzLBai
	49aS8UBPDfAVFj0P69KzbfQsFoyhX05n7xaVuTFaapH2yaIccBBimPZ86lHb1NfnM3ZUzZ72BXK
	nBgX34NDVYF5fC/rQRynHPC5e/m0wjc3uHA8o2oMFbsdX2ZqURk3Sr0lHm47WDyhAW2wl6La/qK
	xvvXcNGMG57fUcBiCRHj1PZOBLMRKW3Yqy2CFUW5eWXJRJbQQsDF2hqsz3w3jRy0oZ1RX5mNO/o
	RdmS8grg2SAV0O7pwlyDyT+LhGKIKLKligMuDMT5+zDwU90yiKyv9D7Xv5Z1kpW0Jtzoey1HQzN
	u+H6sxlyuYt0PMQ+moWylLzPX/4GEI9moGJ7Z2KPkATpbtsWvlQV6CmkabL8ENL4VghZ0Kjsq+b
	gMbYeQQKTrsYlXhonV25hfsOazlNZUTWlITG9Zj45hLRj18eKm5PtuueTP0HiT1MhlHi2VRx8V5
	sG5/PgIfP/UBzsAmu1OYbw9JfXZE54969W4el03SjYWwAhFKpvz6S0L
X-Received: by 2002:a17:902:e84e:b0:2bf:749:551 with SMTP id d9443c01a7336-2c2d93c9b9cmr564445ad.22.1781114339342;
        Wed, 10 Jun 2026 10:58:59 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221a7e9sm33046676b3a.11.2026.06.10.10.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:58:58 -0700 (PDT)
Date: Wed, 10 Jun 2026 17:58:54 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Sasha Levin <sashal@kernel.org>
Cc: gregkh@linuxfoundation.org, stable@vger.kernel.org, khtsai@google.com,
	patches@lists.linux.dev, linux-kernel@vger.kernel.org,
	raubcameo@gmail.com, andrzej.p@samsung.com, balbi@ti.com,
	kyungmin.park@samsung.com, linux-usb@vger.kernel.org,
	Jianqiang kang <jianqkang@sina.cn>
Subject: Re: [PATCH 6.6.y] usb: gadget: f_ncm: Fix net_device lifecycle with
 device_move
Message-ID: <aiml3pDOjudjX71j@google.com>
References: <20260608053636.2797024-1-jianqkang@sina.cn>
 <20260608-stable-reply-0013@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-stable-reply-0013@kernel.org>

On Mon, Jun 08, 2026 at 08:51:59PM -0400, Sasha Levin wrote:
> > [PATCH 6.6.y] usb: gadget: f_ncm: Fix net_device lifecycle with device_move
> 
> I can't take this one (6.6 or 6.1) on its own. ec35c1969650 alone opens a
> userspace-reachable NULL deref in eth_get_drvinfo() that is later closed
> upstream by e002e92e88e1 ("usb: gadget: u_ether: Fix NULL pointer deref in
> eth_get_drvinfo"), so applying this commit by itself trades a UAF for a DoS.
> 
> Please send a complete backport that also includes e002e92e88e124 (as the
> follow-up patch in the same series) for both 6.6.y and 6.1.y, and I'll queue
> them together.

I just ran this patch plus a cherry-pick of e002e92e88e1 that you
mentioned through Android's CI with no issues. Same goes with 6.1.y, so
I can send Jianqiang's backports with the fix added to them.

Cheers,
--
Carlos Llamas
